default: compile

compile: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.0 -derivedDataPath build clean build

test: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.0 -derivedDataPath build -destination 'platform=iOS Simulator,name=iPhone 6' test

deploy:
	ipa build -d build

spec:
	frank build
	cd Frank; cucumber
