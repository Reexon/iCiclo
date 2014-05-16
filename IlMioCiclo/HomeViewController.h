//
//  HomeViewController.h
//  IlMioCiclo
//
//  Created by Marco Velluto on 15/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *meseTextView;
@property (weak, nonatomic) IBOutlet UITextField *resultTextView;


- (IBAction)valueChagedPicker:(id)sender;
- (IBAction)keyboardDown:(id)sender;
- (IBAction)pressView:(id)sender;
@end
