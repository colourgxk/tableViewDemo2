//
//  ViewController.m
//  tableViewDemo2
//
//  Created by 关晓珂 on 2020/7/28.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "ViewController.h"
#import "CellViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,  CellDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UITableViewCell *tableViewCell;
@property (strong, nonatomic) NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) NSArray *dataSourceArray;
@property (strong, nonatomic) UINavigationItem *navigationItem;
@property (strong, nonatomic) CellViewController *cellViewController;



- (void)initializeDataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDataSourceArray];

    self.tableView.frame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88);
    [self.view addSubview:self.tableView];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    // 根据cellID从可重用单元格的队列中取出可重用的一个单元格UITableViewCell对象
    UITableViewCell* tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果取出的单元格为nil
    if (tableViewCell == nil) {
        //创建一个UITableViewCell对象，并绑定到cellID
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }

    tableViewCell.layer.masksToBounds = YES;
    //UITableView声明了一个NSIndexPath的类别，主要用来标识当前cell的在tableView中的位置，该类别有section和row两个属性，section标识当前cell处于第几个section中，row代表在该section中的第几行。
    // 从IndexPath参数获取当前行的行号
    NSUInteger rowNo = indexPath.row;
    // 取出cityArray中索引为rowNo的元素作为UITableViewCell的文本内容
    tableViewCell.textLabel.text = [_dataSourceArray objectAtIndex:rowNo];
    // 设置UITableViewCell的左边的图标
    //tableViewCell.imageView.image = [UIImage imageNamed:@"beijing.jpg"];
    // 设置UITableViewCell右边有一个蓝色的圆形button
    //tableViewCell.accessoryView = [[UISwitch alloc]init];
    // 设置UITableViewCell右边有一个小箭头，距离右边有十几像素
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //返回设置好数据的cell给UITableView对象
  
    return tableViewCell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    self.selectedIndexPath = indexPath;
    NSLog(@"Select row: %ld", indexPath.row);
    
    self.cellViewController = [[CellViewController alloc] init];
    self.cellViewController.delegate = self;
    self.cellViewController.index = indexPath.row;
    [self.navigationController pushViewController:self.cellViewController animated:YES];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_tableView reloadData];
}

- (UITableView *)tableView {
    if (_tableView != nil) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return _tableView;
}


- (void)initializeDataSourceArray {
    _dataSourceArray = @[@"天津",@"北京",@"上海",@"重庆"];
}


/*
- (BOOL)tableInsertCellWithFavorite:{
    if () {
        return NO;
    }
    [self.tableView reloadData];
    return YES;
}
 */


@end




