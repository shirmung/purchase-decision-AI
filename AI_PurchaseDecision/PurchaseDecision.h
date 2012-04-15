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
}

@property (nonatomic, assign) float threshold;

- (float)partA:(Agent *)agent :(Jeans *)jeans;
- (int)partB:(Agent *)agent;
- (float)partC;

@end
