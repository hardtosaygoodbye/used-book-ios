//
//  AWUI.m
//  Hysteria-oc
//
//  Created by willow on 2018/7/19.
//  Copyright © 2018年 willow. All rights reserved.
//

#import "AWUI.h"
#import <MBProgressHUD.h>

@implementation AWUI

+ (void)showHudTipStr:(NSString *)tipStr {
    if (tipStr && tipStr.length > 0) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabelFont = [UIFont boldSystemFontOfSize:15.0];
        hud.detailsLabelText = tipStr;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:1.0];
    }
}

+ (UIButton *)buttonWithTitle:(NSString *)title style:(AWButtonStyle)style {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = kMediumFont;
    // style
    if (style == AWButtonStyleSolid) {
        btn.backgroundColor = kFirstColor;
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = kRGBAColor(0, 0, 0, 0.2).CGColor;
        btn.titleLabel.font = kMediumBoldFont;
    } else if (style == AWButtonStyleHollow) {
        [btn setTitleColor:kFirstColor forState:UIControlStateNormal];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = kFirstColor.CGColor;
    } else if (style == AWButtonStyleCancel) {
        [btn setTitleColor:kBlackColor forState:UIControlStateNormal];
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = kRGBAColor(0, 0, 0, 0.2).CGColor;
        btn.backgroundColor = kHexColor(0xf7f7f7);
    }
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    return btn;
}

+ (UIView *)cutoffLine {
    UIView *cutoffLine = [[UIView alloc] init];
    cutoffLine.backgroundColor = kGrayColor;
    return cutoffLine;
}

+ (UILabel *)labelWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 1;
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = kBlackColor;
    return label;
}

+ (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleNone;
    return textField;
}

+ (UIButton *)buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor fillColor:(UIColor *)fillColor borderColor:(UIColor *)borderColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.backgroundColor = fillColor;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = borderColor.CGColor;
    return button;
}

+ (UIButton *)buttonWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = kFirstColor;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    return button;
}

+ (UILabel *)labelWithText:(NSString *)text fontsize:(CGFloat)size color:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 1;
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = color;
    return label;
}

@end
