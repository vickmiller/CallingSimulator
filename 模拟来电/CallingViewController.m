//
//  CallingViewController.m
//  模拟来电
//
//  Created by SamingZhong on 15/12/23.
//  Copyright © 2015年 zhong. All rights reserved.
//

#import "CallingViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface CallingViewController ()
@property (nonatomic, strong) UIImageView *fakeImageView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGustureRecognizer;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation CallingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];

    [_timer fire];
}

-(void)timerHandle{
    AudioServicesPlaySystemSoundWithCompletion(1151, ^{
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hangOff:(UIButton *)button{
    [self loadFakeDesk];
    [_timer invalidate];
    _timer = nil;
}

- (void)loadFakeDesk{
    self.fakeImageView.image = [UIImage imageNamed:@"fakeDesk"];
    [self.view addSubview:self.fakeImageView];
    
    self.fakeImageView.userInteractionEnabled = YES;
    [self.fakeImageView addGestureRecognizer:self.tapGustureRecognizer];
}

- (UIImageView *)fakeImageView{
    if (!_fakeImageView) {
        _fakeImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _fakeImageView.backgroundColor = [UIColor purpleColor];
    }
    
    return _fakeImageView;
}

- (UITapGestureRecognizer *)tapGustureRecognizer{
    if (!_tapGustureRecognizer) {
        _tapGustureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGustureHandler:)];
    }
    return _tapGustureRecognizer;
}

-(void)tapGustureHandler:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
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
