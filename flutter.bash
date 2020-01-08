flutter_generate () {
	flutter packages pub run build_runner build
}
flutter_generate_watch () {
	flutter packages pub run build_runner watch
}
flutter_build_apk () {
	build_file=./lib/build/build_mode.dart
	if [[ -f "pubspec.yaml" ]]; then
		if [[ -f "$build_file" ]]; then
			echo ".. changing to deploy mode"
			echo "const bool DEPLOY_MODE = true;" > $build_file
			_flutter_build_apk
			echo ".. changing to developp mode"
			echo "const bool DEPLOY_MODE = false;" > $build_file
		else
			_flutter_build_apk
		fi
	else
		echo "pubspec.yaml not found."
		echo "wrong directory?"
	fi
}

_flutter_build_apk () {
	flutter clean && flutter build apk
}
