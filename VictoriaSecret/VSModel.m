//
//  VSModel.m
//  VictoriaSecret
//
//  Created by Apple on 1/6/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "VSModel.h"

@interface VSModel ()

@end

@implementation VSModel

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype) initwithName:(NSString *)name andmesurement:(NSString *)mesurement andphotoname:(NSString *)photoname {
    
    if (self == [super init]){
        self.name = name;
        self.mesurement = mesurement;
        self.photo = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",photoname]];
        self.icon = [UIImage imageNamed:[NSString stringWithFormat:@"%@0.jpg",photoname]];

        
    }
            return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
