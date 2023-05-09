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
    ___VARIABLE_TableViewCell___ *cell = [tableView dequeueReusableCellWithIdentifier:@"___VARIABLE_TableViewCell___"];
    ___VARIABLE_Model___ *cellModel = self.viewModel.dataList[indexPath.row];
    cell.cellModel = cellModel;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 44.f;
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
