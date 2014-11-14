#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"

#define MOCKITO_SHORTHAND

#import "OCMockito/OCMockito.h"

#define HC_SHORTHAND

#import "OCHamcrest/OCHamcrest.h"

#import "Numberpad.h"


@interface ConverterController (Testing)

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (nonatomic) Numberpad *numberpad;
@property (nonatomic) CurrencyRateUpdater *currencyRateUpdater;
- (IBAction)buttonTouched:(id)sender;
- (IBAction)convertButtonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest {
	ConverterController *controller;
	id numberPad;
	id displayLabel;
	id currencyRateUpdater;
	id currencyLabel;
}

- (void)setUp {
	numberPad = mock([Numberpad class]);
	controller = [[ConverterController alloc] init];
	controller.numberpad = numberPad;
	displayLabel = mock([UILabel class]);
	controller.displayLabel = displayLabel;
	currencyRateUpdater = mock([CurrencyRateUpdater class]);
	controller.currencyRateUpdater = currencyRateUpdater;
	currencyLabel = mock([UILabel class]);
	controller.currencyLabel = currencyLabel;
	[controller viewDidLoad];
}

- (id)buttonWithTag:(NSInteger)tag {
	id button = mock([UIButton class]);
	[given([button tag]) willReturnInteger:tag];
	return button;
}

- (void)testInformsNumberpadAboutButtonTouches {
	id button = [self buttonWithTag:1];
	[controller buttonTouched:button];
	[verify(numberPad) buttonTouched:button];
}

- (void)testUpdatesDisplayWithValueFromNumberpad {
	[given([numberPad currentValue]) willReturn:@"42"];
	[controller buttonTouched:nil];
	[verify(displayLabel) setText:@"42"];
}

- (void)testNewControllerHasNumberpad {
	ConverterController *c = [[ConverterController alloc] init];
	assertThat(c.numberpad, is(notNilValue()));
}

- (void)testNewControllerHasCurrencyRateUpdater {
	ConverterController *c = [[ConverterController alloc] init];
	assertThat(c.currencyRateUpdater, is(notNilValue()));
}

- (void)testIsDelegateOfCurrencyRateUpdater {
	ConverterController *c = [[ConverterController alloc] init];
	assertThat(c.currencyRateUpdater.delegate, is(c));
}

- (void)testUpdatesModelWithConvertedCurrencyRate {
	[given([numberPad currentValue]) willReturn:@"42.8"];
	[controller currencyRateUpdater:nil didUpdateRate:@(1.5) forCurrency:@"USD"];
	[verify(numberPad) setCurrentValue:@"64.2"];
	[verify(displayLabel) setText:@"64.2"];
}

- (void)testStartsConversionOnConvertButtonTouched {
	[controller convertButtonTouched:nil];
	[verify(currencyRateUpdater) updateConversionRateForCurrencyFrom:@"EUR" toCurrency:@"USD"];
}

- (void)testUpdatesCurrencyLabelWithSelectedCurrency {
	[controller currencyRateUpdater:nil didUpdateRate:nil forCurrency:@"USD"];
	[verify(currencyLabel) setText:@"USD"];
}

- (void)testReversesConversionAfterSecondTouch {
	[controller currencyRateUpdater:nil didUpdateRate:nil forCurrency:@"USD"];
	[controller convertButtonTouched:nil];
	[verify(currencyRateUpdater) updateConversionRateForCurrencyFrom:@"USD" toCurrency:@"EUR"];
}

@end
