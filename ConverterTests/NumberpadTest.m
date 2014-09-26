#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "TestHelper.h"

@interface NumberpadTest : XCTestCase
@end

@implementation NumberpadTest

- (void)testAllButtonsHaveTargetActionApplied {
	ViewController *viewController = [TestHelper getRootViewController];
	for (int tag = 0; tag < 20; tag++) {
		[self checkTarget:viewController action:@"buttonTouched:" forButtonWithTag:tag];
	}
}

- (void)checkTarget:(ViewController *)viewController action:(NSString *)action forButtonWithTag:(NSInteger)tag {
	UIView *numberpadView = [viewController.view viewWithTag:200];
	UIButton *button0 = (UIButton *) [numberpadView viewWithTag:tag];
	NSArray *actions = [button0 actionsForTarget:viewController forControlEvent:UIControlEventTouchUpInside];
	XCTAssert(actions.count > 0);
	XCTAssertEqualObjects(actions[0], action);
}

@end
