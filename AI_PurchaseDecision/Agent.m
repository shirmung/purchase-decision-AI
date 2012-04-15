//
//  Agent.m
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/11/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "Agent.h"

@implementation Agent

@synthesize budget, fit, trust, fashion;
@synthesize rhoLC, rhoUC, lambdaLC, lambdaUC;
@synthesize phiLC, phiUC, tauLC, tauUC, gammaLC, gammaUC;

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (id)initWithBudget:(float)aBudget Fit:(float)aFit Trust:(float)aTrust Fashion:(float)aFashion 
               RhoLC:(float)aRhoLC RhoUC:(float)aRhoUC LambdaLC:(float)aLambdaLC LambdaUC:(float)aLambdaUC 
               PhiLC:(float)aPhiLC PhiUC:(float)aPhiUC TauLC:(float)aTauLC TauUC:(float)aTauUC GammaLC:(float)aGammaLC GammaUC:(float)aGammaUC
{
    self = [super init];
    
    if (self) {
        self.budget = aBudget;
        self.fit = aFit;
        self.trust = aTrust;
        self.fashion = aFashion;
        
        self.rhoLC = aRhoLC;
        self.rhoUC = aRhoUC;
        self.lambdaLC = aLambdaLC;
        self.lambdaUC = aLambdaUC;
        
        self.phiLC = aPhiLC;
        self.phiUC = aPhiUC;
        self.tauLC = aTauLC;
        self.tauUC = aTauUC;
        self.gammaLC = aGammaLC;
        self.gammaUC = aGammaUC;
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
