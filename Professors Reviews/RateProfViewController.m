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
@property (nonatomic) int myint;

@end

//This is the tray. Animate moving the tray 0.75s
@implementation RateProfViewController
- (IBAction)buttonPressed:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString: @"Back"]) {
        [self animateRight];
        
    }
    
    else if ([sender.titleLabel.text isEqualToString:@"Next"]){
        [self animateLeft];
    }
}

- (void) animateLeft {
    [UIView animateWithDuration:0.75
                     animations:^(void){
                         self.tray.center = CGPointMake(self.tray.center.x - self.tray.frame.size.width/3, self.tray.center.y);
                     }];
}

- (void) animateRight {
    [UIView animateWithDuration:0.75
                     animations:^(void){
                         self.tray.center = CGPointMake(self.tray.center.x + self.tray.frame.size.width/3, self.tray.center.y);
                     }];
}

//Question 1 label







@end
