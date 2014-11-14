#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Numberpad.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"


@interface NumberpadTest : XCTestCase

@end

@implementation NumberpadTest {
	Numberpad *numberpad;
}

- (void)setUp {
	numberpad = [[Numberpad alloc] init];
}

- (id)buttonWithTag:(NSInteger)tag {
	id button = mock([UIButton class]);
	[given([button tag]) willReturnInteger:tag];
	return button;
}

- (void)testTouchedNumbersUpdatesCurrentValue {
	[numberpad buttonTouched:[self buttonWithTag:1]];
	assertThat([numberpad currentValue], is(@"1"));
}

- (void)testAppendsNewNumbersToCurrentNumber {
	[numberpad buttonTouched:[self buttonWithTag:1]];
	[numberpad buttonTouched:[self buttonWithTag:2]];
	assertThat([numberpad currentValue], is(@"12"));
}

- (void)testRestrictsNumbersToTen {
	numberpad.currentValue = @"1234567890";
	[numberpad buttonTouched:[self buttonWithTag:2]];
	assertThatInteger(numberpad.currentValue.length, equalToInteger(10));
}

- (void)testSupressesLeadingZeros {
	numberpad.currentValue = @"0";
	[numberpad buttonTouched:[self buttonWithTag:2]];
	assertThat(numberpad.currentValue, is(@"2"));
}

- (void)testSupportsPeriod {
	numberpad.currentValue = @"1";
	[numberpad buttonTouched:[self buttonWithTag:PeriodTag]];
	assertThat(numberpad.currentValue, is(@"1."));
}

- (void)testAllowsLeadingZeroWithPeriod {
	numberpad.currentValue = @"0";
	[numberpad buttonTouched:[self buttonWithTag:PeriodTag]];
	assertThat(numberpad.currentValue, is(@"0."));
}

- (void)testSuppressesMultiplePeriods {
	numberpad.currentValue = @"1";
	[numberpad buttonTouched:[self buttonWithTag:PeriodTag]];
	[numberpad buttonTouched:[self buttonWithTag:PeriodTag]];
	assertThat(numberpad.currentValue, is(@"1."));
}

- (void)testDeletesLastCipherOnC {
	numberpad.currentValue = @"123";
	[numberpad buttonTouched:[self buttonWithTag:DeleteTag]];
	assertThat(numberpad.currentValue, is(@"12"));
}

- (void)testResetsDisplayOnAC {
	numberpad.currentValue = @"123";
	[numberpad buttonTouched:[self buttonWithTag:ResetTag]];
	assertThat(numberpad.currentValue, is(@"0"));
}

- (void)testInitializesNumberpadWithZero {
	assertThat(numberpad.currentValue, is(@"0"));
}
@end
