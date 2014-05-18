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
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:11];
    [dateComponents setMonth:05];
    [dateComponents setYear:2014];

    //crei oggetto date, che conterrà la data di oggi, fin qua no problem!
    NSDate *date = [[NSDate alloc] init];
    
    /*
     * -------- INIZIO PROBLEMA ---------
     */
    
        /*
         * usanto sta roba date diventa nil ! perchè in dateComponents non hai impostato il calendario !
         * lui non sa secondo quale calendario prelevare la data
         */
        date = [dateComponents date];
        
        /*
         * OVVIAMENTE il nslog visualizzerà: (null) - (null)
         */
        NSLog(@"%@ - %@",dateComponents.calendar,date);
    
    /*
     * ------- FINE PROBLEMA ---------
     *
     * ------ INIZIO SOLUZIONE ----------
     */
    
        //dovresti prima impostare il calendario
        [dateComponents setCalendar:gregorian];
        
        //e finalmente puoi prelevare la data corretamente
        date = [dateComponents date];
        
        NSLog(@"%@ - %@",dateComponents.calendar,date);
    
    /*
     * ----- FINE SOLUZIONE -------
     */
    
    NSMutableArray *dates = [hvc datesToYearFromCurrentDate:date days:days];
    returnDate = [dates objectAtIndex:1];
    NSLog(@"%@", returnDate.debugDescription);
}

@end
