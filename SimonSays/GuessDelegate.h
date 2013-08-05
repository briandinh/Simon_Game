//
//  GuessDelegate.h
//  SimonSays
//
//  Created by Brian Dinh on 8/3/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GuessDelegate <NSObject>

-(void) Guess:(NSString *)guessTag;

@end
