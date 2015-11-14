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

@end

@implementation RateProfViewController
- (IBAction)buttonPressed:(UIButton *)sender {
    if ([sender.titleLabel.text isEqualToString: @"Back"]) {
        
        [UIView animateWithDuration:0.75
                         animations:^(void){
                             self.tray.center = CGPointMake(self.tray.center.x + self.tray.frame.size.width/3, self.tray.center.y);
                         }];
        
    }
    
    else if ([sender.titleLabel.text isEqualToString:@"Next"]){
        
        [UIView animateWithDuration:0.75
                         animations:^(void){
                            self.tray.center = CGPointMake(self.tray.center.x - self.tray.frame.size.width/3, self.tray.center.y);

        }];
        
    }
}



@end
