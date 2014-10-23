#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Numberpad.h"
#import "ConverterController.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"


@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest

- (id)buttonWithTag:(int)tagNumber {
	id button = mock([UIButton class]);
	[given([button tag]) willReturnInteger:tagNumber];
	return button;
}

- (void)testSendsButtonTouchesToNumberpad {
	id numberpad = mock([Numberpad class]);
	ConverterController *controller = [[ConverterController alloc] init];
	controller.numberpad = numberpad;
	[controller buttonTouched:[self buttonWithTag:42]];
	[verify(numberpad) numberTouched:42];
}
@end
