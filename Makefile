default: compile

compile: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.1 -derivedDataPath build clean build

test: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.1 -derivedDataPath build -destination 'platform=iOS Simulator,name=iPhone 6' test

test_with_result: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.1 -derivedDataPath build -destination 'platform=iOS Simulator,name=iPhone 6' test 2>&1 | ocunit2junit

deploy:
	ipa build -d build

spec:
	frank build
	cd Frank; cucumber
