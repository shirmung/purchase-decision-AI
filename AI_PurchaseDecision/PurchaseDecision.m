//
//  PurchaseDecision.m
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/4/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "PurchaseDecision.h"

#define M_E 2.71828182845904523536028747135266250

@implementation PurchaseDecision

- (id)init
{
    self = [super init];
    
    if (self) {
        //create new agent with specified values
        //create new pair of jeans with specified values
        //call methods on agent and pair of jeans
        
        [self partB];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark

- (void)partB
{
    float rhoLC = 0.2;
    float rhoUC = 1.1;
    
    float price = 10.0;
    float budget = 30.0;
    
    float lambdaLC = 1.5;
    float lambdaUC = 2.0;
    
    for (int time = 1; time <= 10; time++) {
        float like = [self partC];
    
        float mB = ((rhoLC * pow((price / (budget - price)), rhoUC)) + (lambdaLC * pow(fabsf(1.0 - (0.25 * like)), lambdaUC)) - 2);
    
        float purchase = 1.0/(1.0 + pow(M_E, mB));
        
        NSLog(@"%f at time %i", purchase, time);
    }
}

- (float)partC 
{
    float phiLC = 1.0;
    float phiUC = 1.2;
    
    float fit = 0.6;//1.0;
    
    float tauLC = 1.0;
    float tauUC = 1.5;
    
    float trust = 0.6;//1.0;
    
    float gammaLC = 1.0;
    float gammaUC = 1.1;
    
    float fashion = [self partD];
    
    float zLike;
    float mC;
    float like;
                                                        
    for (int sLike = 0; sLike <= 4; sLike++) {
        zLike = pow(M_E, (-1 * 0.25 * sLike));
        
        mC = (phiLC * pow(fabsf((0.25 * sLike) - fit), phiUC)) + (tauLC * pow(fabsf((0.25 * sLike) - trust), tauUC)) + (gammaLC * pow(0.25, gammaUC) * pow(fabsf(sLike - fashion), gammaUC));
        
        like = like + (0.25 * sLike * (1 / zLike) * pow(M_E, (-1 * mC)));
    }                                                   
    
    NSLog(@"%f", like);
    
    return like;
}

- (float)partD 
{    
    float fashion = 0.0;
    
    NSLog(@"%f", fashion);
    
    return fashion;
}

@end
