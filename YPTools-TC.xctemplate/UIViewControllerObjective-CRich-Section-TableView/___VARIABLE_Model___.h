//___FILEHEADER___

___IMPORTHEADER_cocoaTouchSubclass___

NS_ASSUME_NONNULL_BEGIN


@interface ___FILEBASENAMEASIDENTIFIER___ : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) Class cellClass;
@property (nonatomic, assign) CGFloat cellHeight; // default 44.f
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) id extend;

@end

NS_ASSUME_NONNULL_END
