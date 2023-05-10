//___FILEHEADER___

#import "___FILEBASENAME___.h"
#import "___VARIABLE_Model___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [self.contentView addSubview:self.titleLabel];
}

- (void)setCellModel:(___VARIABLE_Model___ *)cellModel {
    _cellModel = cellModel;
    self.titleLabel.text = cellModel.title?:@"";
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect bounds = self.contentView.bounds;
    CGRect f1 = bounds;
    self.titleLabel.frame = f1;
}

#pragma mark - getters | setters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
