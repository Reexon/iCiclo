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
    NSDate *curretDate = [[NSDate alloc] init];
    int days = 28;
    
    NSMutableArray *dates = [hvc datesToYearFromCurrentDate:curretDate days:days];
    int c = 0;
}

@end
