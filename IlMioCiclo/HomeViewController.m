//
//  HomeViewController.m
//  IlMioCiclo
//
//  Created by Marco Velluto on 15/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomDate.h"

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
    
    
    [CustomDate datesToYearFromCurrentDate:date days:days];
    
}



@end
