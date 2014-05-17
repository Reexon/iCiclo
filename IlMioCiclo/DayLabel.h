//
//  DayLabel.h
//  IlMioCiclo
//
//  Created by Loris D'antonio on 17/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LABEL_DAY_WIDTH 15
#define LABEL_DAY_HEIGHT 15

//l'incremento dell'asse x (di default è LABEL_DAY_WIDTH -1)
#define LABEL_DAY_X_INCREMENT 14

@interface DayLabel : UILabel

- (id)initWithDay:(int)day andY:(int)y andDayNumber:(int)day;

@end
