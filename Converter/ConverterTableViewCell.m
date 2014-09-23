#import "ConverterTableViewCell.h"
#import "Currency.h"

@implementation ConverterTableViewCell


- (void)setCurrency:(Currency *)currency {
	_currency = currency;
	self.currencyLabel.text = currency.name;
	self.amountLabel.text = [NSString stringWithFormat:@"%1.2f", _currency.amount];
}

@end
