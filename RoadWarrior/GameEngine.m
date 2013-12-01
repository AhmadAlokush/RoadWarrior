//
//  GameEngine.m
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

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
      [self loadData];
      [self playTheme];
   }
   return self;
}


- (void)loadData {
   
}

- (void)playSoundEffect:(NSString *) SFXName {
   NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:SFXName ofType:@"mp3"];
   NSData *myData = [NSData dataWithContentsOfFile:soundFilePath];
   
   NSError *error;
   player = [(AVAudioPlayer*)[AVAudioPlayer alloc] initWithData:myData error:nil];
   player.numberOfLoops = 0;
   player.delegate = self;
   if (player == nil) {
		NSLog([error debugDescription]);
   }
	else {
         //;[player play];
   }
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
