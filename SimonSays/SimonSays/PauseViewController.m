//
//  PauseViewController.m
//  SimonSays
//
//  Created by Brian Dinh on 8/3/13.
//  Copyright (c) 2013 Brian Dinh. All rights reserved.
//

#import "PauseViewController.h"

@interface PauseViewController (){
    
}
- (IBAction)home:(id)sender;

@end

@implementation PauseViewController

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

    [self.view removeFromSuperview];

    
}

- (IBAction)home:(id)sender {
    
}
@end
