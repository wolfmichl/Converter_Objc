#import "ConverterController.h"
#import "Numberpad.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (nonatomic) Numberpad *numberpad;

@end

@implementation ConverterController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
}

- (Numberpad *)numberpad {
	if (_numberpad == nil) {
		_numberpad = [[Numberpad alloc] init];
	}
	return _numberpad;
}

- (IBAction)buttonTouched:(id)sender {
	[self.numberpad buttonTouched:sender];
	self.displayLabel.text = [self.numberpad currentValue];
}


@end
