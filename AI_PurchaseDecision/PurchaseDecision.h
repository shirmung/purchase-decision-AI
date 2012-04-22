//
//  PurchaseDecision.h
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/4/12.
//  Copyright (c) 2012. All rights reserved.
//

@class Agent;
@class Jeans;

@interface PurchaseDecision : NSObject
{
    float threshold;

    NSArray *advertising;
}

@property (nonatomic, assign) float threshold;

@property (nonatomic, retain) NSArray *advertising;

- (float)partA:(Agent *)agent1 :(Jeans *)jeans :(int)time;
- (int)partB:(Agent *)agent1 :(int)time;
- (int)partC:(Agent *)agent1 :(int)time;

@end
