#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Numberpad.h"
#import "ConverterController.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

@interface ConverterController (Testing)

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (nonatomic) Numberpad *numberpad;

- (IBAction)buttonTouched:(id)sender;

@end


@interface ConverterControllerTest : XCTestCase
@end

@implementation ConverterControllerTest {
	ConverterController *controller;
	id numberpad;
}

-(void)setUp {
	controller = [[ConverterController alloc] init];
	numberpad = mock([Numberpad class]);
	controller.numberpad = numberpad;
}

- (id)buttonWithTag:(int)tagNumber {
	id button = mock([UIButton class]);
	[given([button tag]) willReturnInteger:tagNumber];
	return button;
}

- (void)testSendsButtonTouchesToNumberpad {
	[controller buttonTouched:[self buttonWithTag:42]];
	[verify(numberpad) numberTouched:42];
}

- (void)testShowsValueFromNumberpadInDisplay {
	[given([numberpad displayValue]) willReturn:@"42"];
	
	id display = mock([UILabel class]);
	controller.displayLabel = display;
	[controller buttonTouched:nil];
	[verify(display) setText:@"42"];
}

- (void)testNewInstantiatedControllerHasNumberpad {
	controller = [[ConverterController alloc] init];
	assertThat(controller.numberpad, isNot(nilValue()));
}
@end
