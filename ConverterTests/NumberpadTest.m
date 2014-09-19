#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"
#import "ViewController.h"

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
	for (NSInteger tag = 0; tag < 16; tag++) {
		[self checkButtonWithTag:tag];
	}
}

- (void)checkButtonWithTag:(NSInteger)tag {
	UIView *buttonView = [_viewController.view viewWithTag:ButtonViewTag];
	UIButton *button = (UIButton *) [buttonView viewWithTag:tag];
	NSArray *actions = [button actionsForTarget:_viewController forControlEvent:UIControlEventTouchUpInside];
	assertThat(actions, hasItem(@"buttonTouched:"));
}

@end
