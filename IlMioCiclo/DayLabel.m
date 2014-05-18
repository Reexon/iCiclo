//
//  DayLabel.m
//  IlMioCiclo
//
//  Created by Loris D'antonio on 17/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import "DayLabel.h"

@implementation DayLabel




- (id)initWithDay:(int)day andY:(int)y andDayNumber:(int)nDay
{
    self = [super initWithFrame:CGRectMake(4+day*LABEL_DAY_X_INCREMENT, y, LABEL_DAY_WIDTH, LABEL_DAY_HEIGHT)];
    if (self) {
        self.textColor = [UIColor blackColor];
        self.font = [UIFont fontWithName:@"Arial" size:9.0f];
        self.text = [NSString stringWithFormat:@"%d",nDay];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
