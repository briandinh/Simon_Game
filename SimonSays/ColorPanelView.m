//
//  ColorPanelView.m
//  SimonSays
//
//  Created by Brian Dinh on 8/1/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "ColorPanelView.h"

@implementation ColorPanelView{
    NSString *guess;
}



-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
      
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    NSLog(@"%i",self.tag);
    UIColor* holdColor = self.backgroundColor;
    [UIView animateWithDuration:.2 animations:^{
        self.backgroundColor = [UIColor whiteColor];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2 animations:^{
            self.backgroundColor = holdColor;
        }];
    }];
    guess = [NSString stringWithFormat:@"%i",self.tag];
    
    [self.delegate Guess:guess];
    
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"ding" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
    AudioServicesPlaySystemSound(soundID);

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
