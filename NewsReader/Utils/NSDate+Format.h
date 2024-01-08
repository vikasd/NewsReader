//
//  NSDate+Format.h
//  NewsReader
//
//  Created by vikas dalvi on 08/01/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Format)

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *) format;
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
