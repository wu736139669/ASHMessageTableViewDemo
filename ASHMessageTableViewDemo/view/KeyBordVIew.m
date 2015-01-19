//
//  KeyBordVIew.m
//  气泡
//
//  Created by zzy on 14-5-13.
//  Copyright (c) 2014年 zzy. All rights reserved.
//

#import "KeyBordVIew.h"
#import "ChartMessage.h"
#import "ChartCellFrame.h"

@interface KeyBordVIew()<UITextFieldDelegate>
@property (nonatomic,strong) UIImageView *backImageView;
@property (nonatomic,strong) UIButton *voiceBtn;
@property (nonatomic,strong) UIButton *imageBtn;
@property (nonatomic,strong) UIButton *addBtn;
@property (nonatomic,strong) UIButton *speakBtn;
@property (nonatomic,strong) UITextField *textField;
@end

@implementation KeyBordVIew

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialData];
    }
    return self;
}

-(UIButton *)buttonWith:(NSString *)noraml hightLight:(NSString *)hightLight action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:noraml] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightLight] forState:UIControlStateHighlighted];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
-(void)initialData
{
    self.backImageView=[[UIImageView alloc]initWithFrame:self.bounds];
    self.backImageView.image=[UIImage strethImageWith:@"toolbar_bottom_bar.png"];
    [self addSubview:self.backImageView];
    
    self.voiceBtn=[self buttonWith:@"chat_bottom_voice_nor.png" hightLight:@"chat_bottom_voice_press.png" action:@selector(voiceBtnPress:)];
    [self.voiceBtn setFrame:CGRectMake(0,0, 33, 33)];
    [self.voiceBtn setCenter:CGPointMake(30, self.frame.size.height*0.5)];
    [self addSubview:self.voiceBtn];
    
    self.textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 180, self.frame.size.height*0.8)];
    self.textField.returnKeyType=UIReturnKeySend;
    self.textField.center=CGPointMake(145, self.frame.size.height*0.5);
    self.textField.font=[UIFont fontWithName:@"HelveticaNeue" size:14];
    self.textField.placeholder=@"请输入...";
    self.textField.background=[UIImage imageNamed:@"chat_bottom_textfield.png"];
    self.textField.delegate=self;
    [self addSubview:self.textField];
    
    self.imageBtn=[self buttonWith:@"chat_bottom_smile_nor.png" hightLight:@"chat_bottom_smile_press.png" action:@selector(imageBtnPress:)];
    [self.imageBtn setFrame:CGRectMake(0, 0, 33, 33)];
    [self.imageBtn setCenter:CGPointMake(260, self.frame.size.height*0.5)];
    [self addSubview:self.imageBtn];
    
    self.addBtn=[self buttonWith:@"chat_bottom_up_nor.png" hightLight:@"chat_bottom_up_press.png" action:@selector(addBtnPress:)];
    [self.addBtn setFrame:CGRectMake(0, 0, 33, 33)];
    [self.addBtn setCenter:CGPointMake(300, self.frame.size.height*0.5)];
    [self addSubview:self.addBtn];
    
    self.speakBtn=[self buttonWith:nil hightLight:nil action:@selector(speakBtnPress:)];
    [self.speakBtn setTitle:@"按住说话" forState:UIControlStateNormal];
    [self.speakBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.speakBtn addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    [self.speakBtn setTitleColor:[UIColor redColor] forState:(UIControlState)UIControlEventTouchDown];
    [self.speakBtn setBackgroundColor:[UIColor whiteColor]];
    [self.speakBtn setFrame:self.textField.frame];
    self.speakBtn.hidden=YES;
    [self addSubview:self.speakBtn];
}
-(void)touchDown:(UIButton *)voice
{
    //开始录音
    
    if([self.delegate respondsToSelector:@selector(beginRecord)]){
    
        [self.delegate beginRecord];
    }
    NSLog(@"开始录音");
}
-(void)speakBtnPress:(UIButton *)voice
{
   //结束录音
    
    if([self.delegate respondsToSelector:@selector(finishRecord)]){
    
        [self.delegate finishRecord];
    }
    NSLog(@"结束录音");
}
-(void)voiceBtnPress:(UIButton *)voice
{
    NSString *normal,*hightLight;
    if(self.speakBtn.hidden==YES){
        
        self.speakBtn.hidden=NO;
        self.textField.hidden=YES;
       normal=@"chat_bottom_keyboard_nor.png";
       hightLight=@"chat_bottom_keyboard_press.png";
    
    }else{
    
        self.speakBtn.hidden=YES;
        self.textField.hidden=NO;
        normal=@"chat_bottom_voice_nor.png";
        hightLight=@"chat_bottom_voice_press.png";
    
    }
    [voice setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [voice setImage:[UIImage imageNamed:hightLight] forState:UIControlStateHighlighted];
}
-(void)imageBtnPress:(UIButton *)image
{
    
    
}
-(void)addBtnPress:(UIButton *)image
{
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(KeyBordView:textFiledBegin:)]){
        
        [self.delegate KeyBordView:self textFiledBegin:textField];
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([self.delegate respondsToSelector:@selector(KeyBordView:textFiledReturn:)]){
    
        [self.delegate KeyBordView:self textFiledReturn:textField];
    }
    return YES;
}
@end
