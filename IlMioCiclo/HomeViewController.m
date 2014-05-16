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
@synthesize pickerView, meseTextView, resultTextView;

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

- (IBAction)valueChagedPicker:(id)sender {
   /*
    NSDate *date = [self.pickerView date];
    int daysToAdd = 28;
    
    int dataToMonth = daysToAdd * 11;
    NSDate *newDate1 = [date dateByAddingTimeInterval:60*60*24*dataToMonth];
    NSLog(@"%@", [newDate1 description]);
    
    resultTextView.text = [newDate1 description];
   
    */
    NSDate *now = [self.pickerView date];
    int daysToAdd = 28;
    NSDate *newDate = [now dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSLog(@"%@", [newDate description]);
    
}

- (IBAction)keyboardDown:(id)sender {
    [self.meseTextView resignFirstResponder];
    [self.resultTextView resignFirstResponder];
}

- (IBAction)pressView:(id)sender {
    [self.meseTextView resignFirstResponder];
    [self.resultTextView resignFirstResponder];

}

/**
 
 ** ATTENZIONE**
 Funziona solo per il prossimo mese
 
 @param oldDate -> Data dell'ultima mestruazione.
 @param daysToAdd -> Durata periodo senza ciclo (28).
 @param Month -> Mese del quale si vuole sapere l'inizo della data del ciclo.
 
 @return newDate -> Data inizo ciclo.
 */
- (NSDate *)dateCicloWithPreviusData:(NSDate *)oldDate andDaysToAdd:(int)daysToAdd andMonth:(int)month{
    
    NSDate *now = [self.pickerView date];
    NSDate *newDate = [now dateByAddingTimeInterval:60*60*24*daysToAdd];
    NSLog(@"%@", [newDate description]);
    
    return newDate;
}
@end
