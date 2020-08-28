flutter_generate () {
	flutter pub get
	flutter packages pub run build_runner build --delete-conflicting-outputs
}
flutter_generate_watch () {
	flutter pub get
	flutter packages pub run build_runner watch --delete-conflicting-outputs
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

flutter_new_package() {
	if [ $# -ne 1 ]; then
		echo "flutter_new_package <name>"
		return 1
	fi

	echo ""
	echo "{{{ CREATING PACKAGE FROM TEMPLATE }}}"
	flutter create --template=package $1
	cd ./$1

	echo ""
	echo "{{{ INITIALIZE REPO }}}"
	git init

	echo ""
	echo "{{{ CLEAR README }}}"
	echo "#$1" > README.md

	echo "{{{ COMMIT INIT }}}"
	git add .
	git commit -m "Init"

	echo ""
	echo "{{{ ADD REMOTE }}}"
	repo=git@github.com:ltOgt/$1.git
	git remote add origin $repo
	git push --set-upstream origin master && return 0

	echo ""
	echo "please create repo at $repo"
	echo -n "done? [y/n] "
	read response
	if [[ $response == "y" || $response == "Y" ]]; then
		git push --set-upstream origin master
		return 0
	fi
	return 1
}

alias flutterweb='/home/omni/repos/flutter_web/flutter/bin/flutter'
