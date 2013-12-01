//
//  DetailsVC.h
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsVC : UIViewController

- (void)SetupVC:(NSString *) DataPoint;
@property (weak, nonatomic) IBOutlet UITextView *txtDescription;

@end
