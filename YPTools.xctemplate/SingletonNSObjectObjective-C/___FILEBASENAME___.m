//___FILEHEADER___

#import "___FILEBASENAME___.h"

@implementation ___FILEBASENAMEASIDENTIFIER___

+ (instancetype)shareInstance {
    static ___FILEBASENAMEASIDENTIFIER___ *m = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[___FILEBASENAMEASIDENTIFIER___ alloc] init];
    });
    return m;
}

@end
