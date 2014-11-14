#import "ConverterController.h"
#import "Numberpad.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (nonatomic) Numberpad *numberpad;
@property (nonatomic) CurrencyRateUpdater *currencyRateUpdater;

@end

@implementation ConverterController {
	NSString *_currentCurrency;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	_currentCurrency = @"EUR";
	self.displayLabel.text = @"0";
}

- (Numberpad *)numberpad {
	if (_numberpad == nil) {
		_numberpad = [[Numberpad alloc] init];
	}
	return _numberpad;
}

- (CurrencyRateUpdater *)currencyRateUpdater {
	if (_currencyRateUpdater == nil) {
		_currencyRateUpdater = [[CurrencyRateUpdater alloc] init];
		_currencyRateUpdater.delegate = self;
	}
	return _currencyRateUpdater;
}

- (void)currencyRateUpdater:(CurrencyRateUpdater *)updater didUpdateRate:(NSNumber *)rate forCurrency:(NSString *)isoCode {
	NSNumber *converted = @([rate floatValue] * [self.numberpad.currentValue floatValue]);
	NSString *newValue = [converted stringValue];
	self.displayLabel.text = newValue;
	_currentCurrency = isoCode;
	self.currencyLabel.text = _currentCurrency;
	self.numberpad.currentValue = newValue;
}

- (IBAction)buttonTouched:(id)sender {
	[self.numberpad buttonTouched:sender];
	self.displayLabel.text = [self.numberpad currentValue];
}

- (IBAction)convertButtonTouched:(id)sender {
	NSString *targetCurrency;
	if ([_currentCurrency isEqualToString:@"EUR"]) {
		targetCurrency = @"USD";
	} else {
		targetCurrency = @"EUR";
	}
	[self.currencyRateUpdater updateConversionRateForCurrencyFrom:_currentCurrency toCurrency:targetCurrency];
}

@end
