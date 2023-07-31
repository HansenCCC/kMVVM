//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UIImage+___VARIABLE_productName___.h"

@implementation UIImage (___VARIABLE_productName___)

/// 是否是png,判断依据是否含有alpha通道
- (BOOL)___VARIABLE_productName____isPngImage {
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    BOOL isPng = !(alphaInfo == kCGImageAlphaNone ||
                   alphaInfo == kCGImageAlphaNoneSkipLast ||
                   alphaInfo == kCGImageAlphaNoneSkipFirst );
    return isPng;
}

/// 黑白化图片
- (UIImage *)___VARIABLE_productName____convertImageToGrey {
    UIImage *image = nil;
    if (self) {
        image = [self convertImageToGreyScale:self]?:self;
    }
    return image;
}

- (UIImage *)convertImageToGreyScale:(UIImage*)image {
    CGRect imageRect = CGRectMake(0, 0.f, image.size.width, image.size.height);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate(nil, image.size.width, image.size.height, 8.f, 0.f, colorSpace, kCGImageAlphaNone);
    CGContextDrawImage(context, imageRect, [image CGImage]);
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);
    return newImage;
}

/// 将颜色转化为图片  1x1
/// @param color 颜色
+ (UIImage*)___VARIABLE_productName____imageWithColor:(UIColor *)color {
    UIImage *image = [UIImage createImageWithColor:color];
    return image;
}

+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

