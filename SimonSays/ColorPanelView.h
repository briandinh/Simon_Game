//
//  ColorPanelView.h
//  SimonSays
//
//  Created by Brian Dinh on 8/1/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuessDelegate.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ColorPanelView : UIView

@property(strong, nonatomic) id<GuessDelegate>delegate;

@end
