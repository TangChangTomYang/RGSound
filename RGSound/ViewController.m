//
//  ViewController.m
//  RGSound
//
//  Created by yangrui on 2018/11/19.
//  Copyright © 2018年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
//#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"aaa.wav" withExtension:nil];

    //1. 将音效资源加载到内存中,获取对应的音效ID
    SystemSoundID soundId  ;
    AudioServicesCreateSystemSoundID(CFBridgingRetain(url),&soundId);
    
    //2. 播放音效
//    AudioServicesPlayAlertSound(soundId); // 带震动播放
//    AudioServicesPlaySystemSound(soundId);// 不带震动播放
    
    AudioServicesPlayAlertSoundWithCompletion(soundId, ^{// 带震动播放, 播放结束有回调
         AudioServicesDisposeSystemSoundID(soundId);
    });
    
//    AudioServicesPlaySystemSoundWithCompletion(soundId, ^{
//         AudioServicesDisposeSystemSoundID(soundId);
//    });
    
    
    //3. 回收音效资源释放内存 (注意此方法不能直接在播放音效方法后直接使用,否则无法播放(还没播放音效资源已经被回收了))
//    AudioServicesDisposeSystemSoundID(soundId);
    
    
    // 注意: 一旦音效资源被回收了就不能再次播放了, 必须再次获取音效ID才能播放
    
}

@end
