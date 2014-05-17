//
//  CalendarViewController.m
//  IlMioCiclo
//
//  Created by Loris D'antonio on 16/05/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "CalendarViewController.h"
#import "MonthCell.h"
#import "DayLabel.h"



#define PERIOD_DURATION 7


@interface CalendarViewController ()

@end

@implementation CalendarViewController{
    //array di NSDate , ogni data rappresenta l'inizio del ciclo.
    NSMutableArray *cicleStartDate;
    NSCalendar *gregorianCalendar;
    NSTimeZone *timeZone ;
    NSDateFormatter *date ;
}
@synthesize monthArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    monthArray = @[@"Gennaio",@"Febbraio",@"Marzo",@"Aprile",@"Maggio",@"Giugno",@"Luglio",@"Agosto",@"Settembre",@"Ottobre",@"Novembre",@"Dicembre"];
    
    gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    date = [[NSDateFormatter alloc] init];
    [date setCalendar:gregorianCalendar];
    date.timeStyle = NSDateFormatterNoStyle;
    [date setTimeZone:timeZone];
    date.dateFormat = @"dd/MM/yyyy";
    cicleStartDate = [NSMutableArray new];
    [cicleStartDate addObject:[date dateFromString:@"25/07/2014"]];
    [cicleStartDate addObject:[date dateFromString:@"10/04/2014"]];
    [cicleStartDate addObject:[date dateFromString:@"1/01/2014"]];
    [cicleStartDate addObject:[date dateFromString:@"1/06/2014"]];
    [super viewDidLoad];
    
    /*NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDateFormatter *day = [[NSDateFormatter alloc] init];
    day.timeStyle = NSDateFormatterNoStyle;
    day.dateFormat = @"EEEE";
    [day setCalendar:gregorianCalendar];
    [day setTimeZone:timeZone];
    
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    date.timeStyle = NSDateFormatterNoStyle;
    date.dateFormat = @"dd/MM/yyyy";
    [date setCalendar:gregorianCalendar];
    [date setTimeZone:timeZone];
    
    NSDate *data = [date dateFromString:@"22/11/2014"];

    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comp = [cal components:NSWeekdayCalendarUnit fromDate:data];

    NSString *day_name = [day stringFromDate:data];
    NSLog(@"%@ %ld",data,    (long)[comp weekday]);*/
    // Do any additional setup after loading the view.
}

/**
 @author Loris D'antonio
 
 @param month
        mese di cui si vuole sapere quanti giorni contiene
 
 @return int
        restituisce il numero dei giorni presenti nel mese (month)
 */
- (int)daysInMonth:(int)month{

    date.dateFormat = @"dd/MM/yyyy";

    NSDate *data = [date dateFromString:[NSString stringWithFormat:@"01/%d/2014",month]];

    NSRange days = [gregorianCalendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:data];
    
    int daysInGivenMonth= days.length;
    
    return daysInGivenMonth;
}

/**
 @author Loris D'antonio
 
 @param day
        giorno formato numerico [1-31]
 @param month
        mese formato numerico [1-12]
 @param year
        mese formato annuale [yyyy]
 
 @return ritorna l'inteno che rappresenterà un giorno specifico:
            1 - "Sunday - Domenica"
            2 - "Monday - Lunedì"
            ...
            7 - "Saturday - Sabato"
 
 */
