//
//  SingleQuestionView.m
//  Professors Reviews
//
//  Created by Christopher Cali on 12/3/15.
//  Copyright © 2015 CJC. All rights reserved.
//

#import "SingleQuestionView.h"
@interface SingleQuestionView ()

@property (nonatomic, strong) UIView * myView;

@end

@implementation SingleQuestionView

/*INITIALIZERS*/
//Overriding init method. Need this because we're loading a xib so that we have programmatic control during setup of the view

- (instancetype)initWithFrame:(CGRect)frame {
    //Need to use this line every time I use an init method to setup the inheritence model
    self = [super initWithFrame:frame];
    //Need this line in case the super class screwed up
    if (self) {
        [self xibSetup];
    }
    return self;
}

//Overide initWithCoder when using the storyboard to initialize this view
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self xibSetup];
    }
    return self;
}

/*XIB SETUP */
//We need to use these two files because we are using a xib file; therefore you must programatically load stuff
//This method will turn xml into actual memory object (UIView) and adds it as a subview filling our entire root view
- (void) xibSetup {
    self.myView = [self loadViewFromNib];
    self.myView.frame = self.bounds;
    self.myView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:self.myView];
}


- (UIView *) loadViewFromNib {
    NSBundle * bundle = [NSBundle bundleForClass: [self class]];
    UINib * nib = [UINib nibWithNibName:@"SingleQuestionView" bundle:bundle];
    NSArray * nibArray = [nib instantiateWithOwner:self options:nil];
    UIView * view = nibArray[0];
    return view;
}

@end
