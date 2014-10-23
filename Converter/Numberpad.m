#import "Numberpad.h"

@interface Numberpad ()

@property (nonatomic) NSString *value;

@end


@implementation Numberpad

- (instancetype)init
{
	self = [super init];
	if (self) {
		_value = @"";
	}
	return self;
}

- (void)numberTouched:(NSUInteger)number {
	self.value = [self.value stringByAppendingString:[@(number) stringValue]];
}

- (NSString *)displayValue {
	return self.value;
}

@end
