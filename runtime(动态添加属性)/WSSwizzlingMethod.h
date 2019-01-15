//
//  WSSwizzlingMethod.h
//  Runtime(方法交换)
//
//  Created by 袁伟森 on 2019/1/14.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WSSwizzlingMethod : NSObject

void SwizzlingClassMethod(Class cls, SEL origSelector, SEL newSelector);


void SwizzlingInstanceMethod(Class cls, SEL origSelector, SEL newSelector);



@end

NS_ASSUME_NONNULL_END
