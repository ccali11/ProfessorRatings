//
//  RateProfViewController.m
//  Professors Reviews
//
//  Created by Christopher Cali on 11/14/15.
//  Copyright © 2015 CJC. All rights reserved.
//

#import "RateProfViewController.h"

@interface RateProfViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@property (weak, nonatomic) IBOutlet UIView *tray;

@property (nonatomic) int questionNumber;

@property (nonatomic) int questionCountTotal;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@end

//This is the tray. Animate moving the tray 0.75s
@implementation RateProfViewController

/* VIEW LIFECYCLE */
- (void)viewDidLoad {
    [super viewDidLoad]; //always call super in view lifecyles methods
    self.questionCountTotal = 3;
    self.questionNumber = 1;
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateInterface];
    [super viewWillAppear:animated];//called super later so code happens before anything else is on the screen
}

/* ACTIONS */
//to create this action, we control dragged from one button, then control dragged from the other (highlights entire method)
- (IBAction)buttonPressed:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString: @"Back"])
    
    {
        if (![self atLeftBound]) {
            [self animateBack];
            self.questionNumber--;//the "--" is a decrement; this subtracts 1 and stores it
        }
        
    }
    
    else if ([sender.titleLabel.text isEqualToString:@"Next"])
    {
        if (![self atRightBound]) {
            [self animateForward];
            self.questionNumber++;//the "++" is a increment; this adds 1 and stores is
        }
       
    }
    
    [self updateInterface];
}

/* INTERFACE */
- (void) animateForward {
    [UIView animateWithDuration:0.75
                     animations:^(void){
                         self.tray.center = CGPointMake(self.tray.center.x - self.tray.frame.size.width/3, self.tray.center.y);
                     }];
}

- (void) animateBack {
    [UIView animateWithDuration:0.75
                     animations:^(void){
                         self.tray.center = CGPointMake(self.tray.center.x + self.tray.frame.size.width/3, self.tray.center.y);
                     }];
}

//Higher Level Abstraction for interface - 11/29 contains navigationButtonEnablerDisabler and updateProgressView methods
- (void) updateInterface {
    [self navigationButtonEnablerDisabler];
    [self updateProgressView];
}

- (void) navigationButtonEnablerDisabler {
    
    if ([self atLeftBound]) {
        self.backButton.enabled = NO;
    }
    else {
        self.backButton.enabled =YES;
    }
//Changing "Next" button to say "Submit" at the end of tray. Changing back to "Next" when not at end of tray
    if ([self atRightBound]) {
        self.nextButton.hidden = YES;
        self.submitButton.hidden = NO;
    }
    
    else {
        self.nextButton.hidden = NO;
        self.submitButton.hidden = YES;
    }
    
    
}

- (void) updateProgressView {
    self.progressBar.progress = (double)self.questionNumber/self.questionCountTotal;
}

/* VIEW LOGIC */
- (BOOL) atLeftBound {
    
    if (self.questionNumber <= 1) {
        return YES;
    }  else {
        return NO;
    }
    
}

- (BOOL) atRightBound {
    
    if (self.questionNumber >= self.questionCountTotal) {
        return YES;
    }
    else {
        return NO;
    }
    
}








@end
