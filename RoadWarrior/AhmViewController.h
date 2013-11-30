//
//  AhmViewController.h
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AhmViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
   UITableView *autocompleteCarMake;
   UITableView *autocompleteCarModel;
}

@property (nonatomic, retain) UITableView *autocompleteCarMake;
@property (nonatomic, retain) UITableView *autocompleteCarModel;

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring;

@end
