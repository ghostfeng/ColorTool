//
//  UIColor+HexColor.h
//  WisdomPay
//
//  Created by 唐何 on 16/4/6.
//  Copyright © 2016年 tanghe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

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
+ (UIColor *)colorWithRGBHex:(UInt32)hex withAlpha:(CGFloat)alpha;

/*!
 *  @author tanghe, 16-04-06 16:04:16
 *
 *  @brief 根据16进制数值返回颜色对象
 *
 *  @param string 16进制色值 例如：@"0xffffff" @"#ffffff"
 *
 *  @return 颜色对象
 *
 *  @since 1.0
 */
+(UIColor *) colorWithHexString: (NSString *) string alpha:(CGFloat)alpha;

/*!
 *  @author tanghe, 16-04-06 16:04:21
 *
 *  @brief 随机生机一个颜色
 *
 *  @return 颜色对象
 *
 *  @since 1.0
 */
+ (UIColor *)randomColor;

/*!
 *  @author tanghe, 16-04-06 16:04:21
 *
 *  @brief 判断颜色是不是亮色
 *
 *  @return 颜色对象
 *
 *  @since 1.0
 */
+ (BOOL) isLightColor:(UIColor*)clr;

/*!
 *  @author tanghe, 16-04-06 16:04:21
 *
 *  @brief 比较两个颜色是否相等
 *
 *  @return 颜色对象
 *
 *  @since 1.0
 */
+ (BOOL)colorCompareWithColor1:(UIColor *)color1 color2:(UIColor *)color2;

@end
