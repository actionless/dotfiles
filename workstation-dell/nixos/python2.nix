with import <nixpkgs> {}; {
	py2Env = stdenv.mkDerivation {
		name = "py";
		buildInputs = [
			stdenv

			git
			mercurial

			python27Full
			python27Packages.virtualenv
			python27Packages.pip
			libffi

      fish
      inetutils

      dbus
      dbus_tools
		];
    /*shellHook = "fish";*/
		LD_LIBRARY_PATH="${libffi}/lib";
	};
}
