//
//  RateProfViewController.m
//  Professors Reviews
//
//  Created by Christopher Cali on 11/14/15.
//  Copyright © 2015 CJC. All rights reserved.
//

#import "RateProfViewController.h"

@interface RateProfViewController ()

@property (weak, nonatomic) IBOutlet UIView *tray;
@property (nonatomic) int questionNumber;

@property (nonatomic) int questionCountTotal;

@end

//This is the tray. Animate moving the tray 0.75s
@implementation RateProfViewController

//View Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.questionCountTotal = 3;
    self.questionNumber = 1;
}


- (IBAction)buttonPressed:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString: @"Back"])
    
    {
        if (![self atLeftBound]) {
            [self animateBack];
            self.questionNumber--;
        }
        
    }
    
    else if ([sender.titleLabel.text isEqualToString:@"Next"])
    {
        if (![self atRightBound]) {
            [self animateForward];
            self.questionNumber++;
        }
    }
    
    
}

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

//Question 1 label







@end
