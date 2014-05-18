//
//  TestCustomDate.m
//  IlMioCiclo
//
//  Created by Marco Velluto on 18/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CustomDate.h"

@interface TestCustomDate : XCTestCase

@end

@implementation TestCustomDate

NSDate *date;

- (void)setUp
{
    [super setUp];
    
    [self setupDate];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
@brief Imposta la data a 11/05/2014 con il calendario Gregoriano.
 
 @attention non è un test
*/
- (void)setupDate {
    //-- Imposto manualmente una data.
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:11];
    [dateComponents setMonth:05];
    [dateComponents setYear:2014];
    
    //-- Imposto manualmente il tipo di calendario.
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [dateComponents setCalendar:gregorian];
    
    date = [[NSDate alloc] init];
    date = [dateComponents date];
}

#pragma mark - Test

/**
 @test datesToYearFromCurrentDate:(NSDate *)date days:(int)days
 */
- (void)testDatesToYearFromCurrentDateDays {
    NSDate *returnDate = [[NSDate alloc] init];
    
    int days = 28;
    NSDate *myDate = date;
    
    NSMutableArray *dates = [CustomDate datesToYearFromCurrentDate:myDate days:days];
    returnDate = [dates objectAtIndex:1];
    NSDateComponents *returnDateComponents = [[NSCalendar currentCalendar]
                                              components:NSCalendarUnitDay |
                                              NSCalendarUnitMonth |
                                              NSCalendarUnitYear
                                              fromDate:returnDate];
    
    NSAssert(returnDateComponents.day == 8, @"Day wrong %ld != 8", (long)returnDateComponents.day);
    NSAssert(returnDateComponents.month == 6, @"Day wrong %ld != 6", (long)returnDateComponents.month);
    NSAssert(returnDateComponents.year == 2014, @"Day wrong %ld != 2014", (long)returnDateComponents.year);
    
}

/**
 @test datesToYearFromCurrentDate:(NSDate *)date days:(int)days withYears:(int)numberYear;
 */
- (void)testDatesToYearFromCurrentDateDaysWithYear {
    NSDate *returnDate = [[NSDate alloc] init];
    
    int days = 28;
    NSDate *myDate = date;
    
    /* Year 1    TEST 1 */
    
    int year = 1;

    NSMutableArray *dates = [CustomDate datesToYearFromCurrentDate:myDate days:days withYears:year];
    returnDate = [dates objectAtIndex:1];
    NSDateComponents *returnDateComponents = [[NSCalendar currentCalendar]
                                              components:NSCalendarUnitDay |
                                              NSCalendarUnitMonth |
                                              NSCalendarUnitYear
                                              fromDate:returnDate];
    
    NSAssert(returnDateComponents.day == 8, @"1 - Day wrong %ld != 8", (long)returnDateComponents.day);
    NSAssert(returnDateComponents.month == 6, @"1 - Month wrong %ld != 6", (long)returnDateComponents.month);
    NSAssert(returnDateComponents.year == 2014, @"1 - Year wrong %ld != 2014", (long)returnDateComponents.year);

    /* Year <0    TEST 2 */
    year = -1;
    
    dates = [CustomDate datesToYearFromCurrentDate:myDate days:days withYears:year];
    returnDate = [dates objectAtIndex:1];
    returnDateComponents = [[NSCalendar currentCalendar]
                                              components:NSCalendarUnitDay |
                                              NSCalendarUnitMonth |
                                              NSCalendarUnitYear
                                              fromDate:returnDate];
    
    NSAssert(returnDateComponents.day == 8, @"2 - Day wrong %ld != 8", (long)returnDateComponents.day);
    NSAssert(returnDateComponents.month == 6, @"2 - Month wrong %ld != 6", (long)returnDateComponents.month);
    NSAssert(returnDateComponents.year == 2014, @"2 - Year wrong %ld != 2014", (long)returnDateComponents.year);
    
    /* Year <1   TEST 3 */
    year = 1;
    days = -1;
    
    dates = [CustomDate datesToYearFromCurrentDate:myDate days:days withYears:year];
    returnDate = [dates objectAtIndex:1];
    returnDateComponents = [[NSCalendar currentCalendar]
                            components:NSCalendarUnitDay |
                            NSCalendarUnitMonth |
                            NSCalendarUnitYear
                            fromDate:returnDate];
    NSLog(@"Day = %li", (long)returnDateComponents.day);
    
    NSAssert(returnDateComponents.day == 12, @"3 - Day wrong %ld != 8", (long)returnDateComponents.day);
    NSAssert(returnDateComponents.month == 5, @"3 - Month wrong %ld != 6", (long)returnDateComponents.month);
    NSAssert(returnDateComponents.year == 2014, @"3 - Year wrong %ld != 2014", (long)returnDateComponents.year);
    
}





@end
