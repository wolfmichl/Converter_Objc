#import "Currency.h"


@interface Currency ()
@property (nonatomic, copy) NSString *name;
@end

@implementation Currency

- (id)initWithName:(NSString *)name {
	self = [super init];
	if (self) {
		self.name = name;
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