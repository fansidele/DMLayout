//
//  DMRowObject.m
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import "DMRowObject.h"

@implementation DMRowObject
@synthesize cellIdentifier;
@synthesize results;

-(id)init{
    if(self == [super init]){
        
        results = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(void)dealloc{
    [results release];
    [super dealloc];
}

@end
