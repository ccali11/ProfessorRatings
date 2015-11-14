//
//  SelectCourseViewController.m
//  Professors Reviews
//
//  Created by Christopher Cali on 11/4/15.
//  Copyright (c) 2015 CJC. All rights reserved.
//

// Importing subclass to NSSomething
#import "SelectCourseViewController.h"

//Calling interface UIViewController class to interact with implementation and serve as infrastructure
@interface SelectCourseViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation SelectCourseViewController

//TableView Data Source

//Declaring number of rows in table
-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

//This function builds the cells
-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Declares a variable, calls it myCell, asks if there is a cell with the reuse identifier (Course & Prof)
    UITableViewCell * myCell = [tableView dequeueReusableCellWithIdentifier:@"CourseAndProfCell"];
    if (!myCell) {
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                        reuseIdentifier:@"CourseAndProfCell"];
    }

//Creating fields for table
    myCell.textLabel.text = @"Professor";
    myCell.detailTextLabel.text = @"Course ID";
    return myCell;
}

//I think this is to remind app that where the user is with respect to its starting location within the app
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//End TableView Data Source


//Beginning TableView Delegate
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"CourseList to Prof"
                              sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
