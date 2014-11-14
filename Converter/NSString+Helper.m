#import "NSString+Helper.h"


@implementation NSString (Helper)

- (BOOL)containsString:(NSString *)string {
	return [self rangeOfString:string].location != NSNotFound;
}

@end