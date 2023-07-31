//
//  NSObject+HAHA.m
//  YPPrompts
//
//  Created by Hansen on 2023/5/9.
//

#import "UITextField+___VARIABLE_productName___.h"
#import <objc/runtime.h>

static char kMaxLength;

@implementation UITextField (___VARIABLE_productName___)

/// 获取光标位置
- (NSRange)___VARIABLE_productName____selectedRange {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    return NSMakeRange(location, length);
}

/// 设置光标位置
/// @param range 光标位置
- (void)___VARIABLE_productName____setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}

#pragma mark - setters | getters

- (void)set___VARIABLE_productName____maxLength:(NSUInteger)___VARIABLE_productName____maxLength {
    objc_setAssociatedObject(self, &kMaxLength, @(___VARIABLE_productName____maxLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (___VARIABLE_productName____maxLength) {
        [self addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    }
}

- (NSUInteger)___VARIABLE_productName____maxLength {
    NSNumber *number = objc_getAssociatedObject(self, &kMaxLength);
    return [number unsignedIntegerValue];
}

- (void)textChange:(UITextField *)textField {
    NSString *destText = textField.text;
    NSUInteger maxLength = textField.___VARIABLE_productName____maxLength;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        if (destText.length > maxLength) {
            NSRange range;
            NSUInteger inputLength = 0;
            for (int i = 0; i < destText.length && inputLength <= maxLength; i += range.length) {
                range = [textField.text rangeOfComposedCharacterSequenceAtIndex:i];
                inputLength += [destText substringWithRange:range].length;
                if (inputLength > maxLength) {
                    NSString *newText = [destText substringWithRange:NSMakeRange(0, range.location)];
                    textField.text = newText;
                }
            }
        }
    }
}


@end
