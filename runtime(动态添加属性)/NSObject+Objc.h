//
//  NSObject+Objc.h
//  runtime(动态添加属性)
//
//  Created by 袁伟森 on 2019/1/14.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Objc)
@property (nonatomic , strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
