#import "ViewController.h"
#import "ConverterTableViewCell.h"
#import "Currency.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.currencies = @[
			[[Currency alloc] initWithName:@"EUR"],
			[[Currency alloc] initWithName:@"USD"],
			[[Currency alloc] initWithName:@"GBP"]
	];
}

- (IBAction)buttonTouched:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.currencies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	ConverterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ConverterCell"];
	cell.currency = self.currencies[(NSUInteger) indexPath.row];
	return cell;
}

@end
