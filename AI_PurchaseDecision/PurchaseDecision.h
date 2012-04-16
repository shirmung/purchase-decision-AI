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
    
    // for use in part C
    NSArray *advertising;
    float mPrevious;
}

@property (nonatomic, assign) float threshold;

@property (nonatomic, retain) NSArray *advertising;
@property (nonatomic, assign) float mPrevious;

- (float)partA:(Agent *)agent :(Jeans *)jeans :(int)time;
- (int)partB:(Agent *)agent :(int)time;
- (int)partC:(Agent *)agent :(int)time;

@end
