//
//  OTWSpaceObject.h
//  Out of This World
//
//  Created by Jackie Lee on 16/2/5.
//  Copyright © 2016年 LFW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OTWSpaceObject : NSObject

@property (strong, nonatomic)   UIImage     *spaceImage;

@property (strong, nonatomic)   NSString    *name;
@property (strong, nonatomic)   NSString    *nickname;
@property (strong, nonatomic)   NSString    *interestFact;
@property (nonatomic)           float       gravitationalForce;
@property (nonatomic)           float       diameter;
@property (nonatomic)           float       yearLength;
@property (nonatomic)           float       dayLength;
@property (nonatomic)           float       temperature;
@property (nonatomic)           int         numberOfMoons;



-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
