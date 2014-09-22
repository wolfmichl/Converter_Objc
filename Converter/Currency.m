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
@end