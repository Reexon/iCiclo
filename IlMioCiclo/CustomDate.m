//
//  CustomDate.m
//  IlMioCiclo
//
//  Created by Marco Velluto on 18/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "CustomDate.h"

@implementation CustomDate

/**
 @author Marco.
 
 @brief Restituisce un array di date di inizio ciclo per l'anno corrente.
 
 @discussion Una volta passato i giorni, e la data, il metodo restituisce un array di date
 fino alla fine dell'anno corrente. Le date sono calcolate contando dalla data passata come
 parametro fino alla fine dei giorni.
 
 @param date Data dalla quale partire il conteggio.
 @param days Numero di giorni tra un ciclo e l'altro.
 
 @return array di date di inizio metruazione, di tutti i mesi.
 */
+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days {
    
    return [CustomDate datesToYearFromCurrentDate:date days:days withYears:1];
}

/**
 @author Marco.
 
 @brief Restituisce un array di date di inizio mestruazione per l'anno corrente.
 
 @param date Data dalla quale partire il conteggio.
 @param days  Numero di giorni tra una mestruazione e l'altra.
 @param numberYear  [1 .... n] 1 - anno in corso. Per quanti anni si vogliono calcolare le date.
 
 @return array di date di inizio metruazione, di tutti i mesi.
 */
+ (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days withYears:(int)numberYear {
    
    if (numberYear <= 0)
        numberYear= 1;
    if (days <= 0) {
        days = 1;
    }
    
    //Trovo il mese corrente
    int numberMonth = (int)[CustomDate monthFromDate:date];
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    int monthes = (12 * numberYear) - numberMonth + 2;
    
    for (int i=0; i<monthes; i++) {
        [dates addObject:[CustomDate dateCicloWithPreviusData:date andDaysToAdd:days andMonth:i]];
    }
    return dates;
}

/**
 @author Marco.
 
 @param date Data da analizzare
 @return NSDateComponets DataComponents relativo alla data.
 */
+ (NSDateComponents *)componentsFromDate:(NSDate *)date {
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSCalendarUnitDay |
                                    NSCalendarUnitMonth |
                                    NSCalendarUnitYear
                                    fromDate:date];
    return components;
}

/**
 @author Marco.
 
 @param date data da analizare
 @return restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)dayFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [CustomDate componentsFromDate:date];
    NSInteger day = [componets day];
    return day;
}

/**
 @author Marco.
 
 @param date data da analizare
 @return restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)monthFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [CustomDate componentsFromDate:date];
    NSInteger month = [componets month];
    return month;
}

/**
 @author Marco.
 
 @param date data da analizare
 @return restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)yearFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [CustomDate componentsFromDate:date];
    NSInteger year = [componets year];
    return year;
}

/**
 @author Marco.

 @brief Calcola la data di inizio del ciclo.
 
 @discussion la data viene calcolata partendo dalla data passata, sommando i giorni. 
 In più si deve specificare per quale mese in avanti si vuole la data.
 
 @param oldDate Data dell'ultima mestruazione.
 @param daysToAdd Durata periodo senza ciclo (28).
 @param Month [1 .... n] 1 -> Mese attuale. Numero dei mesi del quale si vuole sapere il ciclo
 (es. Siamo a maggio, se voglio sapere quello di agosto, inserirò 3).
 
 @return newDate Data inizo ciclo.
 */
+ (NSDate *)dateCicloWithPreviusData:(NSDate *)oldDate andDaysToAdd:(int)daysToAdd andMonth:(int)month{
    
    NSDate *now = oldDate;
    int days = daysToAdd * month;
    NSDate *newDate = [now dateByAddingTimeInterval:60*60*24* days];
    NSLog(@"%@", [newDate description]);
    
    return newDate;
}





@end
