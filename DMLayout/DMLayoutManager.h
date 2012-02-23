//
//  DMLayoutManager.h
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMLayoutCell.h"
#import "DMRowObject.h"

typedef enum{
    HALFCELL = 0,
    THIRDCELL,
    TWOTHIRDCELL,
    THREETHIRDCELL
}Cells;

@interface DMLayoutManager : NSObject<UITableViewDataSource>{
    
    IBOutlet DMLayoutCell *HalfCell;
    IBOutlet DMLayoutCell *ThirdCell;
    IBOutlet DMLayoutCell *TwoThirdsCell;
    IBOutlet DMLayoutCell *ThreeThirdsCell;
    
    NSMutableArray *data;
    
    NSMutableArray *rowData;
    
}

@property(nonatomic,retain)IBOutlet DMLayoutCell *HalfCell;
@property(nonatomic,retain)IBOutlet DMLayoutCell *ThirdCell;
@property(nonatomic,retain)IBOutlet DMLayoutCell *TwoThirdsCell;
@property(nonatomic,retain)IBOutlet DMLayoutCell *ThreeThirdsCell;

@end
