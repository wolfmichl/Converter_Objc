#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#import "ViewController.h"
#import "HasTargetAndAction.h"

static const NSInteger ButtonViewTag = 200;

@interface NumberpadTest : XCTestCase

@end

@implementation NumberpadTest {
	ViewController *_viewController;
}

- (void)setUp {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ViewController class]]];
	_viewController = [storyboard instantiateInitialViewController];
}

- (void)testButtonsHaveTargetAndActionSet {
	UIView *buttonView = [_viewController.view viewWithTag:ButtonViewTag];
	for (NSInteger tag = 0; tag < 16; tag++) {
		UIButton *button = (UIButton *) [buttonView viewWithTag:tag];
		assertThat(button, hasTargetAndActionForEvents(_viewController, @"buttonTouched:", UIControlEventTouchUpInside));
	}
}

@end
