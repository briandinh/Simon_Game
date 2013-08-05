//
//  StartViewController.m
//  SimonSays
//
//  Created by Brian Dinh on 8/2/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"

@interface StartViewController (){
    ViewController *gameView;
}

@end

@implementation StartViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
  
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"started" object:nil];
    
    [self.view removeFromSuperview];
   
    
            //[self performSegueWithIdentifier:@"toGame" sender:self];
}
@end
