//
//  DetailsVC.m
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import "DetailsVC.h"

@interface DetailsVC ()

@end

@implementation DetailsVC

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

- (void)SetupVC:(NSString *) DataPoint {
   if ([DataPoint isEqualToString:@"rpm"]) {
      [self.txtDescription setText:@"Drivers Achieved the best performance when commiting to an rpm below that"];
   }
   else if ([DataPoint isEqualToString:@"speed"]) {
      [self.txtDescription setText:@"Drivers Achieved the best performance when commiting to a speed below that"];
   }
   else if ([DataPoint isEqualToString:@"mpg"]) {
          [self.txtDescription setText:@"Drivers Achieved the best performance when commiting to an mpg below that"];
   }

}

@end
