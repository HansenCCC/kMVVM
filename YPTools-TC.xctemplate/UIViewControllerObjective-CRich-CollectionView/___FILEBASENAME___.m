//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_ViewModel___.h"
#import "___VARIABLE_Proxy___.h"
#import "___VARIABLE_TableViewCell___.h"
#import "Masonry.h"

@interface ___FILEBASENAMEASIDENTIFIER___ () <___VARIABLE_ViewModel___Delegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) ___VARIABLE_ViewModel___ *viewModel;
@property (nonatomic, strong) ___VARIABLE_Proxy___ *proxy;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
    [self startLoadData];
}

- (void)startLoadData {
    [self.viewModel startLoadData];
}

- (void)setupSubviews {
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
}

#pragma mark - ___VARIABLE_ViewModel___Delegate

- (void)didEndLoadData:(BOOL)hasMore {
    [self.collectionView.mj_header endRefreshing];
    [self.collectionView.mj_footer endRefreshing];
    if (hasMore) {
        [self.collectionView.mj_footer resetNoMoreData];
    } else {
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    }
    [self.collectionView reloadData];
}

#pragma mark - getters | setters

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.delegate = self.proxy;
        _collectionView.dataSource = self.proxy;
        
        __weak typeof(self) weakSelf = self;
        _collectionView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            [weakSelf.viewModel loadMoreData];
        }];
        
        NSArray *classs = @[
            [UICollectionViewCell class],
            [___VARIABLE_TableViewCell___ class],
        ];
        
        [classs enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [_collectionView registerClass:obj forCellWithReuseIdentifier:NSStringFromClass(obj)];
        }];
        
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}

- (___VARIABLE_Proxy___ *)proxy {
    if (!_proxy) {
        _proxy = [[___VARIABLE_Proxy___ alloc] initWithViewModel:self.viewModel];
    }
    return _proxy;
}

- (___VARIABLE_ViewModel___ *)viewModel {
    if (!_viewModel) {
        _viewModel = [[___VARIABLE_ViewModel___ alloc] init];
        _viewModel.delegate = self;
    }
    return _viewModel;
}

@end
