# pkgs/herb/default.nix
{ pkgs ? import <nixpkgs> { } }:

let
  src = ./.; # Path to your npm project
  packageLock =
    builtins.fromJSON (builtins.readFile (src + "/package-lock.json"));

  deps = builtins.filter (p: p != null) (builtins.map (name:
    if name == "" then null else builtins.getAttr name packageLock.packages)
    (builtins.attrNames packageLock.packages));

  tarballs = map (p:
    if builtins.hasAttr "resolved" p && builtins.hasAttr "integrity" p then
      pkgs.fetchurl {
        url = p.resolved;
        hash = p.integrity;
      }
    else
      null) deps;

  filteredTarballs = builtins.filter (x: x != null) tarballs;

  tarballsFile = pkgs.writeTextFile {
    name = "tarballs";
    text = builtins.concatStringsSep "\n" filteredTarballs;
  };

in pkgs.stdenv.mkDerivation {
  inherit (packageLock) name version;
  inherit src;

  buildInputs = [ pkgs.nodejs ];

  dontCopyLocalSources = true; # Critical to avoid read-only files

  buildPhase = ''
    # Create a writable directory *within* the build sandbox (NIX_BUILD_TOP)
    # This is where npm ci will run and be able to write freely.
    mkdir -p $NIX_BUILD_TOP/npm-project-root
    cd $NIX_BUILD_TOP/npm-project-root

    # Copy only the package metadata that npm ci needs.
    # These files will be writable because they are copied into the writable sandbox.
    cp $src/package.json .
    cp $src/package-lock.json .

    export HOME=$PWD/.home
    export npm_config_cache=$PWD/.npm

    # No need for rm -rf node_modules here because npm ci starts clean

    while read package; do
      echo "caching $package"
      npm cache add "$package"
    done <${tarballsFile}

    npm ci # Installs dependencies from the cache using the lockfile
  '';

  installPhase = ''
    # Create the full path for the scoped package
    mkdir -p $out/lib/node_modules/@herb-tools/

    # Copy the 'language-server' package into the @herb-tools directory
    # This results in: $out/lib/node_modules/@herb-tools/language-server/
    cp -r $NIX_BUILD_TOP/npm-project-root/node_modules/@herb-tools/language-server $out/lib/node_modules/@herb-tools/

    mkdir -p $out/bin
    ln -s $out/lib/node_modules/@herb-tools/language-server/bin/herb-language-server $out/bin/herb-language-server
  '';
}
