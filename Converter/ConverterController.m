#import "ConverterController.h"
#import "CurrencyRateUpdater.h"

@interface ConverterController ()

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;

@end

@implementation ConverterController {
	CurrencyRateUpdater *_updater;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.displayLabel.text = @"0";
	_updater = [[CurrencyRateUpdater alloc] init];
	_updater.delegate = self;
}

- (IBAction)buttonTouched:(id)sender {
}

- (IBAction)kurseButtonTouched:(id)sender {
	[_updater updateConversionRateForCurrencyFromEuroTo:@"USD"];
}

- (void)currencyRateUpdater:(CurrencyRateUpdater *)updater didUpdateRate:(NSNumber *)rate forCurrency:(NSString *)isoCode {
	NSLog(@"rate = %@", rate);
}

@end
