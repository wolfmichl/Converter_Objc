#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (IBAction)buttonTouched:(id)sender {
	NSLog(@"button touched with tag %ld", (long)[sender tag]);
}


@end
