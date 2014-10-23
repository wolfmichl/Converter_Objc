#import <UIKit/UIKit.h>

@class Numberpad;

@interface ConverterController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *displayLabel;
@property (nonatomic) Numberpad *numberpad;

- (IBAction)buttonTouched:(id)sender;

@end


