//
//  AWUI.h
//  Hysteria-oc
//
//  Created by willow on 2018/7/19.
//  Copyright © 2018年 willow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AWButtonStyle){
    AWButtonStyleSolid,
    AWButtonStyleHollow,
    AWButtonStyleCancel
};

@interface AWUI : NSObject

+ (void)showHudTipStr:(NSString *)tipStr;

+ (UIButton *)buttonWithTitle:(NSString *)title style:(AWButtonStyle)style;

+ (UIView *)cutoffLine;

+ (UILabel *)labelWithText:(NSString *)text;

+ (UILabel *)labelWithText:(NSString *)text fontsize:(CGFloat)size color:(UIColor *)color;

+ (UIButton *)buttonWithTitle:(NSString *)title;

+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder;

+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor;

+ (void)makeToastWithText:(NSString *)text;

@end
