//
//  Jeans.m
//  AI_PurchaseDecision
//
//  Created by Shirmung Bielefeld on 4/11/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "Jeans.h"

@implementation Jeans

@synthesize price;

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (id)initWithPrice:(float)aPrice
{
    self = [super init];
    
    if (self) {
        self.price = aPrice;
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}


@end
