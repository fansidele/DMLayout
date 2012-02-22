//
//  DMLayoutManager.m
//  DMLayout
//
//  Created by David Murphy on 2/21/12.
//  Copyright (c) 2012 CLARITY. All rights reserved.
//

#import "DMLayoutManager.h"

@implementation DMLayoutManager
@synthesize HalfCell;
@synthesize ThirdCell;
@synthesize TwoThirdsCell;
@synthesize ThreeThirdsCell;

NSArray *indentifiers;

-(id)init{
    
    if(self == [super init]){
        indentifiers = [[NSArray alloc]initWithObjects:@"HalfCell",@"ThirdCell",@"TwoThirdsCell",@"ThreeThirdsCell",nil];
        
        data = [[NSMutableArray alloc]init];
        
        [data addObject:[[[DMRowObject alloc] init] autorelease]];
        [data addObject:[[[DMRowObject alloc] init] autorelease]];
        [data addObject:[[[DMRowObject alloc] init] autorelease]];

        
    }
    return self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DMLayoutCell *cell;
    DMRowObject *rowObject = [data objectAtIndex:indexPath.row];
    
    if([rowObject cellIdentifier]){
        cell = [tableView dequeueReusableCellWithIdentifier:[indentifiers objectAtIndex:[[rowObject cellIdentifier]intValue]]];
    }else{
        int cellType = arc4random() % [indentifiers count];
        cell = [tableView dequeueReusableCellWithIdentifier:[indentifiers objectAtIndex:cellType]];
        [[data objectAtIndex:indexPath.row] setCellIdentifier:[NSNumber numberWithInt:cellType]];
    }
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"DMCellLayout" owner:self options:nil];
        switch ([rowObject.cellIdentifier intValue]) {
            case HALFCELL:
                cell = HalfCell;
                self.HalfCell = nil;
                break;
            case THIRDCELL:
                cell = ThirdCell;
                self.ThirdCell = nil;
                break;
            case TWOTHIRDCELL:
                cell = TwoThirdsCell;
                self.TwoThirdsCell = nil;
                break;
            case THREETHIRDCELL:
                cell = ThreeThirdsCell;
                self.ThreeThirdsCell = nil;
                break;
            default:
                break;
        }
    
    }
    return cell;

}


-(void)dealloc{
    [data release];
    [super dealloc];
}

@end
