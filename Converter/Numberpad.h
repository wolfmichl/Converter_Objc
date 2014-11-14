#import <UIKit/UIKit.h>

extern NSInteger PeriodTag;
extern NSInteger DeleteTag;
extern NSInteger ResetTag;

@interface Numberpad : NSObject

@property (nonatomic, copy) NSString *currentValue;

- (void)buttonTouched:(id)sender;

@end
