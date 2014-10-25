#import "ConverterController.h"
#import "Numberpad.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (nonatomic) Numberpad *numberpad;

@end

@implementation ConverterController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = self.numberpad.displayValue;
}

-(Numberpad *)numberpad {
	if (_numberpad == nil) {
		_numberpad = [[Numberpad alloc] init];
	}
	return _numberpad;
}

- (IBAction)buttonTouched:(id)sender {
	[self.numberpad numberTouched:[sender tag]];
	self.displayLabel.text = self.numberpad.displayValue;
}


@end
