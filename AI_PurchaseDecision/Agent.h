//
//  Agent.h
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/11/12.
//  Copyright (c) 2012. All rights reserved.
//

@interface Agent : NSObject
{
    float budget;
    float fit;
    float trust;
    float fashion;
    
    // combination weights for simulating purchase probability in part A
    float rhoLC;
    float rhoUC;
    float lambdaLC;
    float lambdaUC;
    
    // combination weights for choosing a like value in part B
    float phiLC;
    float phiUC;
    float tauLC;
    float tauUC;
    float gammaLC;
    float gammaUC;
}

@property (nonatomic, assign) float budget;
@property (nonatomic, assign) float fit;
@property (nonatomic, assign) float trust;
@property (nonatomic, assign) float fashion;

@property (nonatomic, assign) float rhoLC;
@property (nonatomic, assign) float rhoUC;
@property (nonatomic, assign) float lambdaLC;
@property (nonatomic, assign) float lambdaUC;

@property (nonatomic, assign) float phiLC;
@property (nonatomic, assign) float phiUC;
@property (nonatomic, assign) float tauLC;
@property (nonatomic, assign) float tauUC;
@property (nonatomic, assign) float gammaLC;
@property (nonatomic, assign) float gammaUC;

- (id)initWithBudget:(float)aBudget Fit:(float)aFit Trust:(float)aTrust Fashion:(float)aFashion 
               RhoLC:(float)aRhoLC RhoUC:(float)aRhoUC LambdaLC:(float)aLambdaLC LambdaUC:(float)aLambdaUC 
               PhiLC:(float)aPhiLC PhiUC:(float)aPhiUC TauLC:(float)aTauLC TauUC:(float)aTauUC GammaLC:(float)aGammaLC GammaUC:(float)aGammaUC;

@end
