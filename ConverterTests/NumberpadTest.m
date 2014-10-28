#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"
#import "TestHelper.h"
#import "Numberpad.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

@interface NumberpadTest : XCTestCase
@end

@implementation NumberpadTest {
	Numberpad *pad;
}

-(void) setUp {
	pad = [[Numberpad alloc] init];
}

-(void) testInputOneNumber {
	[pad numberTouched:3];
	assertThat([pad displayValue], equalTo(@3"));
}

-(void) testSecondNumberAddsOnFirstnumber {
	[pad numberTouched:2];
	[pad numberTouched:3];
	assertThat([pad displayValue], equalTo(@"23"));
}

@end
