//
//  IlMioCicloTests.m
//  IlMioCicloTests
//
//  Created by Marco Velluto on 15/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HomeViewController.h"

@interface IlMioCicloTests : XCTestCase

@end

@implementation IlMioCicloTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDatesToYearFromCurrentDate {
    HomeViewController *hvc = [[HomeViewController alloc] init];
    NSDate *returnDate = [[NSDate alloc] init];

    int days = 28;
    
    //-- Imposto manualmente una data.
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:11];
    [dateComponents setMonth:05];
    [dateComponents setYear:2014];
    NSDate *date = [[NSDate alloc] init];
    date = [dateComponents date];
    
    NSMutableArray *dates = [hvc datesToYearFromCurrentDate:date days:days];
    returnDate = [dates objectAtIndex:1];
    NSLog(@"%@", returnDate.debugDescription);
}

@end
