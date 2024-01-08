//
//  NSDate+Format.m
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import "NSDate+Format.h"

@implementation NSDate(Format)

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return  formattedDateString;
}

    // yyyy-MM-dd'T'HH:mm:ss'Z'
+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

@end
