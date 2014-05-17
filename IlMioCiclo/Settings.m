//
//  Settings.m
//  IlMioCiclo
//
//  Created by Loris D'antonio on 17/05/14.
//  Copyright (c) 2014 Loris D'antonio. All rights reserved.
//

#import "Settings.h"

@implementation Settings

/*
 @author Loris D'antonio
 
 @abstract il register default , viene utilizzato per salvare le impostazioni di default (da utilizzare solo al primo avvio).
            dato che NON sovrascrive le impostazioni gia salvate, lo inserisco nel metodo di allocazione
            e verrà eseguito ogni volta che creo un'oggetto di classe Settings.

 */
- (id) init{
    if (self == [self init]){
        
        NSDictionary *appDefaultsOption = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"YES", @"ShowToolBar",
                                     @"NO", @"AutoSaveEnabled",
                                     // ... lots of objects and keys here,
                                     nil];
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaultsOption];
    }
    return self;
}

/**
 @author Loris D'antonio
 
 @abstract semplice salvataggio di impostazioni per opzioni di tipo stringa
 
 @param NSString value
        valore dell'opzione
 
 @param NSString option
        nome dell'opzione da salvare
 */
- (void)saveSettingString:(NSString *)value forKey:(NSString *)option{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:value forKey:option];
    [defaults synchronize];
}

/**
 @author Loris D'antonio
 
 @abstract semplice salvataggio di impostazioni per opzioni di tipo booleano
 
 @param BOOL value
    valore dell'opzione
 
 @param NSString option
    nome dell'opzione da salvare
 */
- (void)saveSettingBool:(bool)boolean forKey:(NSString *)option{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:boolean forKey:option];
    [defaults synchronize];
    
}

/**
 @author Loris D'antonio
 
 @abstract prelevo il valore string per l'impostazione richiesta.
 
 @param NSString option
        nome dell'opzione richiesta
 
 @return NSString 
        valore dell'impostazione richiesta
 */
- (NSString *)getSettingString:(NSString *)option{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults valueForKey:option];
}

/**
 @author Loris D'antonio
 
 @abstract prelevo valore bool per l'impostazione richiesta.
 
 @param NSString option
        nome dell'opzione richiesta
 
 @return NSString
        valore dell'impostazione richiesta
 */
- (BOOL)getSettingBool:(NSString *)option{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:option];
}
@end
