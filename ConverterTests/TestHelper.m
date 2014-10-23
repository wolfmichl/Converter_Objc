#import "TestHelper.h"
#import "ConverterController.h"

@implementation TestHelper {
}

+ (ConverterController*) getRootViewController {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ConverterController class]]];
	ConverterController *viewController = [storyboard instantiateInitialViewController];
	[viewController loadView];
	return viewController;
}

@end