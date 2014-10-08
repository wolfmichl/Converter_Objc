default: compile

compile: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.0 -derivedDataPath build clean build

test: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.0 -derivedDataPath build -destination 'platform=iOS Simulator,name=iPhone 6' test

deploy:
    ipa build -d build
    ipa distribute:sftp --host ws.udag.de -u 86137.webmaster -p 2er-7gh-4tr -f build/Converter.ipa -d build/Converter.app.dSYM.zip -P "itagiledeploy.de/1"