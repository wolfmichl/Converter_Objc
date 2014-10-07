#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "TestHelper.h"

@interface ViewControllerTest : XCTestCase

@end

@implementation ViewControllerTest

- (void)testHasDisplayLabelConnected {
	ViewController *viewController = [TestHelper getRootViewController];
	UILabel *label = viewController.displayLabel;
	XCTAssertNotNil(label);
}

- (void)testInitializesDisplayWithZeroOnLoad {
	ViewController *viewController = [TestHelper getRootViewController];
	[viewController viewDidLoad];
	XCTAssertEqualObjects(viewController.displayLabel.text, @"1");
}

- (ViewController *)getRootViewController {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ViewController class]]];
	return [storyboard instantiateInitialViewController];
}

@end
