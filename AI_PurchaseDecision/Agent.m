//
//  Agent.m
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/11/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "Agent.h"

@implementation Agent

@synthesize number, budget, fit, trust, fashion;
@synthesize rhoLC, rhoUC, lambdaLC, lambdaUC;
@synthesize phiLC, phiUC, tauLC, tauUC, gammaLC, gammaUC;
@synthesize delta, alphaLC, alphaUC;

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (id)initWithNumber:(int)aNumber Budget:(float)aBudget Fit:(float)aFit Trust:(float)aTrust Fashion:(int)aFashion 
               RhoLC:(float)aRhoLC RhoUC:(float)aRhoUC LambdaLC:(float)aLambdaLC LambdaUC:(float)aLambdaUC 
               PhiLC:(float)aPhiLC PhiUC:(float)aPhiUC TauLC:(float)aTauLC TauUC:(float)aTauUC GammaLC:(float)aGammaLC GammaUC:(float)aGammaUC
               Delta:(float)aDelta AlphaLC:(NSArray *)aAlphaLC AlphaUC:(NSArray *)aAlphaUC
{
    self = [super init];
    
    if (self) {
        number = aNumber;
        budget = aBudget;
        fit = aFit;
        trust = aTrust;
        fashion = aFashion;
        
        rhoLC = aRhoLC;
        rhoUC = aRhoUC;
        lambdaLC = aLambdaLC;
        lambdaUC = aLambdaUC;
        
        phiLC = aPhiLC;
        phiUC = aPhiUC;
        tauLC = aTauLC;
        tauUC = aTauUC;
        gammaLC = aGammaLC;
        gammaUC = aGammaUC;
        
        delta = aDelta;
        alphaLC = [[NSArray alloc] initWithArray:aAlphaLC];
        alphaUC = [[NSArray alloc] initWithArray:aAlphaUC];
    }
    
    return self;
}

- (void)dealloc
{
    [alphaLC release];
    [alphaUC release];
    
    [super dealloc];
}

@end