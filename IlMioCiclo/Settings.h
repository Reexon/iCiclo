//
//  Settings.h
//  IlMioCiclo
//
//  Created by Loris D'antonio on 17/05/14.
//  Copyright (c) 2014 Marco Velluto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

- (void)saveSettingString:(NSString *)value forKey:(NSString *)option;

- (void)saveSettingBool:(bool)boolean forKey:(NSString *)option;

@end
