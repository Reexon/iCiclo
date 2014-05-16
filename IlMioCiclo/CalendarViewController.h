//
//  CalendarViewController.h
//  IlMioCiclo
//
//  Created by Loris D'antonio on 16/05/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarViewController : UICollectionViewController

@property (strong,nonatomic) NSArray *monthArray;
@property (strong, nonatomic) IBOutlet UICollectionView *calendar;

@end
