//
//  Detail.m
//  VictoriaSecret
//
//  Created by Apple on 1/8/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "Detail.h"

@interface Detail ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation Detail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.photo.image = self.model.photo;
    self.label.text = [NSString stringWithFormat:@"%@\n%@",self.model.name, self.model.mesurement];
    
    
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}



@end