- (int)dayOfWeek:(int)day withMonth:(int)month withYear:(int)year{

    date.dateFormat = @"dd/MM/yyyy";

    NSDate *data = [date dateFromString:[NSString stringWithFormat:@"%d/%d/%d",day,month,year]];
    
    NSCalendar* cal = [NSCalendar currentCalendar];
    NSDateComponents* comp = [cal components:NSWeekdayCalendarUnit fromDate:data];
    
    return [comp weekday];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    /* ritorno numero dei mesi
     * finchè non avverà qualche catastrofe o cambiamento del cosmo , 
     * invasione alieni o altro, sarà sempre 12.
     */
    return monthArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    cell.monthLabel.text =[monthArray objectAtIndex:indexPath.row];
    
    
    //numero dei giorni contenuti nel mese (indexPath.Row inizia da 0)
    int numberOfDays = [self daysInMonth:(indexPath.row+1)];
    
    date.dateFormat = @"dd/MM/yyyy";
    
    for (int i = 1, y = 50; i <= numberOfDays ; i++){
        /* 
            prelevo il giorno (mi serve per gestire l'ascissa x della label)
           ogni label avrà un incolonnamento diverso a seconda se è "lunedì,martedì,mercoledì,ecc"
         */
        int day = [self dayOfWeek:i withMonth:indexPath.row+1 withYear:2014];
        
        //data che rappresenta la label
        NSDate *data = [date dateFromString:[NSString stringWithFormat:@"%d/%ld/2014",i,(long)indexPath.row]];
        
        //start_date sarà l'inizio del ciclo
        //NSDate *start_date = [date dateFromString:@"14/6/2014"];
        
        
        //data è compreso nell periodo del ciclo ?
        //BOOL b = [self date:data isBetweenDate:start_date andDate:[start_date dateByAddingTimeInterval:60*60*24*7]];
        
        /*
         questo magheggio mi serve perchè il conteggio dei giorni viene fatto in modo sballato,
         1- domenica
         2- lunedì
         ..
         7- sabato
         
         in questo modo avremo il contegio corretto:
         0 - lunedì
         1 - martedì
         ..
         6 - sabato
         7 - domenica
         */
        if(day == 1)
            day = 6;
        else
            day -=2;
        
        /* 
         se siamo arrivati al giorno 0 (lunedì), abbiamo finito di compilare la prima riga del mese,
         quindi incrementiamo l'asse y della label
         */
        if (day == 0 && i != 1)
            y+=LABEL_DAY_HEIGHT;
        
        // creo la label che rappresenta il numero del giorno
        DayLabel  * label = [[DayLabel alloc] initWithDay:day andY:y andDayNumber:i];

        /*
         * serve per determinare se la data di cui sto creando la cella
         * è un giorno che fa parte di uno dei periodi del ciclo,
         * se ne fa parte, allora la coloro.
         */
        for (int i = 0 ; i < cicleStartDate.count ; i++){
            NSDate *start_date = [cicleStartDate objectAtIndex:i];
            NSDate *finish_data = [start_date dateByAddingTimeInterval:60*60*24*PERIOD_DURATION];
            if([self date:data isBetweenDate:start_date andDate:finish_data]){
                
                //contiene il numero di secondi tra una data e l'altra
                //calcolo secondi  tra giorno_inizio ciclo e giorno attuale
                NSTimeInterval dif_seconds = [data timeIntervalSinceDate:start_date];
                
                label.backgroundColor = [self detectColorFromDifferenceSeconds:dif_seconds];

            }
        }

        [cell.contentView addSubview:label];
    }
    
    return cell;
}

/**
 @author Loris D'antonio
 
 @param date
        la data attuale, quella da controllare se è compresa nell'intervallo
 @param beginDate
        il range iniziale
 @param endDate
        il range finale
 
 @return TRUE se beginDate < date < endDate, 
        FALSE altrimenti
 */

- (BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
    
    if ([date compare:endDate] == NSOrderedDescending)
        return NO;
    
    return YES;
}

/**
 @author Loris D'antonio
 
 @param seconds
        rappresenta l'intervallo in secondi tra il giorno del ciclo e il giorno in esame
 @return UIColor
        ritorna il colore adatto della cella
 */
- (UIColor *)detectColorFromDifferenceSeconds:(NSTimeInterval)seconds{
    //numero giorni di differenza (puo' essere valore negativo o positivo)
    int dif_days = seconds/(60*60*24);
    
    // se la differenza tra i giorni di inizio ciclo e giorno attuale corrisponde a uno dei seguenti
    //applico colorazione differente
    if(dif_days <= 2 && dif_days >= 0)
        return [UIColor redColor];
    else if(dif_days < 7 && dif_days >= 5)
        return [UIColor yellowColor];
    else if(dif_days < 5 && dif_days > 2)
        return [UIColor orangeColor];

    return [UIColor clearColor];
}
@end
