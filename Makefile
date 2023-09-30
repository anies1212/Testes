.PHONY: setup
setup:
	export PATH="$$PATH":"$$HOME/.pub-cache/bin"
	dart pub global activate fvm
	fvm install
	fvm dart pub global activate melos
	fvm flutter pub get
	fvm dart pub upgrade
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	dart pub global activate mason_cli
	mason get

.PHONY: clean
clean:
	fvm flutter clean

.PHONY: build run
build run:
	fvm dart pub upgrade
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: pub
pub:
	fvm flutter pub get