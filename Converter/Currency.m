#import "Currency.h"


@implementation Currency

- (id)initWithName:(NSString *)name {
	self = [super init];
	if (self) {
		self.name = name;
		self.amount = 1.0;
	}
	return self;
}

- (NSString *)description {
	NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
	[description appendFormat:@"self.name=%@", self.name];
	[description appendString:@">"];
	return description;
}

@end