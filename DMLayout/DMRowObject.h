//
//  DMRowObject.h
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMRowObject : NSObject{
    
    NSNumber *cellIdentifier;
    NSMutableArray *results;
    
}
@property(nonatomic,retain)NSNumber *cellIdentifier;
@property(nonatomic,retain)NSMutableArray *results;


@end
