//
//  HomeViewController.m
//  IlMioCiclo
//
//  Created by Marco Velluto on 15/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize pickerView, meseTextView, resultTextView, daysTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/**
 Il valore del picker viene cambiato.
 */
- (IBAction)valueChagedPicker:(id)sender {
   /*
    NSDate *date = [self.pickerView date];
    int daysToAdd = 28;
    
    int dataToMonth = daysToAdd * 11;
    NSDate *newDate1 = [date dateByAddingTimeInterval:60*60*24*dataToMonth];
    NSLog(@"%@", [newDate1 description]);
    
    resultTextView.text = [newDate1 description];
   
    
    NSDate *now = [self.pickerView date];
    int daysToAdd = 28;
    NSDate *newDate = [now dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSLog(@"%@", [newDate description]);
    */
}

/**
 Fa scomparire la tastiera
 */
- (IBAction)keyboardDown:(id)sender {
    [self.meseTextView resignFirstResponder];
    [self.resultTextView resignFirstResponder];
}

/**
 Fa scomparire la tastiera
 */
- (IBAction)pressView:(id)sender {
    [self.meseTextView resignFirstResponder];
    [self.resultTextView resignFirstResponder];

}

/**
 Si attiva quando l'utente preme sul bottone DONE
 */
- (IBAction)pressedDoneButton:(id)sender {
    
    // -- Prendo le informazioni dell'utene
    NSDate *date = (NSDate *)self.pickerView.date;
    int days = (int)[self.daysTextField.text intValue];
    
    
    [self datesToYearFromCurrentDate:date days:days];
    
}

/**
 Restituisce un array di date di inizio mestruazione per l'anno corrente.
 
 @param date -> Data dalla quale partire il conteggio.
 @param days -> Numero di giorni tra una mestruazione e l'altra.
 
 @return array di date di inizio metruazione, di tutti i mesi.
 */
- (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days {
    
    return [self datesToYearFromCurrentDate:date days:days withYears:1];
}

/**
 Restituisce un array di date di inizio mestruazione per l'anno corrente.

 @param date -> Data dalla quale partire il conteggio.
 @param days -> Numero di giorni tra una mestruazione e l'altra.
 @param numberYear -> [1 .... n] 1 -> anno in corso. Per quanti anni si vogliono calcolare le date.
 
 @return array di date di inizio metruazione, di tutti i mesi.
 */
- (NSMutableArray *)datesToYearFromCurrentDate:(NSDate *)date days:(int)days withYears:(int)numberYear {
    
    if (numberYear == 0)
        numberYear= 1;
    
    //Trovo il mese corrente
    int numberMonth = (int)[HomeViewController monthFromDate:date];
    NSMutableArray *dates = [[NSMutableArray alloc] init];
    int monthes = (12 * numberYear) - numberMonth + 2;
    
    for (int i=0; i<monthes; i++) {
        [dates addObject:[self dateCicloWithPreviusData:date andDaysToAdd:days andMonth:i]];
    }
    return dates;
}

/**
 @author Marco.
 
 @param date -> Data da analizzare
    @return NSDateComponets -> DataComponents relativo alla data.
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
 
 @param date -> data da analizare
 @return -> restituisce il numero del gioro relativo alla data passata.
 */
+ (NSInteger)dayFromDate:(NSDate *)date {

    NSDateComponents *componets = [HomeViewController componentsFromDate:date];
    NSInteger day = [componets day];
    return day;
}

+ (NSInteger)monthFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [HomeViewController componentsFromDate:date];
    NSInteger month = [componets month];
    return month;
}

+ (NSInteger)yearFromDate:(NSDate *)date {
    
    NSDateComponents *componets = [HomeViewController componentsFromDate:date];
    NSInteger year = [componets year];
    return year;
}


/**
 Calcola la data di inizio mestruazione
 
 @param oldDate -> Data dell'ultima mestruazione.
 @param daysToAdd -> Durata periodo senza ciclo (28).
 @param Month -> [1 .... n] 1 -> Mese attuale. Numero dei mesi del quale si vuole sapere il ciclo
 (es. Siamo a maggio, se voglio sapere quello di agosto, inserirò 3).
 
 @return newDate -> Data inizo ciclo.
 */
- (NSDate *)dateCicloWithPreviusData:(NSDate *)oldDate andDaysToAdd:(int)daysToAdd andMonth:(int)month{
    
    NSDate *now = oldDate;
    int days = daysToAdd * month;
    NSDate *newDate = [now dateByAddingTimeInterval:60*60*24* days];
    NSLog(@"%@", [newDate description]);
    
    return newDate;
}

@end
