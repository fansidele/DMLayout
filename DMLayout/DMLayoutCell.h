//
//  DMLayoutCell.h
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMLayoutView.h"
#import "DMResult.h"
#import "DMRowObject.h"
#import "DMManagedImageV.h"

typedef enum{
    NULLCELL = 0,
    SINGLECELL,
    DOUBLECELL,
    TRIPLECELL,
}CellFormat;

@interface DMLayoutCell : UITableViewCell{
    
    IBOutlet DMManagedImageV *leftView;
    IBOutlet DMManagedImageV *rightView;
    IBOutlet DMManagedImageV *middleView;

    
}

-(void)setResults:(DMRowObject *)rowObject;

@end