/// 使用blend来渲染图片的颜色
/// @param tintColor 需要渲染的颜色
- (UIImage *)___VARIABLE_productName____imageWithTintColor:(UIColor *)tintColor {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake( 0.f, 0.f, self.size.width, self.size.height);
    UIRectFill(bounds);
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

/// 裁剪出指定rect的图片(限定在自己的size之内) 内部已考虑到retina图片,rect不必为retina图片进行x2处理
/// @param cropRect 指定的矩形区域,坐标系为图片坐标系,原点在图片的左上角
- (UIImage *)___VARIABLE_productName____cropImageWithRect:(CGRect)cropRect {
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    cropRect = CGRectIntersection(bounds, cropRect);//限制在自己的尺寸里面
    CGRect drawRect = CGRectMake(-cropRect.origin.x , -cropRect.origin.y, self.size.width * self.scale, self.size.height * self.scale);
    UIGraphicsBeginImageContext(cropRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, CGRectMake(0, 0, cropRect.size.width, cropRect.size.height));
    [self drawInRect:drawRect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/// 获取图片压缩后的二进制数据,如果图片大小超过bytes时,会对图片进行等比例缩小尺寸处理    会自动进行png检测,从而保持alpha通道
/// @param bytes  二进制数据的大小上限,0代表不限制
/// @param compressionQuality  压缩后图片质量,取值为0...1,值越小,图片质量越差,压缩比越高,二进制大小越小
- (NSData *)___VARIABLE_productName____imageDataThatFitBytes:(NSUInteger)bytes compressionQuality:(CGFloat)compressionQuality {
    BOOL isPng = self.___VARIABLE_productName____isPngImage;
    NSData *data;
    if(isPng){
        data = [self imageDataOfPngThatFitBytes:bytes];
    }else{
        data = [self imageDataOfJpgThatFitBytes:bytes withCompressionQuality:compressionQuality];
    }
    return data;
}

- (NSData *)___VARIABLE_productName____imageDataThatFitBytes:(NSUInteger)bytes {
    return [self ___VARIABLE_productName____imageDataThatFitBytes:bytes compressionQuality:1.f];
}

- (NSData *)___VARIABLE_productName____imageDataWithCompressionQuality:(CGFloat)compressionQuality {
    return [self ___VARIABLE_productName____imageDataThatFitBytes:0 compressionQuality:compressionQuality];
}

/// image -> data
- (NSData *)___VARIABLE_productName____imageData {
    UIImage *image = [self copy];
    if (self.___VARIABLE_productName____isPngImage) {
        return UIImageJPEGRepresentation(image, 1.f);
    } else {
        return UIImagePNGRepresentation(image);
    }
}

- (NSData *)imageDataOfPngThatFitBytes:(NSUInteger)bytes {
    NSData *data = UIImagePNGRepresentation(self);
    NSUInteger len = data.length;
    if( bytes != 0 && len > bytes) {
        //可以简单认为压缩后的大小与像素点数量成正比
        CGFloat factor = 0.9*sqrt(1.0*bytes/len);//由于只是近似计算,因此再乘上0.9系数,让压缩后的值再小点
        CGSize size = self.size;
        size.width *= factor;
        size.height *= factor;
        UIImage *image = [self ___VARIABLE_productName____imageWithCanvasSize:size];
        data = [image imageDataOfPngThatFitBytes:bytes];
    }
    return data;
}

- (NSData *)imageDataOfJpgThatFitBytes:(NSUInteger)bytes withCompressionQuality:(CGFloat)compressionQuality {
    NSData *data = UIImageJPEGRepresentation(self, compressionQuality);
    NSUInteger len = data.length;
    if(bytes != 0 && len > bytes) {
        //可以简单认为压缩后的大小与像素点数量成正比
        CGFloat factor = 0.9 * sqrt(1.0 * bytes / len);//由于只是近似计算,因此再乘上0.9系数,让压缩后的值再小点
        CGSize size = self.size;
        size.width *= factor;
        size.height *= factor;
        UIImage *image = [self ___VARIABLE_productName____imageWithCanvasSize:size];
        data = [image imageDataOfJpgThatFitBytes:bytes withCompressionQuality:compressionQuality];
    }
    return data;
}

@end

@implementation UIImage (___VARIABLE_productName____Bundle)

/// 获取bundle里面图片
/// @param name 资源名称
/// @param bundle bundle对象
+ (UIImage *)___VARIABLE_productName____imageWithName:(NSString *)name forBundle:(NSBundle *)bundle {
    if(name.length == 0) {
        return nil;
    }
    UIImage *image;
    // NSString *path = [[NSBundle mainBundle]pathForResource:@"login@2x" ofType:@"png"]; 不使用该方法获取路径是因为该方法是获取到的是具体的某一个文件，不能进行自动匹配
    NSString *path = [[bundle resourcePath] stringByAppendingPathComponent:name];
    //@2x、@3x就是imageWithContentsOfFile:自动来匹配了。
    image = [UIImage imageWithContentsOfFile:path];
    return image;
}

@end

@implementation UIImage (___VARIABLE_productName____ImageSize)

- (CGSize)sizeWithMaxRelativeSize:(CGSize)size isMax:(BOOL)isMax {
    CGSize imageSize = self.size;
    CGSize resultSize = CGSizeZero;
    if (size.width == 0&&size.height != 0) {
        resultSize.height = size.height;
        resultSize.width = imageSize.width/imageSize.height * resultSize.height;
        return resultSize;
    }else if(size.width != 0&&size.height == 0){
        resultSize.width = size.width;
        resultSize.height = resultSize.width * imageSize.height/imageSize.width;
        return resultSize;
    }else if(size.width == 0&&size.height == 0){
        return self.size;
    }
    if ((imageSize.width/imageSize.height >= size.width/size.height&&isMax)||(imageSize.width/imageSize.height < size.width/size.height&&!isMax)){
        resultSize.height = size.height;
        resultSize.width = imageSize.width/imageSize.height * resultSize.height;
        return resultSize;
    }else{
        resultSize.width = size.width;
        resultSize.height = resultSize.width * imageSize.height/imageSize.width;
        return resultSize;
    }
    return resultSize;
}

/// 返回最大相对尺寸。x/y 为0时，尺寸不受约束
/// @param size 尺寸
- (CGSize)___VARIABLE_productName____sizeWithMaxRelativeSize:(CGSize)size {
    CGSize resize = [self sizeWithMaxRelativeSize:size isMax:YES];
    return resize;
}

/// 返回最小相对尺寸。x/y 为0时，尺寸不受约束
/// @param size 尺寸
- (CGSize)___VARIABLE_productName____sizeWithMinRelativeSize:(CGSize)size {
    CGSize resize = [self sizeWithMaxRelativeSize:size isMax:NO];
    return resize;
}

/// 将图片缩放到指定的CGSize大小
/// @param size 要缩放到的尺寸
/// @param scale 比例
- (UIImage *)___VARIABLE_productName____imageWithCanvasSize:(CGSize)size scale:(CGFloat)scale {
    size.width *= scale;
    size.height *= scale;
    UIImage *scaledImage = [self ___VARIABLE_productName____imageWithCanvasSize:size];
    return scaledImage;
}

- (UIImage *)___VARIABLE_productName____imageWithCanvasSize:(CGSize)size {
    UIImage *image = [self copy];
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

/// 矫正图片 （相机拍照之后的图片可能需要矫正一下再使用）
- (UIImage *)___VARIABLE_productName____fixOrientation {
    UIImage *image = [self copy];
    if (image.imageOrientation == UIImageOrientationUp) {
        return image;
    }
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (image.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height);
            transform = CGAffineTransformRotate(transform,M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width,0);
            transform = CGAffineTransformRotate(transform,M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform,0, image.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    switch (image.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.width,0);
            transform = CGAffineTransformScale(transform, -1,1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, image.size.height,0);
            transform = CGAffineTransformScale(transform, -1,1);
            break;
        default:
            break;
    }
    CGContextRef ctx = CGBitmapContextCreate(NULL, image.size.width, image.size.height,
                                             CGImageGetBitsPerComponent(image.CGImage),0,
                                             CGImageGetColorSpace(image.CGImage),
                                             CGImageGetBitmapInfo(image.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (image.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx,CGRectMake(0,0,image.size.height,image.size.width), image.CGImage);
            break;
        default:
            CGContextDrawImage(ctx,CGRectMake(0,0,image.size.width,image.size.height), image.CGImage);
            break;
    }
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}

/// 返回图片在内存里的像素点所占的内存大小,单位为字节(Byte) 1kb = 1024btye
- (NSUInteger)___VARIABLE_productName____lengthOfRawData {
    CGDataProviderRef providerRef = CGImageGetDataProvider(self.CGImage);
    CFDataRef dataRef = CGDataProviderCopyData(providerRef);
    CFIndex len = CFDataGetLength(dataRef);
    CFRelease(dataRef);
    return (NSUInteger)len;
}

@end

@implementation UIImage (___VARIABLE_productName____Transform)

/// 水平翻转图片
- (UIImage *)___VARIABLE_productName____horizontalInvertImage {
    CGSize imageSize = CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));//该方法已经考虑到了@2x图片的情况
    CGAffineTransform m = CGAffineTransformIdentity;
    m = CGAffineTransformConcat(m, CGAffineTransformMakeScale(-1, 1));
    m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(imageSize.width, 0));
    UIImage *img = [self ___VARIABLE_productName____transformImageWithAffineTransform:m newSize:imageSize];
    return img;
}

/// 垂直翻转图片
- (UIImage *)___VARIABLE_productName____verticalInvertImage {
    CGSize imageSize = CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));
    CGAffineTransform m = CGAffineTransformIdentity;
    m = CGAffineTransformConcat(m, CGAffineTransformMakeScale(1, -1));
    m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(0, imageSize.height));
    UIImage *img = [self ___VARIABLE_productName____transformImageWithAffineTransform:m newSize:imageSize];
    return img;
}

