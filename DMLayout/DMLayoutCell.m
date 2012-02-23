//
//  DMLayoutCell.m
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import "DMLayoutCell.h"

@implementation DMLayoutCell


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if(self == [super initWithCoder:aDecoder]){
        
    }
    return self;
}

-(void)setResults:(DMRowObject *)rowObject{
    
    switch ([rowObject.results count]) {
        case NULLCELL:
            break;
        case SINGLECELL:
            [leftView setUrl:[[rowObject.results objectAtIndex:0] resultImageURL]];
            break;
        case DOUBLECELL:
            break;
        case TRIPLECELL:
            break;
        default:
            break;
    }
    
    
}




@end
