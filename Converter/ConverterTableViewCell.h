#import <UIKit/UIKit.h>

@class Currency;

@interface ConverterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (nonatomic, strong) Currency *currency;

@end
