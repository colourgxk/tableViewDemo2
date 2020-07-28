//
//  CellViewController.m
//  tableViewDemo2
//
//  Created by 关晓珂 on 2020/7/28.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "CellViewController.h"
#import "ViewController.h"

@interface CellViewController ()
@property (strong, nonatomic) UIButton * starButton;
@property (strong, nonatomic) UINavigationItem *navigationItem;
@property (strong, nonatomic) UIBarButtonItem *backButton;


@end

@implementation CellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    //设置背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 18, 195, 300)];
    //masksToBounds防止子元素溢出父视图
    backgroundImageView.layer.masksToBounds=YES;
    backgroundImageView.contentMode=UIViewContentModeScaleAspectFit;
    backgroundImageView.image = [UIImage imageNamed:@"background.jpg"];
    [self.view addSubview:backgroundImageView];
    
    
    
    //设置cell图片
    UIImageView *frontImageView = [[UIImageView alloc]initWithFrame:CGRectMake(180, 48, 88, 88)];
    frontImageView.layer.cornerRadius=frontImageView.frame.size.height/2;
    frontImageView.layer.masksToBounds=YES;
    
    
    //绘制边框
    frontImageView.layer.borderWidth=1.0;
    frontImageView.layer.borderColor=[UIColor blackColor].CGColor;
    
    //绘制阴影
    //阴影颜色
    frontImageView.layer.shadowColor=[UIColor clearColor].CGColor;
    //offset为偏移量，为正表示向frame x，y坐标增加的方向偏移。
    frontImageView.layer.shadowOffset=CGSizeMake(5.0, 5.0);
    //opacity为透明度，默认为0，即表示透明的。把opacity设置成1或者YES，表示不透明，也可以设置成0.5或者类似的值呈现半透明。
    frontImageView.layer.shadowOpacity=0.5;
    frontImageView.contentMode=UIViewContentModeScaleAspectFit;
    frontImageView.image = [UIImage imageNamed:@"index.jpg"];
    [self.view addSubview:frontImageView];
    
    
    UILabel *titleText =[ [UILabel alloc]initWithFrame:CGRectMake(20,64,100,30 )];
    //设置背景颜色
    titleText.backgroundColor = [UIColor clearColor];
    //设置字体颜色
    titleText.textColor = [UIColor blackColor];
    //设置Label上的文字
    titleText.text= @"这是标题";
     //设置字体大小
    titleText.font = [UIFont systemFontOfSize:16];
    //使用粗体
    titleText.font=[UIFont boldSystemFontOfSize:16];
    //设置文本对齐方式
    titleText.textAlignment=NSTextAlignmentLeft;
    //设置行数默认为1，当为0时可以就是设置多行
    titleText.numberOfLines = 1;
    [self.view addSubview:titleText];
    
    
    UILabel *leftText =[ [UILabel alloc]initWithFrame:CGRectMake(30,300,100,30 )];
    //设置背景颜色
    leftText.backgroundColor = [UIColor clearColor];
    //设置字体颜色
    leftText.textColor = [UIColor blackColor];
    //设置Label上的文字
    leftText.text= [NSString stringWithFormat:@"这是位于第 %d 个cell左边的描述",index];
     //设置字体大小
    leftText.font = [UIFont systemFontOfSize:16];
    //使用粗体
    leftText.font=[UIFont boldSystemFontOfSize:16];
    //设置文本对齐方式
    leftText.textAlignment=NSTextAlignmentLeft;
    //设置行数默认为1，当为0时可以就是设置多行
    leftText.numberOfLines = 1;
    [self.view addSubview:leftText];
    
    
    UILabel *rightText =[ [UILabel alloc]initWithFrame:CGRectMake(100,300,100,30 )];
    //设置背景颜色
    rightText.backgroundColor = [UIColor clearColor];
    //设置字体颜色
    rightText.textColor = [UIColor blackColor];
    //设置Label上的文字
    rightText.text=[NSString stringWithFormat:@"这是位于第 %d 个cell右边的描述",index];
     //设置字体大小
    rightText.font = [UIFont systemFontOfSize:16];
    //使用粗体
    rightText.font=[UIFont boldSystemFontOfSize:16];
    //设置文本对齐方式
    rightText.textAlignment=NSTextAlignmentLeft;
    //设置行数默认为1，当为0时可以就是设置多行
    rightText.numberOfLines = 1;
    [self.view addSubview:rightText];
    
    
    UIButton *starButton = [UIButton buttonWithType:UIButtonTypeCustom];
    starButton.frame=CGRectMake(100, 50, 100, 75);
    starButton.selected=NO;
    [starButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [starButton setImage:[UIImage imageNamed:@"off2.png"] forState:UIControlStateNormal];
    [starButton setImage:[UIImage imageNamed:@"on2.png"] forState:UIControlStateSelected];
    [self.view addSubview:starButton];
    
    self.navigationItem = [[UINavigationItem alloc] init];
    self.backButton = [[UIBarButtonItem alloc] initWithTitle:@"城市列表" style:UIBarButtonItemStyleDone target:self action:@selector(backCell)];
    self.navigationItem.leftBarButtonItem = self.backButton;
}

-(void)buttonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
}


- (void)backCell {
    [self.navigationController popViewControllerAnimated:YES];
    if(![_starButton.currentImage isEqual:[UIImage imageNamed:@"on2.png"]]){
        NSLog(@"Fail to like cell");
        return ;
    }
     NSLog(@"Like selected");
}
@end