/// 以图片中心为圆点,旋转图片
/// @param radians 旋转的弧度值,正值时逆时针旋转,负值顺时针旋转
- (UIImage *)___VARIABLE_productName____rotateImageWithRadians:(CGFloat)radians {
    CGSize imageSize = CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));
    CGAffineTransform m = CGAffineTransformIdentity;
    //将图片的中心移动到原点
    m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(-imageSize.width*0.5, -imageSize.height*0.5));
    m = CGAffineTransformConcat(m, CGAffineTransformMakeRotation(radians));//旋转
    //旋转后,图片的矩形大小会变发变化,因此要重新计算矩形大小
    CGRect f = (CGRect){CGPointZero,imageSize};
    CGRect bounds = CGRectApplyAffineTransform(f,m);
    
    m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(bounds.size.width*0.5, bounds.size.height*0.5));//将矩形的左下角移动到原点
    CGSize newSize = bounds.size;
    UIImage *img = [self ___VARIABLE_productName____transformImageWithAffineTransform:m newSize:newSize];
    return img;
}

/// 仿射矩阵变换处理图片
/// @param transform CGAffineTransform
/// @param newSize 新的尺寸
/// @param orientation 变换后图片的朝向
- (UIImage *)___VARIABLE_productName____transformImageWithAffineTransform:(CGAffineTransform)transform newSize:(CGSize)newSize newOrientation:(UIImageOrientation)orientation {
    CGFloat width = floor(newSize.width);//向下取整
    CGFloat height = floor(newSize.height);//向下取整
    UIImage *aImage = self;
    CGFloat scale = aImage.scale;
    size_t bitsPerComponent = CGImageGetBitsPerComponent(aImage.CGImage);
    size_t bytesPerRow = width*4;
    CGColorSpaceRef space = CGImageGetColorSpace(aImage.CGImage);
    //    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(aImage.CGImage);//当图片的bitmapinfo为kCGImageAlphaLast时,创建context失败,失败是不支持colorspace与该bitmapinfo的组合
    CGBitmapInfo bitmapInfo = (CGBitmapInfo)kCGImageAlphaPremultipliedLast;
    CGContextRef ctx = CGBitmapContextCreate(NULL,//由系统自动创建和管理位图内存
                                             width,//画布的宽度(要求整数值)
                                             height,//画布的高度(要求整数值)
                                             bitsPerComponent,//每个像素点颜色分量(如R通道)所点的比特数
                                             bytesPerRow,//每一行所占的字节数
                                             space,//画面使用的颜色空间
                                             bitmapInfo//每个像素点内存空间的使用信息,如是否使用alpha通道,内存高低位读取方式等
                                             );
    CGContextConcatCTM(ctx, transform);//对画面里的每个像素点,应用变换矩阵.即最终要显示的像素点的值f([x,y,1])=f([x,y,1]*[矩阵:transform])
    CGContextDrawImage(ctx, CGRectMake(0, 0, CGImageGetWidth(aImage.CGImage), CGImageGetHeight(aImage.CGImage)), aImage.CGImage);//在画布上下文的原来图片所占的矩形区域绘制位图,绘制后,画面上下文会再对该区域里的每一个像素点应用转置矩阵
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg scale:scale orientation:orientation];
    CGImageRelease(cgimg);
    CGContextRelease(ctx);
    return img;
}

