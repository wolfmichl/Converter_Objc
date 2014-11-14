#import <UIKit/UIKit.h>

extern NSInteger PeriodTag;
extern NSInteger DeleteTag;
extern NSInteger ResetTag;

@interface Numberpad : NSObject {
	NSString *_currentValue;
}

- (void)buttonTouched:(id)sender;
- (NSString *)currentValue;

@end
