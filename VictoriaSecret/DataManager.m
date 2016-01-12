//
//  DataManager.m
//  VictoriaSecret
//
//  Created by Apple on 1/6/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "DataManager.h"
#import "VSModel.h"

@interface DataManager ()

@end

@implementation DataManager

+ (instancetype)getSingleton{
    static DataManager *dataManager= nil;
   
       dataManager = [self new];
        
        NSString *filename = [[NSBundle mainBundle]pathForResource:@"VictoriaSecret" ofType:@"plist"];
        NSArray *raw = [[NSMutableArray alloc]initWithContentsOfFile:filename];
        
        NSMutableArray *temp= [[NSMutableArray alloc]initWithCapacity:raw.count];
        
        for (NSDictionary* item in raw){
            
            VSModel* newmodel = [[VSModel alloc]initwithName:[item valueForKey:@"name"]
                                               andmesurement:[item valueForKey:@"mesurement"]
                                                andphotoname:[item valueForKey:@"photo"]];
            
            [temp addObject:newmodel];
            };
        dataManager.data = [NSArray arrayWithArray:temp];
        
    return dataManager;
    
}

@end