- (UIImage *)___VARIABLE_productName____transformImageWithAffineTransform:(CGAffineTransform)transform newSize:(CGSize)newSize {
    return [self ___VARIABLE_productName____transformImageWithAffineTransform:transform newSize:newSize newOrientation:self.imageOrientation];
}

- (UIImage *)___VARIABLE_productName____transformImageWithAffineTransform:(CGAffineTransform)transform {
    return [self ___VARIABLE_productName____transformImageWithAffineTransform:transform newSize:self.size newOrientation:self.imageOrientation];
}

/// 将图片朝向调整到指定的朝向 （如果朝向不变,返回self,否则返回调整后新的图片）
/// @param orientation 图片朝向
- (UIImage *)___VARIABLE_productName____transformImageWithOrientation:(UIImageOrientation)orientation {
    UIImageOrientation oldOrientation = self.imageOrientation;
    if(self.imageOrientation==orientation){
        return self;
    }
    CGSize imageSize = CGSizeMake(CGImageGetWidth(self.CGImage), CGImageGetHeight(self.CGImage));//该方法已经考虑到了@2x图片的情况和图片的朝向
    CGSize newSize = imageSize;
    
    CGAffineTransform m = CGAffineTransformIdentity;
    BOOL mirrored = NO;
    CGFloat radians = 0;
    //oldOrientation=>UIImageOrientationUp
    switch (oldOrientation) {
        case UIImageOrientationUp:
            break;
        case UIImageOrientationDown:
            radians = M_PI;
            break;
        case UIImageOrientationLeft:
            radians = M_PI_2;
            break;
        case UIImageOrientationRight:
            radians = -M_PI_2;
            break;
        case UIImageOrientationUpMirrored:
            mirrored = YES;
            break;
        case UIImageOrientationDownMirrored:
            mirrored = YES;
            radians = M_PI;
            break;
        case UIImageOrientationLeftMirrored:
            radians = M_PI_2;
            mirrored = YES;
            break;
        case UIImageOrientationRightMirrored:
            radians = -M_PI_2;
            mirrored = YES;
            break;
        default:
            break;
    }
    if(mirrored){
        m = CGAffineTransformConcat(m, CGAffineTransformMakeScale(-1, 1));
        m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(imageSize.width, 0));
    }
    if(radians){
        //将图片的中心移动到原点
        m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(-imageSize.width*0.5, -imageSize.height*0.5));
        m = CGAffineTransformConcat(m, CGAffineTransformMakeRotation(radians));//旋转
        //旋转后,图片的矩形大小会变发变化,因此要重新计算矩形大小
        CGRect f = (CGRect){CGPointZero,imageSize};
        CGRect bounds = CGRectApplyAffineTransform(f,m);
        
        m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(bounds.size.width*0.5, bounds.size.height*0.5));//将矩形的左下角移动到原点
        newSize = bounds.size;
    }
    //UIImageOrientationUp=>orientation
    mirrored = NO;
    radians = 0;
    switch (orientation) {
        case UIImageOrientationUp:
            break;
        case UIImageOrientationDown:
            radians = M_PI;
            break;
        case UIImageOrientationLeft:
            radians = -M_PI_2;
            break;
        case UIImageOrientationRight:
            radians = M_PI_2;
            break;
        case UIImageOrientationUpMirrored:
            mirrored = YES;
            break;
        case UIImageOrientationDownMirrored:
            mirrored = YES;
            radians = M_PI;
            break;
        case UIImageOrientationLeftMirrored:
            radians = -M_PI_2;
            mirrored = YES;
            break;
        case UIImageOrientationRightMirrored:
            radians = M_PI_2;
            mirrored = YES;
            break;
        default:
            break;
    }
    if(mirrored){
        m = CGAffineTransformConcat(m, CGAffineTransformMakeScale(-1, 1));
        m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(imageSize.width, 0));
    }
    if(radians){
        //将图片的中心移动到原点
        m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(-imageSize.width*0.5, -imageSize.height*0.5));
        m = CGAffineTransformConcat(m, CGAffineTransformMakeRotation(radians));//旋转
        //旋转后,图片的矩形大小会变发变化,因此要重新计算矩形大小
        CGRect f = (CGRect){CGPointZero,imageSize};
        CGRect bounds = CGRectApplyAffineTransform(f,m);
        
        m = CGAffineTransformConcat(m, CGAffineTransformMakeTranslation(bounds.size.width*0.5, bounds.size.height*0.5));//将矩形的左下角移动到原点
        newSize = bounds.size;
    }
    
    UIImage *img = [self ___VARIABLE_productName____transformImageWithAffineTransform:m newSize:newSize newOrientation:orientation];
    return img;
}

