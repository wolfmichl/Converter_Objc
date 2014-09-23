#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "Currency.h"
#import "ConverterTableViewCell.h"

#define HC_SHORTHAND
#import "OCHamcrest/OCHamcrest.h"

#define MOCKITO_SHORTHAND
#import "OCMockito/OCMockito.h"

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
	Currency *euro = [[Currency alloc] initWithName:@"EUR"];
	_viewController.currencies = @[euro];
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
	assertThatInteger([_viewController tableView:_tableView numberOfRowsInSection:0], equalToInteger(1));
}

- (void)testReturnsTableviewCellForEveryRow {
	assertThat([_viewController tableView:_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]], isA([ConverterTableViewCell class]));
}

- (void)testCellHasCurrencyNameFilled {
	id cellMock = mock([ConverterTableViewCell class]);
	id tableViewMock = mock([UITableView class]);
	[given([tableViewMock dequeueReusableCellWithIdentifier:@"ConverterCell"]) willReturn:cellMock];
	[_viewController tableView:tableViewMock cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	Currency *euro = _viewController.currencies[0];
	[verify(cellMock) setCurrency:euro];
}
@end
