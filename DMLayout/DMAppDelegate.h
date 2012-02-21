//
//  DMAppDelegate.h
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMViewController;

@interface DMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DMViewController *viewController;

@end
