//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_ViewModel___.h"
#import "___VARIABLE_TableViewCell___.h"
#import "___VARIABLE_Model___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonatomic, weak) ___VARIABLE_ViewModel___ *viewModel;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (instancetype)initWithViewModel:(___VARIABLE_ViewModel___ *)viewModel {
    if (self = [self init]) {
        self.viewModel = viewModel;
    }
    return self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_Model___ *cellModel = self.viewModel.dataList[indexPath.section][indexPath.row];
    NSString *cellClass = NSStringFromClass(cellModel.cellClass);
    ___VARIABLE_TableViewCell___ *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    cell.cellModel = cellModel;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sections = self.viewModel.dataList[section];
    return sections.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_Model___ *cellModel = self.viewModel.dataList[indexPath.section][indexPath.row];
    return cellModel.cellHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.01f)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
