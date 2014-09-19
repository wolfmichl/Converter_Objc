#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

@interface NumberpadTest : XCTestCase

@end

@implementation NumberpadTest

- (void)testThatItSmokes {
	assertThat(@"foo", is(@"bar"));
}

@end
