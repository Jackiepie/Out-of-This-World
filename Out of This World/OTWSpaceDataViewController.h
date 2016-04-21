//
//  OTWSpaceDataViewController.h
//  Out of This World
//
//  Created by Jackie Lee on 16/2/8.
//  Copyright © 2016年 LFW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTWSpaceObject.h"

@interface OTWSpaceDataViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) OTWSpaceObject *spaceObject;

@end
