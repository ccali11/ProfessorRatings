//
//  SelectCourseViewController.m
//  Professors Reviews
//
//  Created by Christopher Cali on 11/4/15.
//  Copyright (c) 2015 CJC. All rights reserved.
//

#import "SelectCourseViewController.h"

@interface SelectCourseViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SelectCourseViewController

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * myCell = [tableView dequeueReusableCellWithIdentifier:@"CourseAndProfCell"];
    if (!myCell) {
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CourseAndProfCell"];
    }
    myCell.textLabel.text = @"Professor";
    myCell.detailTextLabel.text = @"Course ID";
    return myCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



@end
