#import "TestHelper.h"
#import "ViewController.h"

@implementation TestHelper {
}

+ (ViewController*) getRootViewController {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ViewController class]]];
	ViewController *viewController = [storyboard instantiateInitialViewController];
	[viewController loadView];
	return viewController;
}

@end