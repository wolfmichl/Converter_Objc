#import <UIKit/UIKit.h>
#import "OCHamcrest/HCBaseMatcher.h"


@interface HasTargetAndAction : HCBaseMatcher

FOUNDATION_EXPORT id hasTargetAndActionForEvents(id target, NSString *action, UIControlEvents events);

@end
