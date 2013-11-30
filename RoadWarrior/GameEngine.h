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
   AVAudioPlayer *player;
}

+ (GameEngine *)engine;
@end