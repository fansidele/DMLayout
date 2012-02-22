//
//  DMManagedImageV.m
//  DMLayout
//
//  Created by DAVID MURPHY on 22/02/2012.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import "DMManagedImageV.h"

@implementation DMManagedImageV

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
		isCancelled=NO;
		modification=0;
		url=nil;
		onImageTap = nil;
		index = -1;
		self.userInteractionEnabled = NO; //because want to treat it like a UIImageView. Just turn this back on if you want to catch taps.
    }
    return self;
}


//Handle cropping the image returned via the HJObjManager
-(void)managedObjReady{
    [moHandler setManagedObj:[self cropImage:moHandler.managedObj]];
    [super managedObjReady];
}


-(void)setImage:(UIImage *)theImage{
    if (theImage==image) {
		//when the same image is on the screen multiple times, an image that is alredy set might be set again with the same image.
		return; 
	}
    [theImage retain];
	[image release];
	image = theImage;
	[imageView removeFromSuperview];
	self.imageView = [[[UIImageView alloc] initWithImage:theImage] autorelease];
	[self addSubview:imageView];
	[imageView setNeedsLayout];
	[self setNeedsLayout];
	[loadingWheel stopAnimating];
	[loadingWheel removeFromSuperview];
	self.loadingWheel = nil;
	self.hidden=NO;
	if (image!=nil) {
		[callbackOnSetImage managedImageSet:self];
	}
}

-(void)setImageView:(UIImageView *)_imageView{
    [imageView removeFromSuperview];
    [self addSubview:_imageView];
    self.hidden=NO;
    
}


-(UIImage *)cropImage:(UIImage *)theImage{
    
    //Scale imageView proportionately
    CGSize size = CGSizeMake(self.frame.size.width,theImage.size.height);
    theImage = [self imageByScalingProportionallyToSize:size image:theImage];
    
    //crop it
    CGImageRef imageRef = CGImageCreateWithImageInRect([theImage CGImage],CGRectMake(0,(theImage.size.height-self.frame.size.height)/2,self.frame.size.width,self.frame.size.height));
    theImage = [UIImage imageWithCGImage:imageRef];
    
    return theImage;
}

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize image:(UIImage *)_image {
	
	UIImage *newImage = nil;
	
	CGSize imageSize = _image.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
    
	if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
		
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        if (widthFactor < heightFactor) 
			scaleFactor = widthFactor;
        else
			scaleFactor = heightFactor;
		
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
	}
    
	UIGraphicsBeginImageContext(CGSizeMake(scaledWidth, scaledHeight));
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = CGPointZero;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[_image drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	if(newImage == nil) 
        NSLog(@"could not scale image");
	
	return newImage;
}


-(void)dealloc{
    callbackOnCancel = nil;
    callbackOnSetImage = nil;
    [super dealloc];
}

@end
