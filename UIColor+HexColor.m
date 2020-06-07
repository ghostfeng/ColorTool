//
//  UIColor+HexColor.m
//  WisdomPay
//
//  Created by 唐何 on 16/4/6.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

/*!
 *  @author tanghe, 16-04-06 16:04:16
 *
 *  @brief 根据16进制数值返回颜色对象
 *
 *  @param hex 16进制色值 例如：0xffffff
 *
 *  @return 颜色对象
 *
 *  @since 1.0
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(CGFloat)alpha {
    
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}

+ (UIColor *) colorWithHexString: (NSString *) string alpha:(CGFloat)alpha {
    
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
//    if ([cString length] < 6) return [UIColor whiteColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6 && [cString length] != 3) return [UIColor whiteColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    if ([cString length] == 3) {
        range.length = 1;
    } else {
        range.length = 2;
    }
    NSString *rString = [cString substringWithRange:range];
    
    if ([cString length] == 3) {
        range.location = 1;
    } else {
        range.location = 2;
    }
    NSString *gString = [cString substringWithRange:range];
    if ([cString length] == 3) {
        range.location = 2;
    } else {
        range.location = 4;
    }
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

/*!
 *  @author tanghe, 16-04-06 16:04:21
 *
 *  @brief 随机生机一个颜色
 *
 *  @return 颜色对象
 *
 *  @since 1.0
 */
+ (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

//判断颜色是不是亮色
+ (BOOL) isLightColor:(UIColor*)clr {
    CGFloat components[3];
    [self getRGBComponents:components forColor:clr];
    NSLog(@"%f %f %f", components[0], components[1], components[2]);
    
    CGFloat num = components[0] + components[1] + components[2];
    if(num < 382)
        return NO;
    else
        return YES;
}

//获取RGB值
+ (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color {
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 bitmapInfo);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component];
    }
}

//比较两个颜色是否相等
+ (BOOL)colorCompareWithColor1:(UIColor *)color1 color2:(UIColor *)color2 {
    
    if (CGColorEqualToColor(color1.CGColor, color2.CGColor)) {
        return YES;
    }
    return NO;
}

@end
