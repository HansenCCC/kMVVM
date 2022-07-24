//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonatomic, strong) NSMutableArray *dataList;

@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (instancetype)init {
    if (self = [super init]) {
        self.pageSize = 10;
        self.pageIndex = 1;
        self.dataList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)startLoadData {
    self.pageIndex = 1;
    [self startLoadingData:_pageIndex];
}

- (void)loadMoreData {
    self.pageIndex ++;
    [self startLoadingData:_pageIndex];
}

- (void)startLoadingData:(NSInteger)pageIndex {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        BOOL hasMore = YES;
        if (self.pageIndex > 3) {
            hasMore = NO;
        }
        if (self.pageIndex == 1) {
            [self.dataList removeAllObjects];
        }
        [self.dataList addObjectsFromArray:[[UIFont familyNames] subarrayWithRange:NSMakeRange(self.dataList.count, self.pageSize)]];
        if ([self.delegate respondsToSelector:@selector(didEndLoadData:)]) {
            [self.delegate didEndLoadData:hasMore];
        }
    });
}

@end
