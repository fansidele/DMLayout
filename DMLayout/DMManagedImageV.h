//
//  DMManagedImageV.h
//  DMLayout
//
//  Created by DAVID MURPHY on 22/02/2012.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HJManagedImageV.h"

@interface DMManagedImageV : HJManagedImageV<HJManagedImageVDelegate>{
    
    
}

-(UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize image:(UIImage *)_image;

-(UIImage *)cropImage:(UIImage *)theImage;

@end
