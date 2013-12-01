//
//  AhmViewController.h
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AhmViewController : UIViewController <UITextFieldDelegate> {

}

- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring;
- (IBAction)goClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtChooseYourDestiny;
@property (weak, nonatomic) IBOutlet UITextField *txtTheVoid;
@property (weak, nonatomic) IBOutlet UILabel *lblVehicleModel;
@property (weak, nonatomic) IBOutlet UIButton *btnGo;

@end
