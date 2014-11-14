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
- (IBAction)buttonTouched:(id)sender;

@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest {
	ConverterController *controller;
	id numberPad;
}

- (void)setUp {
	numberPad = mock([Numberpad class]);
	controller = [[ConverterController alloc] init];
	controller.numberpad = numberPad;
}

- (void)testInformsNumberpadAboutButtonTouches {
	id button = [self buttonWithTag:1];
	[controller buttonTouched:button];
	[verify(numberPad) buttonTouched:button];
}

- (void)testUpdatesDisplayWithValueFromNumberpad {
	id displayLabel = mock([UILabel class]);
	controller.displayLabel = displayLabel;
	[given([numberPad currentValue]) willReturn:@"42"];
	[controller buttonTouched:nil];
	[verify(displayLabel) setText:@"42"];
}

- (void)testNewControllerHasNumberpad {
	ConverterController *c = [[ConverterController alloc] init];
	assertThat(c.numberpad, is(notNilValue()));
}

- (id)buttonWithTag:(NSInteger)tag {
	id button = mock([UIButton class]);
	[given([button tag]) willReturnInteger:tag];
	return button;
}
@end
