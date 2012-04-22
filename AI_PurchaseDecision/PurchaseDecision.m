//
//  PurchaseDecision.m
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/4/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "PurchaseDecision.h"
#import "Agent.h"
#import "Jeans.h"

#define M_E 2.71828182845904523536028747135266250

@implementation PurchaseDecision

@synthesize threshold;
@synthesize advertising;

- (id)init
{
    self = [super init];
    
    if (self) {
        threshold = 0.5;
        
        advertising = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:0.75], [NSNumber numberWithFloat:0.75], [NSNumber numberWithFloat:0.75],
                                                       [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0],
                                                       [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.0], 
                                                       [NSNumber numberWithFloat:0.0], nil];
        
        Jeans *jeans1 = [[Jeans alloc] initWithPrice:10.0];
    
        NSArray *alphaLC1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0], nil];
        NSArray *alphaUC1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:1.0], [NSNumber numberWithFloat:0.0],  nil];
        
        Agent *agent1 = [[Agent alloc] initWithNumber:1 Budget:30.0 Fit:0.6 Trust:0.6 Fashion:1
                                                RhoLC:0.2 RhoUC:1.1 LambdaLC:1.5 LambdaUC:2.0
                                                PhiLC:1.0 PhiUC:1.2 TauLC:1.0 TauUC:1.5 GammaLC:3.5 GammaUC:0.3
                                                Delta:1.0 AlphaLC:alphaLC1 AlphaUC:alphaUC1];
        
        for (int time = 1; time <= 10; time++) {
            float purchase = [self partA:agent1 :jeans1 :time];
            
            if (purchase >= threshold) {
                NSLog(@"REACHES THRESHOLD WITH %f AT TIME %i", purchase, time);
            } else {
                NSLog(@"DOES NOT REACH THRESHOLD WITH %f AT TIME %i", purchase, time);
            }
        }
    }
    
    return self;
}

- (void)dealloc
{
    [advertising release];
    
    [super dealloc];
}

#pragma mark - Probability

- (float)partA:(Agent *)agent :(Jeans *)jeans :(int)time
{
    // represents how much an agent likes a pair of jeans
    // ∈ {0, 1, 2, 3, 4)
    int like = [self partB:agent :time];
    float mLike = agent.lambdaLC * pow(fabsf(1.0 - (0.25 * like)), agent.lambdaUC);
        
    // represents an agent's ability to purchase a pair of jeans
    float mPrice = agent.rhoLC * pow((jeans.price / (agent.budget - jeans.price)), agent.rhoUC);
        
    float m = (mPrice + mLike - 2.0);
    
    // purchase probability
    float purchase = 1.0/(1.0 + pow(M_E, m));
    
    return purchase;
}

- (int)partB:(Agent *)agent :(int)time
{
    // ∈ {0, 1, 2, 3, 4)
    int fashion = [self partC:agent :time];
    
    float m = MAX_INPUT;
    int like;
                                                        
    for (int sLike = 0; sLike <= 4; sLike++) {
        // represents how well an agent feels a pair of jeans fits
        float mFit = agent.phiLC * pow((fabsf((0.25 * sLike) - agent.fit)), agent.phiUC);
        
        // represents how much an agent trusts the brand of a pair of jeans
        float mTrust = agent.tauLC * pow(fabsf((0.25 * sLike) - agent.trust), agent.tauUC);

        // represents an agent's sense of fashion
        float mFashion = agent.gammaLC * pow(0.25, agent.gammaUC) * pow(fabsf(sLike - fashion), agent.gammaUC); 
       
        float mTemp = mFit + mTrust + mFashion;
    
        if (mTemp < m) {
            m = mTemp;
            like = sLike;
        } 
    }

    return like;
}

- (int)partC:(Agent *)agent :(int)time
{       
    NSMutableArray *pTemp = [[NSMutableArray alloc] init];
    
    float m = -1;
    int fashion;
    
    for (int sFashion = 0; sFashion <= 4; sFashion++) {
        float mTemp = 0.0;

        for (int pFashion = 0; pFashion <= 4; pFashion++) {
            // represents effect of advertising
            float mAdvertising = ([[advertising objectAtIndex:(time - 1)] floatValue] * pow(fabsf(sFashion - MIN((pFashion + 1), 4)), agent.delta));
            
            // represents how much agent values own opinion
            float mSelf = ([[agent.alphaLC objectAtIndex:(agent.number - 1)] floatValue] * pow(fabsf(sFashion - pFashion), [[agent.alphaUC objectAtIndex:(agent.number - 1)] floatValue]));
            
            mTemp = mTemp + (pow(M_E, (-1 * (mAdvertising + mSelf))) * [[agent.p objectAtIndex:pFashion] floatValue]);
        }
        
        [pTemp addObject:[NSNumber numberWithFloat:mTemp]];
        
        if (mTemp > m) {
            m = mTemp;
            fashion = sFashion;
        }
    }
    
    [agent.p replaceObjectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 5)] withObjects:pTemp];

    return fashion;
}

@end