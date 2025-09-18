# pkgs/herb-linter/default.nix
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
    name = "tarballs-linter";
    text = builtins.concatStringsSep "\n" filteredTarballs;
  };

in pkgs.stdenv.mkDerivation {
  inherit (packageLock) name version;
  inherit src;

  buildInputs = [ pkgs.nodejs ];

  dontCopyLocalSources = true; # Critical to avoid read-only files

  buildPhase = ''
    mkdir -p $NIX_BUILD_TOP/npm-project-root
    cd $NIX_BUILD_TOP/npm-project-root

    cp $src/package.json .
    cp $src/package-lock.json .

    export HOME=$PWD/.home
    export npm_config_cache=$PWD/.npm

    while read package; do
      echo "caching $package"
      npm cache add "$package"
    done <${tarballsFile}

    npm ci # Installs dependencies from the cache using the lockfile
  '';

  installPhase = ''
    # Create the @herb-tools directory first
    mkdir -p $out/lib/node_modules/@herb-tools/

    # Now copy the 'linter' package into the @herb-tools directory
    # This results in: $out/lib/node_modules/@herb-tools/linter/
    cp -r $NIX_BUILD_TOP/npm-project-root/node_modules/@herb-tools/linter $out/lib/node_modules/@herb-tools/

    mkdir -p $out/bin
    # The symlinks will then correctly point into this structure
    ln -s $out/lib/node_modules/@herb-tools/linter/bin/herb-lint $out/bin/herb-lint
    ln -s $out/lib/node_modules/@herb-tools/linter/bin/herb-lint $out/bin/herb-linter || true
  '';
}
