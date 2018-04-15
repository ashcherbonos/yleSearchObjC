//
//  NSDate+timeAgoAsString.m
//  yleSearchObjC
//
//  Created by Oleksandr Shcherbonos on 4/15/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import "NSDate+timeAgoAsString.h"

@implementation NSDate (timeAgoAsString)

- (NSString *)timeAgoAsString {
    const int day = 3600*24;
    const int week = day*7;
    const int month = day*30;
    const int year = month*12;
    int secondsAgo = (int)[[NSDate date] timeIntervalSinceDate:self];
    switch (secondsAgo) {
    case 0 ... day:
            return @"today";
    case (day+1) ... (2*day):
            return @"1 day ago";
    case (2*day+1) ... week:
            return [NSString stringWithFormat:@"%d days ago", (secondsAgo/day)];
    case (week+1) ... (2*week):
            return @"1 week ago";
    case (2*week+1) ... month:
            return [NSString stringWithFormat:@"%d weeks ago", (secondsAgo/week)];
    case (month+1) ... (2*month):
            return @"1 month ago";
    case (2*month+1) ... year:
            [NSString stringWithFormat:@"%d months ago", (secondsAgo/month)];
    case (year+1) ... (2*year):
            return @"1 year ago";
    default:
            return [NSString stringWithFormat:@"%d years ago", (secondsAgo/year)];
    }
}

@end
