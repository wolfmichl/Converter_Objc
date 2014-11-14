#import "Numberpad.h"

NSInteger PeriodTag = 10;
NSInteger DeleteTag = 18;
NSInteger ResetTag = 19;

@implementation Numberpad

- (id)init {
	self = [super init];
	if (self) {
		[self resetValue];
	}
	return self;
}

- (void)resetValue {
	_currentValue = @"0";
}

- (void)buttonTouched:(id)sender {
	if (self.currentValue.length >= 10) {
		return;
	}
	if ([self isNumberButton:sender]) {
		[self appendNumber:[sender tag]];
	}
	if ([sender tag] == PeriodTag) {
		[self appendPeriod:@"."];
	}
	if ([sender tag] == DeleteTag) {
		self.currentValue = [self.currentValue substringToIndex:self.currentValue.length - 1];
	}
	if ([sender tag] == 19) {
		[self resetValue];
	}
}

- (void)appendPeriod:(NSString *)Period {
	if ([self.currentValue containsString:Period]) {
		return;
	}
	self.currentValue = [self.currentValue stringByAppendingString:Period];
}

- (void)appendNumber:(NSInteger)number {
	if ([self.currentValue isEqualToString:@"0"]) {
		self.currentValue = [self stringFromNumber:number];
	} else {
		self.currentValue = [self.currentValue stringByAppendingString:[self stringFromNumber:number]];
	}
}

- (NSString *)stringFromNumber:(NSInteger)number {
	return [NSString stringWithFormat:@"%ld", (long)number];
}

- (BOOL)isNumberButton:(id)sender {
	return [sender tag] >= 0 && [sender tag] <= 9;
}

@end
