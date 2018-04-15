//
//  UIImage+PreviewStubImage.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "UIImage+PreviewStubImage.h"

@implementation UIImage (PreviewStubImage)

-(instancetype)initWithSize:(CGSize)size
              circleDiametr:(CGFloat)diameter
                   stubChar:(char)character {
    
    CGRect fullRect =  CGRectMake(0, 0, size.width, size.height);
    CGFloat xShift = (size.width - diameter) / 2;
    CGFloat yShift = (size.height - diameter) / 2;
    CGRect rectOverCircle = CGRectMake(xShift, yShift, diameter, diameter);
    
    UIGraphicsBeginImageContextWithOptions(fullRect.size, false, 0.0);
    [UIImage drowCircleInRect:rectOverCircle color:[UIImage colorForChar:character]];
    [UIImage drowChar:character in:rectOverCircle];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if(!image){ return nil; }
    return image;
}

+ (UIColor *)colorForChar:(char)character {
    int amountOfCases = 6;
    switch(character % amountOfCases) {
    case 0: return [UIColor colorWithDisplayP3Red:0.2392156869 green:0.6745098233 blue:0.9686274529 alpha:1];
    case 1: return [UIColor colorWithDisplayP3Red:0.2196078449 green:0.007843137719 blue:0.8549019694 alpha:1];
    case 2: return [UIColor colorWithDisplayP3Red:0.8078431487 green:0.02745098062 blue:0.3333333433 alpha:1];
    case 3: return [UIColor colorWithDisplayP3Red:0.9372549057 green:0.3490196168 blue:0.1921568662 alpha:1];
    case 4: return [UIColor colorWithDisplayP3Red:0.9607843161 green:0.7058823705 blue:0.200000003 alpha:1];
    default: return [UIColor colorWithDisplayP3Red:0.4666666687 green:0.7647058964 blue:0.2666666806 alpha:1];
    }
}

+ (void) drowCircleInRect:(CGRect)rect color:(UIColor *)color {
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:rect];
    [color setFill];
    [circle fill];
}

+ (void) drowChar:(char)character in:(CGRect)rect {
    NSString *string = [NSString stringWithFormat:@"%c" , character];
    NSMutableAttributedString *stringToDraw = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragrafSyle = [[NSMutableParagraphStyle alloc] init];
    CGFloat fontSize = rect.size.height*0.8;
    UIFont *font = [[UIFont preferredFontForTextStyle:UIFontTextStyleBody] fontWithSize:fontSize];
    [stringToDraw addAttribute:NSFontAttributeName value:font range:NSMakeRange(0,1)];
    paragrafSyle.alignment = NSTextAlignmentCenter;
    [stringToDraw addAttribute:NSParagraphStyleAttributeName value:paragrafSyle range:NSMakeRange(0,1)];
    [stringToDraw addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0,1)];
    [stringToDraw drawInRect:rect];
}
@end
