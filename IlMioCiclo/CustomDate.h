//
//  CustomDate.h
//  IlMioCiclo
//
//  Created by Marco Velluto on 18/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomDate : NSObject

+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days;
+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days withYears:(int)numberYear;
+ (NSDate *)dateCicloWithPreviusData:(NSDate *)oldDate andDaysToAdd:(int)daysToAdd andMonth:(int)month;

+ (NSDateComponents *)componentsFromDate:(NSDate *)date;
+ (NSInteger)dayFromDate:(NSDate *)date;
+ (NSInteger)monthFromDate:(NSDate *)date;
+ (NSInteger)yearFromDate:(NSDate *)date;

@end
