#import "HasTargetAndAction.h"


@implementation HasTargetAndAction {
	id _target;
	NSString *_action;
	UIControlEvents _events;
}

- (id)initWithTarget:(id)target action:(NSString *)action events:(UIControlEvents)events {
	self = [super init];
	if (self) {
		_target = target;
		_action = action;
		_events = events;
	}
	return self;
}

- (BOOL)matches:(id)item {
	if ([item respondsToSelector:@selector(actionsForTarget:forControlEvent:)]) {
		NSArray *actions = [(UIButton *) item actionsForTarget:_target forControlEvent:_events];
		return [actions containsObject:_action];
	}
	return NO;
}

- (void)describeTo:(id <HCDescription>)description {
	NSString *text = [NSString stringWithFormat:@"action %@ to be defined with target %@", _action, _target];
	[description appendText:text];
}


@end

id hasTargetAndActionForEvents(id target, NSString *action, UIControlEvents events) {
	return [[HasTargetAndAction alloc] initWithTarget:target action:action events:events];
}