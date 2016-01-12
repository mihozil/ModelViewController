//
//  DataManager.h
//  VictoriaSecret
//
//  Created by Apple on 1/6/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataManager : UIViewController
@property (nonatomic, strong) NSArray *data;
+ (instancetype) getSingleton;

@end
