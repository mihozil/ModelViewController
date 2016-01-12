//
//  BraVc.m
//  VictoriaSecret
//
//  Created by Apple on 1/7/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "BraVc.h"
#import "DataManager.h"
#import "VSModel.h"

@interface BraVc ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;

@end
@implementation BraVc{
    float scrollviewheight,scrollviewwidth;
    NSMutableArray *modelName;
    DataManager *dataManager;
}
- (void) initBraVc{
    scrollviewwidth = self.view.bounds.size.width;
    scrollviewheight = self.view.bounds.size.height ;//- self.pagecontrol.frame.size.height - self.label.frame.size.height;
    self.label.text = [NSString stringWithFormat:@"Huong Lan\n90-60-90"];
   // self.edgesForExtendedLayout = UIRectEdgeNone;
 //   self.navigationController.navigationBar.hidden = false;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBraVc];
    [self scrollviewCreating];
    [self pagecontrolCreating];
    [self labelCreating];
    
}
- (void) scrollviewCreating{
  //  self.scrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, scrollviewheight, scrollviewheight)];
    self.scrollview.contentSize = CGSizeMake(scrollviewwidth*6, scrollviewheight);
    self.scrollview.pagingEnabled = YES;
    self.scrollview.delegate = self;
    
    dataManager = [DataManager getSingleton];
    
    int index=0;
    for (VSModel *item in dataManager.data ){
            // item.photo ; item.icon; item.name; item.mesurement
        //photo - scroll view
        UIImageView *photo = [[UIImageView alloc]initWithFrame:CGRectMake(index*scrollviewwidth, 0, scrollviewwidth, scrollviewheight)];
        photo.image = item.photo;
    
        [self.scrollview addSubview:photo];
        
        index++;
        
    }
                      
    
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pagecontrol.currentPage = (int)scrollView.contentOffset.x /scrollviewwidth;
    
    VSModel*item = dataManager.data[self.pagecontrol.currentPage];
    self.label.text = [NSString stringWithFormat:@"%@\n%@",item.name,item.mesurement];
}
- (void) pagecontrolCreating{
    self.pagecontrol.numberOfPages = 6;
    [self.pagecontrol addTarget:self action:@selector(onpageChange) forControlEvents:UIControlEventValueChanged];
    
}
- (void) onpageChange{
    self.scrollview.contentOffset = CGPointMake(self.pagecontrol.currentPage*scrollviewwidth, 0);
    // label: item.name ; item.mesurement; self.label.text =
    VSModel*item = dataManager.data[self.pagecontrol.currentPage];
    self.label.text = [NSString stringWithFormat:@"%@\n%@",item.name,item.mesurement];
    
    
}
    
- (void) labelCreating{
    
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
