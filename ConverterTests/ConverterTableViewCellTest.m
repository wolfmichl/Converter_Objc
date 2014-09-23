#import <XCTest/XCTest.h>
#import "ConverterTableViewCell.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"
#import "Currency.h"

@interface ConverterTableViewCellTest : XCTestCase
@end

@implementation ConverterTableViewCellTest {
	ConverterTableViewCell *_cell;
	UILabel *_currencyLabelMock;
	UILabel *_amountLabelMock;
}

- (void)setUp {
	_cell = [[ConverterTableViewCell alloc] init];
	_currencyLabelMock = mock([UILabel class]);
	_cell.currencyLabel = _currencyLabelMock;
	_amountLabelMock = mock([UILabel class]);
	_cell.amountLabel = _amountLabelMock;
}

- (void)testShowsCurrencyNameOnCell {
	_cell.currency = [[Currency alloc] initWithName:@"USD"];
	[verify(_currencyLabelMock) setText:@"USD"];
}

- (void)testShowsAmountOnCell {
	Currency *currency = [[Currency alloc] initWithName:@"USD"];
	currency.amount = 42.0;
	_cell.currency = currency;
	[verify(_amountLabelMock) setText:@"42.00"];
}
@end
