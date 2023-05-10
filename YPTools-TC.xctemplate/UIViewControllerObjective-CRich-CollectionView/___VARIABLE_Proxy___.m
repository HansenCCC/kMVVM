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

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ___VARIABLE_TableViewCell___ *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"___VARIABLE_TableViewCell___" forIndexPath:indexPath];
    ___VARIABLE_Model___ *cellModel = self.viewModel.dataList[indexPath.row];
    cell.cellModel = cellModel;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.dataList.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100.f, 100.f);
}

@end
