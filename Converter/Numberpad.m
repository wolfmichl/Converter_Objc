#import "Numberpad.h"

@interface Numberpad ()

@property (nonatomic) NSString *value;

@end


@implementation Numberpad

- (instancetype)init
{
	self = [super init];
	if (self) {
		_value = @"0";
	}
	return self;
}

- (void)numberTouched:(NSUInteger)number {
	if([self.value isEqualToString:@"0"]) {
		self.value = [@(number) stringValue];
	} else {
		self.value = [self.value stringByAppendingString:[@(number) stringValue]];
	}
}

- (NSString *)displayValue {
	return self.value;
}

@end
