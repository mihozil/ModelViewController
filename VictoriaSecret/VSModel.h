//
//  VSModel.h
//  VictoriaSecret
//
//  Created by Apple on 1/6/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSModel : UIViewController
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *mesurement;
@property (nonatomic, strong) UIImage *photo;
@property (nonatomic, strong) UIImage *icon;

- (instancetype) initwithName: (NSString*) name
                andmesurement: (NSString*) mesurement
                 andphotoname: (NSString*) photoname;

@end
