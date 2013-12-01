//
//  GameEngine.m
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine
NSPredicate *predicate;

+ (GameEngine *)engine
{
   static dispatch_once_t pred;
   static GameEngine *engine = nil;
   dispatch_once(&pred, ^{
      engine = [[GameEngine alloc] init];
   });
   return engine;
}

- (id)init {
   self = [super init];
   if(self) {
      NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
      session = [NSURLSession sessionWithConfiguration:config];
      predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
      [self loadData];
      [self playTheme];
   }
   return self;
}


- (void)loadData {
   NSURL *url = [NSURL URLWithString:@"http://road-warrior.herokuapp.com/makes"];
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
   [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      if (!error) {
         NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
         if (httpResp.statusCode == 200) {
            NSError *jsonError;
            carMakes = [[NSMutableArray alloc] init];
            carMakes =      [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments
                                                               error:&jsonError];
         }
      }
   }] resume];
}

- (void)LoadCarModels:(NSString *) CarMake {
   NSURL *url = [NSURL URLWithString:@"http://road-warrior.herokuapp.com/models/audi"];
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
   [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      if (!error) {
         NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
         if (httpResp.statusCode == 200) {
            NSError *jsonError;
            carModels = [[NSMutableArray alloc] init];
            carModels =
            [NSJSONSerialization JSONObjectWithData:data
                                            options:NSJSONReadingAllowFragments
                                              error:&jsonError];
            
         }
      }
   }] resume];
}

- (void)BuildPredicate:(NSString *) searchText {
   predicate =  [NSPredicate predicateWithFormat:@" SELF BEGINSWITH  %@", searchText.lowercaseString];
}

- (void)LoadAverages:(NSString *) CarInfo {
   NSURL *url = [NSURL URLWithString:@"http://road-warrior.herokuapp.com/averages/audi/a4"];
   [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
   [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      if (!error) {
         NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
         if (httpResp.statusCode == 200) {
            NSError *jsonError;
            averages = [[NSMutableArray alloc] init];
            averages =
            [NSJSONSerialization JSONObjectWithData:data
                                            options:NSJSONReadingAllowFragments
                                              error:&jsonError];
            
         }
      }
   }] resume];
}

- (void)playSoundEffect:(NSString *) SFXName {
   NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:SFXName ofType:@"mp3"];
   NSData *myData = [NSData dataWithContentsOfFile:soundFilePath];
   
   NSError *error;
   player = [(AVAudioPlayer*)[AVAudioPlayer alloc] initWithData:myData error:nil];
   player.numberOfLoops = 0;
   player.delegate = self;
   if (player == nil) {
		NSLog([error description]);
   }
	else {
         //;[player play];
   }
}

- (NSString *)CarMake {
   if ([[carMakes filteredArrayUsingPredicate:predicate] count] > 1) {
      return [[carMakes filteredArrayUsingPredicate:predicate] objectAtIndex:0];
   }
   return @"";
}

- (NSString *)CarModel {
   if ([[carModels filteredArrayUsingPredicate:predicate] count] > 1) {
      return [[carModels filteredArrayUsingPredicate:predicate] objectAtIndex:0];
   }
   return @"";
}

- (void)playTheme {
   NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"thememusic" ofType:@"mp3"];
   NSData *myData = [NSData dataWithContentsOfFile:soundFilePath];
   
   NSError *error;
   player = [(AVAudioPlayer*)[AVAudioPlayer alloc] initWithData:myData error:nil];
   player.numberOfLoops = -1; 
   player.delegate = self;
   if (player == nil) {
		NSLog([error debugDescription]);
   }
	else {
		[player play];
   }
}

@end
