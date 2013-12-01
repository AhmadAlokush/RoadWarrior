//
//  GameEngine.h
//  RoadWarrior
//
//  Created by Ahmad on 11/30/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface GameEngine : NSObject <AVAudioPlayerDelegate> {
   NSMutableArray *carMakes;
   NSMutableArray *carModels;
   NSMutableArray *averages;
   AVAudioPlayer *player;
   NSURLSession *session;
}

+ (GameEngine *)engine;
- (void)playSoundEffect:(NSString *) SFXName;
- (void)LoadCarModels:(NSString *) CarMake;
- (void)LoadAverages:(NSString *) CarInfo;
- (NSString *)CarMake;
- (NSString *)CarModel;
- (void)BuildPredicate:(NSString *) searchText;
@end
