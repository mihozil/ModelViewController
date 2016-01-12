//
//  BikiniVC.m
//  VictoriaSecret
//
//  Created by Apple on 1/8/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "BikiniVC.h"
#import "DataManager.h"
#import "VSModel.h"
#import "Detail.h"

@interface BikiniVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation BikiniVC{
    DataManager *datamanager;
}
- (void) initBikiniVC{
    datamanager = [DataManager getSingleton];
    self.navigationController.navigationBarHidden = false;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initBikiniVC];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    VSModel* item = datamanager.data[indexPath.row];
    
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.mesurement;
    cell.imageView.image = item.icon;
    
    
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datamanager.data.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    Detail *detailvc= (Detail*)segue.destinationViewController;
    NSIndexPath* indexpath = [self.tableview indexPathForSelectedRow];
    
    // Pass the selected object to the new view controller.
    detailvc.model = datamanager.data[indexpath.row];
    
    
}


@end
