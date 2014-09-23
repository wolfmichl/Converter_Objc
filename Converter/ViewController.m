#import "ViewController.h"
#import "ConverterTableViewCell.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
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
