#import <UIKit/UIKit.h>

@interface Currency : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) CGFloat amount;

- (id)initWithName:(NSString *)name;

@end