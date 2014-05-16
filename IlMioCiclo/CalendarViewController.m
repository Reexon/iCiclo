//
//  CalendarViewController.m
//  IlMioCiclo
//
//  Created by Loris D'antonio on 16/05/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "CalendarViewController.h"
#import "MonthCell.h"

@interface CalendarViewController ()

@end

@implementation CalendarViewController
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
    [super viewDidLoad];
    
    

    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
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
    NSLog(@"%@ %ld",data,    (long)[comp weekday]);
    // Do any additional setup after loading the view.
}

- (int)daysInMonth:(int)month{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    date.timeStyle = NSDateFormatterNoStyle;
    date.dateFormat = @"dd/MM/yyyy";
    [date setCalendar:gregorianCalendar];
    [date setTimeZone:timeZone];
    
    NSDate *data = [date dateFromString:[NSString stringWithFormat:@"01/%d/2014",month]];

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSRange days = [gregorian rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:data];
    int daysInGivenMonth= days.length;
    
    return daysInGivenMonth;
}

- (int)dayOfWeek:(int)day withMonth:(int)month withYear:(int)year{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"GMT"];
    NSDateFormatter *date = [[NSDateFormatter alloc] init];
    date.timeStyle = NSDateFormatterNoStyle;
    date.dateFormat = @"dd/MM/yyyy";
    [date setCalendar:gregorianCalendar];
    [date setTimeZone:timeZone];
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
    return monthArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    cell.monthLabel.text =[monthArray objectAtIndex:indexPath.row];
    
    int numberOfDays = [self daysInMonth:(indexPath.row+1)];
    for (int i = 1, y = 50; i <= numberOfDays ; i++){
        
        int day = [self dayOfWeek:i withMonth:indexPath.row+1 withYear:2014];
        if(day == 1)
            day = 6;
        else
            day -=2;
        
        if (day == 0) {
            y+=20;
        }
        // creo la label che rappresenta il numero del giorno
        UILabel  * label = [[UILabel alloc] initWithFrame:CGRectMake(4+day*21, y, 20, 21)];
        label.font = [UIFont fontWithName:@"Arial" size:9.0f];
        label.backgroundColor = [UIColor clearColor];
        label.textColor=[UIColor blackColor
                         ];
        label.numberOfLines=1;
        label.text = [NSString stringWithFormat:@"%d",i];
        [cell.contentView addSubview:label];
    }
    
    
    
    return cell;
}
@end
