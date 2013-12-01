//
//  AhmViewController.m
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import "AhmViewController.h"
#import "GameEngine.h"
#import "CarColorViewController.h"
#import "SVProgressHUD.h"

@implementation AhmViewController


- (void)viewDidLoad
{
   [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
      // Dispose of any resources that can be recreated.
}


- (void)searchAutocompleteEntriesWithSubstring:(NSString *)substring {
   
      // Put anything that starts with this substring into the autocompleteUrls array
      // The items in this array is what will show up in the table view
//   [autocompleteUrls removeAllObjects];
//   for(NSString *curString in pastUrls) {
//      NSRange substringRange = [curString rangeOfString:substring];
//      if (substringRange.location == 0) {
//         [autocompleteUrls addObject:curString];
//      }
//   }
//   [autocompleteTableView reloadData];
}

#pragma mark UITextFieldDelegate methods

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
   
   if (textField == self.txtChooseYourDestiny) {
      
   }
   else {
      
   }
   return YES;
}

- (void)configureUI {
   if(self.txtTheVoid.hidden) {
      self.txtTheVoid.hidden = NO;
      self.lblVehicleModel.hidden = NO;
      self.btnGo.hidden = NO;
      [[GameEngine engine] LoadCarModels:self.txtChooseYourDestiny.text];
   }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   NSString *currentString = [textField.text stringByReplacingCharactersInRange:range withString:string];
   [[GameEngine engine] BuildPredicate:currentString];
   if([textField isEqual:self.txtChooseYourDestiny]) {
      if([[[GameEngine engine] CarMake] isEqualToString:@""]) {
         return YES;
      }
      textField.text = [[GameEngine engine] CarMake];
      [self configureUI];
      return NO;
   }
   else {
      textField.text = @"a4";
      [self.txtTheVoid resignFirstResponder];
      return YES;
//      if([[[GameEngine engine] CarModel] isEqualToString:@""]) {
//         textField.text = @"a4";
//         return YES;
//      }
//      textField.text = [[GameEngine engine] CarModel];
//      return NO;
   }
}


- (void)goPressed {
   [self.txtChooseYourDestiny resignFirstResponder];
   [self.txtTheVoid resignFirstResponder];
   [[GameEngine engine] LoadAverages:@"Test"];
   
   [SVProgressHUD dismiss];
   CarColorViewController *carVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CarColorViewController"];
   [self.navigationController pushViewController:carVC animated:YES];

//   autocompleteTableView.hidden = YES;
//   
//      // Tell the web view controller where to go
//   webViewController.url = urlField.text;
//   
//      // Add the URL to the list of entered URLS as long as it isn't already there
//   if (![pastUrls containsObject:urlField.text]) {
//      [pastUrls addObject:urlField.text];
//   }
}


- (IBAction)goClicked:(id)sender {
      [SVProgressHUD showWithStatus:@"Calculating Data........" maskType:SVProgressHUDMaskTypeGradient];
   [self performSelector:@selector(goPressed) withObject:nil afterDelay:1.0];
}
@end
