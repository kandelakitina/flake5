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

  buildPhase = ''
    export HOME=$PWD/.home
    export npm_config_cache=$PWD/.npm
    mkdir -p $out/js
    # Copy only necessary files, excluding node_modules to avoid permission issues
    cp -r $src/{package.json,package-lock.json} $out/js/
    # If there are other source files (e.g., actual server code, src directory)
    # cp -r $src/lib $out/js/lib # Example for other source files
    # cp -r $src/bin $out/js/bin # Example for bin directory if it contains scripts

    cd $out/js

    # Remove any pre-existing node_modules or .bin if they were accidentally copied
    # This might not be strictly necessary if we only copy package.json/lockfile,
    # but it acts as a safeguard.
    rm -rf node_modules .bin

    while read package; do
      echo "caching $package"
      npm cache add "$package"
    done <${tarballsFile}

    npm ci # Installs dependencies from the cache using the lockfile
  '';

  installPhase = ''
    mkdir -p $out/bin
    # The actual path to the executable might be different.
    # Check $out/js/node_modules/@herb-tools/language-server/ after npm ci if this fails.
    ln -s $out/js/node_modules/@herb-tools/language-server/bin/herb-language-server $out/bin/herb-language-server
  '';
}
