//
//  ViewController.m
//  runtime(动态添加属性)
//
//  Created by 袁伟森 on 2019/1/14.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Objc.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //111
    NSObject *objc = [[NSObject alloc]init];
    objc.name = @"动态添加属性";
    NSLog(@"%@",objc.name);
    
    [self getiOSPrivateAPi];
}

#pragma mark - 获取苹果私有的APi方法
- (void)getiOSPrivateAPi{
    NSString *className = NSStringFromClass([UIView class]);
    
    const char *cClassName = [className UTF8String];
    
    id theClass = objc_getClass(cClassName);
    
    unsigned int outCount;
    
    Method *m =  class_copyMethodList(theClass,&outCount);
    
    NSLog(@"%d",outCount);
    
    for (int i = 0; i<outCount; i++) {
        
        SEL a = method_getName(*(m+i));
        
        NSString *sn = NSStringFromSelector(a);
        
        NSLog(@"私有API：%@",sn);
        
        if ([sn isEqualToString:@"backgroundColor"]) {
            [self changeiOSAPI];
        }
    }
}

-(void)changeiOSAPI{
    NSLog(@"获取私有API");
}

@end
