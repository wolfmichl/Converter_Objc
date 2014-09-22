#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"
#import "Currency.h"
#import "ConverterTableViewCell.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@interface CurrencyTableTest : XCTestCase
@end

@implementation CurrencyTableTest {
	ViewController *_viewController;
	UITableView *_tableView;
}

- (void)setUp {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[ViewController class]]];
	_viewController = [storyboard instantiateInitialViewController];
	_tableView = (UITableView *) [_viewController.view viewWithTag:100];
}

- (void)testViewControllerHasOutletForTableview {
	assertThat(_viewController.tableView, is(_tableView));
}

- (void)testViewControllerIsDelegateForTableview {
	assertThat(_tableView.delegate, is(_viewController));
}

- (void)testViewControllerIsDatasourceForTableview {
	assertThat(_tableView.dataSource, is(_viewController));
}

- (void)testHasRowForEveryCurrency {
	Currency *euro = [[Currency alloc] initWithName:@"EUR"];
	_viewController.currencies = @[euro];
	assertThatInteger([_viewController tableView:_tableView numberOfRowsInSection:0], equalToInteger(1));
}

- (void)testReturnsTableviewCellForEveryRow {
	Currency *euro = [[Currency alloc] initWithName:@"EUR"];
	_viewController.currencies = @[euro];
	assertThat([_viewController tableView:_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]], isA([ConverterTableViewCell class]));
}
@end
