with import <nixpkgs> {}; {
	py3Env = stdenv.mkDerivation {
		name = "py";
		buildInputs = [
			stdenv
			git
			mercurial
			python34
			python34Packages.virtualenv
			python34Packages.pip
			libffi
		];
		LD_LIBRARY_PATH="${libffi}/lib";
	};
}

# vim: ft=conf:
