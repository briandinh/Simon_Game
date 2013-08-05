//
//  ViewController.m
//  SimonSays
//
//  Created by Brian Dinh on 8/1/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "ViewController.h"
#import "ColorPanelView.h"
#import "StartViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PauseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GuessNumberView.h"
@interface ViewController (){
    NSMutableArray *tagsArray;
    NSMutableArray *guessArray;
    float i;
    PauseViewController *pauseView;
    StartViewController *startMenuView;
    bool pause;
    ColorPanelView *colorView;
    ColorPanelView *colorView2;
    ColorPanelView *colorView3;
    ColorPanelView *colorView4;
    ColorPanelView *colorView5;
    ColorPanelView *colorView6;
    
    GuessNumberView *guessView1;
    GuessNumberView *guessView2;
    GuessNumberView *guessView3;
    GuessNumberView *guessView4;
    GuessNumberView *guessView5;
    GuessNumberView *guessView6;
    UIColor* holdGrayColor;

    __weak IBOutlet UILabel *resultLabel;
}
- (IBAction)pause:(id)sender;
- (IBAction)hint:(id)sender;
- (IBAction)clear:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    resultLabel.text = @"";

    startMenuView = [self.storyboard instantiateViewControllerWithIdentifier:@"startGame"];
    [self.view addSubview:startMenuView.view];
    
    pause = NO;
   
    tagsArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    guessArray = [NSMutableArray arrayWithCapacity:6];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(shuffleAndFlashAllColors) name:@"started" object:nil];
    
    colorView =[self.view.subviews objectAtIndex:0];
    colorView2 =[self.view.subviews objectAtIndex:1];
    colorView3 =[self.view.subviews objectAtIndex:2];
    colorView4 =[self.view.subviews objectAtIndex:3];
    colorView5 =[self.view.subviews objectAtIndex:4];
    colorView6 =[self.view.subviews objectAtIndex:5];
    
    guessView1 = [self.view.subviews objectAtIndex:9];
    guessView2 = [self.view.subviews objectAtIndex:10];
    guessView3 = [self.view.subviews objectAtIndex:11];
    guessView4 = [self.view.subviews objectAtIndex:12];
    guessView5 = [self.view.subviews objectAtIndex:13];
    guessView6 = [self.view.subviews objectAtIndex:14];

    
    colorView.delegate = self;
    colorView2.delegate = self;
    colorView3.delegate = self;
    colorView4.delegate = self;
    colorView5.delegate = self;
    colorView6.delegate = self;

    holdGrayColor = guessView1.backgroundColor;

   /* if ([guessArray count] == 6) {
        [self checkGuess];
    }
*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)shuffleAndFlashAllColors{
    [self shuffleArray];
    
    
     i = 1.5;
    for(NSString *tag in tagsArray){
        
        [self performSelector:@selector(flashColor:) withObject:tag afterDelay:i];
        i=i+.6;
        
        
    }
}

-(void)flashAllColors{
    i = 1;
    for(NSString *tag in tagsArray){
        
        [self performSelector:@selector(flashColor:) withObject:tag afterDelay:i];
        i=i+.6;
    }

}

-(void)flashColor:(NSString*)index{
    SystemSoundID soundID;
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"ding" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);

    
    int indexValue = index.intValue -1;
    UIView* subView = [self.view.subviews objectAtIndex:indexValue];
    UIColor* holdColor = subView.backgroundColor;
    [UIView animateWithDuration:.3 animations:^{
        subView.backgroundColor = [UIColor whiteColor];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.3 animations:^{
            subView.backgroundColor = holdColor;
        }];
    }];
        AudioServicesPlaySystemSound(soundID);
}

- (void) shuffleArray {
    
    for (int x = 0; x < [tagsArray count]; x++) {
        int randInt = (arc4random() % ([tagsArray count] - x)) + x;
        [tagsArray exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
}

-(void) clearLabel{
    resultLabel.text = @"";
}


- (IBAction)pause:(id)sender {

    
    pauseView = [self.storyboard instantiateViewControllerWithIdentifier:@"pause"];
    pauseView.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:pauseView.view]; 
    
}

- (IBAction)hint:(id)sender {
    [self flashAllColors];
    [guessArray removeAllObjects];
    [self clearAllGuesses];
}

- (IBAction)clear:(id)sender {
    [guessArray removeAllObjects];
    [self clearAllGuesses];
}

-(void)checkGuess{
    if (guessArray.count == 6) {
        if ([guessArray isEqualToArray:tagsArray]) {
            resultLabel.text = @"you win.";
            [self clearAllGuesses];
            [self shuffleAndFlashAllColors];
            [self performSelector:@selector(clearLabel) withObject:nil afterDelay:2];

            SystemSoundID soundID;
            NSString *soundFile = [[NSBundle mainBundle] pathForResource:@"-PokeCenter" ofType:@"mp3"];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundID);
            AudioServicesPlaySystemSound(soundID);
        }
        else {
            resultLabel.text = @"try again.";
            [self clearAllGuesses];
            [self performSelector:@selector(clearLabel) withObject:nil afterDelay:2];

        }
        
        [guessArray removeAllObjects];

    }

  //  [NSSet setWithArray:tagsArray] isEqualToSet:[NSSet setWithArray:guessArray]
}
-(void)clearAllGuesses{
    guessView1.backgroundColor = holdGrayColor;
    guessView2.backgroundColor = holdGrayColor;
    guessView3.backgroundColor = holdGrayColor;
    guessView4.backgroundColor = holdGrayColor;
    guessView5.backgroundColor = holdGrayColor;
    guessView6.backgroundColor = holdGrayColor;
}

#pragma mark GuessDelegate

-(void) Guess:(NSString *)guessTag{
    
    [guessArray addObject:guessTag];
    NSLog(@"%@",guessArray);
    NSLog(@"%@",tagsArray);
    [self checkGuess];

    if (guessArray.count == 1) {
        guessView1.backgroundColor = [UIColor lightGrayColor];
    }
    if (guessArray.count == 2) {
        guessView2.backgroundColor = [UIColor lightGrayColor];
    }
    if (guessArray.count == 3) {
        guessView3.backgroundColor = [UIColor lightGrayColor];
    }
    if (guessArray.count == 4) {
        guessView4.backgroundColor = [UIColor lightGrayColor];
    }
    if (guessArray.count == 5) {
        guessView5.backgroundColor = [UIColor lightGrayColor];
    }
    if (guessArray.count == 6) {
        guessView6.backgroundColor = [UIColor lightGrayColor];
    }
}

@end