@end

@implementation UIImage (___VARIABLE_productName____QRCode)

/// 识别二维码
- (NSString *)___VARIABLE_productName____qrcodeString {
    NSArray<CIFeature *> *features = [self featuresWithType:CIDetectorTypeQRCode options:@{CIDetectorAccuracy:CIDetectorAccuracyHigh}];
    NSString *string;
    CIQRCodeFeature *feature = (CIQRCodeFeature *)[features firstObject];
    string = feature.messageString;
    return string;
}

/// 生成二维码
/// @param qrcode 二维码数据
/// @param size 尺寸
+ (UIImage *)___VARIABLE_productName____imageWithQRCodeString:(NSString *)qrcode size:(CGSize)size {
    NSData *stringData = [qrcode dataUsingEncoding:NSUTF8StringEncoding];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    UIColor *onColor = [UIColor blackColor];
    UIColor *offColor = [UIColor whiteColor];
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
                                       keysAndValues:
                             @"inputImage",qrFilter.outputImage,
                             @"inputColor0",[CIColor colorWithCGColor:onColor.CGColor],
                             @"inputColor1",[CIColor colorWithCGColor:offColor.CGColor],
                             nil];
    
    CIImage *qrImage = colorFilter.outputImage;
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrImage fromRect:qrImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(cgImage);
    return codeImage;
}

- (NSArray<CIFeature *> *)featuresWithType:(NSString *)type options:(NSDictionary *)options{
    CIDetector *detector = [CIDetector detectorOfType:type context:[CIContext contextWithOptions:nil] options:options];
    CIImage *img = self.CIImage;
    if(!img){
        if(self.CGImage){
            UIImage *image = [[self copy] ___VARIABLE_productName____fixOrientation];//将图片调整为向上的朝向,否则会检测不到
            NSData *data = image.___VARIABLE_productName____imageData;
            img = [CIImage imageWithData:data];
        }
    }
    NSArray <CIFeature *> *features = [detector featuresInImage:img];
    return features;
}

@end


@implementation UIImage (___VARIABLE_productName____ImageLocalStorage)

+ (NSString *)___VARIABLE_productName____imagesDirectory {
    NSString *imagesDirectory = [NSString stringWithFormat:@"%@/images/",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]];
    // 创建 images 目录
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:imagesDirectory]) {
        [fileManager createDirectoryAtPath:imagesDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return imagesDirectory;
}

+ (NSString *)___VARIABLE_productName____saveImageToDocument:(UIImage *)image {
    NSDate *newDate = [NSDate date];
    NSString *dateString = @([newDate timeIntervalSince1970] * 1000).stringValue;
    NSString *iconFilePath = [UIImage ___VARIABLE_productName____imagesDirectory];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", dateString];
    NSString *filePath = [iconFilePath stringByAppendingPathComponent:fileName];
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    if (imageData) {
        NSError *error;
        BOOL success = [imageData writeToFile:filePath options:NSDataWritingAtomic error:&error];
        if (success) {
            return fileName;
        }
    }
    return nil;
}

+ (UIImage *)___VARIABLE_productName____getDocumentImageWithImageName:(NSString *)imageName {
    NSString *iconFilePath = [UIImage ___VARIABLE_productName____imagesDirectory];
    NSString *imagePath = [iconFilePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", imageName]];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

@end
