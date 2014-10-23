#import "ConverterController.h"
#import "Numberpad.h"

@interface ConverterController ()

@end

@implementation ConverterController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
}

- (IBAction)buttonTouched:(id)sender {
	NSLog(@"button touched with tag %ld", (long)[sender tag]);
	[self.numberpad numberTouched:[sender tag]];
}


@end
