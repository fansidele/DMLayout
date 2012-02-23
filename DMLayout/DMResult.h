//
//  DMResult.h
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMResult : NSObject{
    
    NSString *titleLabel;
    NSString *snippetLabel;
    NSURL *resultImageURL;
    UIImage *resultImage;
    
}

@property(nonatomic,retain)NSString *titleLabel;
@property(nonatomic,retain)NSString *snippetLabel;
@property(nonatomic,retain)UIImage *resultImage;
@property(nonatomic,retain)NSURL *resultImageURL;

@end
