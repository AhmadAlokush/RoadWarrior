//
//  AhmViewController.m
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import "AhmViewController.h"
#import "GameEngine.h"



@implementation AhmViewController
@synthesize  autocompleteCarMake;
@synthesize autocompleteCarModel;

- (void)viewDidLoad
{
//   autocompleteCarMake = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 220, 80) style:UITableViewStylePlain];
//   autocompleteCarMake.delegate = self;
//   autocompleteCarMake.dataSource = self;
//   autocompleteCarMake.scrollEnabled = YES;
//   autocompleteCarMake.hidden = YES;
//   [self.view addSubview:autocompleteCarMake];
//
//   autocompleteCarModel = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, 220, 80) style:UITableViewStylePlain];
//   autocompleteCarModel.delegate = self;
//   autocompleteCarModel.dataSource = self;
//   autocompleteCarModel.scrollEnabled = YES;
//   autocompleteCarModel.hidden = YES;
//   [self.view addSubview:autocompleteCarModel];
    [[GameEngine engine] init];
    [super viewDidLoad];
  	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark UITextFieldDelegate methods
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//   autocompleteTableView.hidden = NO;
//   
//   NSString *substring = [NSString stringWithString:textField.text];
//   substring = [substring stringByReplacingCharactersInRange:range withString:string];
//   [self searchAutocompleteEntriesWithSubstring:substring];
//   return YES;
//}
//
//#pragma mark UITableViewDataSource methods
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
//   return autocompleteUrls.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//   
//   UITableViewCell *cell = nil;
//   static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
//   cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
//   if (cell == nil) {
//      cell = [[[UITableViewCell alloc]
//               initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier] autorelease];
//   }
//   
//   cell.textLabel.text = [autocompleteUrls objectAtIndex:indexPath.row];
//   return cell;
//}
//
//#pragma mark UITableViewDelegate methods
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//   
//   UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//   urlField.text = selectedCell.textLabel.text;
//   
//   [self goPressed];
//   
//}
//
//- (void)goPressed {
//   
//      // Clean up UI
//   [urlField resignFirstResponder];
//   autocompleteTableView.hidden = YES;
//   
//      // Tell the web view controller where to go
//   webViewController.url = urlField.text;
//   
//      // Add the URL to the list of entered URLS as long as it isn't already there
//   if (![pastUrls containsObject:urlField.text]) {
//      [pastUrls addObject:urlField.text];
//   }
//   
//      // Push the wev view controller onto the stack
//   [self.navigationController pushViewController:self.webViewController animated:YES];
//}
//


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
