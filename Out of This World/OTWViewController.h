//
//  OTWViewController.h
//  Out of This World
//
//  Created by Jackie Lee on 16/2/6.
//  Copyright © 2016年 LFW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTWSpaceObject.h"

@interface OTWViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) OTWSpaceObject *spaceObject;

@end
