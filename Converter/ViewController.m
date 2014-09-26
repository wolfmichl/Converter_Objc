#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
}

- (IBAction)buttonTouched:(id)sender {
	NSLog(@"button touched with tag %ld", (long)[sender tag]);
}


@end
