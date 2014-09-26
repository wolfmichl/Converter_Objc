default: compile

compile: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.0 clean build

