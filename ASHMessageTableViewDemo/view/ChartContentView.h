//
//  ChartContentView.h
//  气泡
//
//  Created by zzy on 14-5-13.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChartContentView,ChartMessage;

@protocol ChartContentViewDelegate <NSObject>

-(void)chartContentViewLongPress:(ChartContentView *)chartView content:(NSString *)content;
-(void)chartContentViewTapPress:(ChartContentView *)chartView content:(NSString *)content;

@end

@interface ChartContentView : UIView
@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) ChartMessage *chartMessage;
@property (nonatomic,assign) id <ChartContentViewDelegate> delegate;
@end
