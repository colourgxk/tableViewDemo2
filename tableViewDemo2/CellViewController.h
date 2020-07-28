//
//  CellViewController.h
//  tableViewDemo2
//
//  Created by 关晓珂 on 2020/7/28.
//  Copyright © 2020 TencentIOS. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CellDelegate <NSObject>

@end

@interface CellViewController : UIViewController
@property  (nonatomic) NSInteger index;
@property (weak, nonatomic) id <CellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
