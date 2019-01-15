//
//  WSSwizzlingMethod.m
//  Runtime(方法交换)
//
//  Created by 袁伟森 on 2019/1/14.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "WSSwizzlingMethod.h"
#import <objc/runtime.h>
@implementation WSSwizzlingMethod
//处理为类方法
void SwizzlingClassMethod(Class cls, SEL origSelector, SEL newSelector){

//    Class cls = [self class];
    
    Method originalMethod = class_getClassMethod(cls, origSelector);
    Method swizzledMethod = class_getClassMethod(cls, newSelector);
    
    Class metacls = objc_getMetaClass(NSStringFromClass(cls).UTF8String);
    if (class_addMethod(metacls,
                        origSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /* swizzing super class method, added if not exist */
        /* swizzing超类方法，如果不存在则添加 */
        class_replaceMethod(metacls,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

void SwizzlingInstanceMethod(Class cls, SEL origSelector, SEL newSelector)
{
    /* 如果当前类不存在选择器，则获取super*/
    Method originalMethod = class_getInstanceMethod(cls, origSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, newSelector);
    /* 如果不存在选择器，则使用方法实现append */
    if (class_addMethod(cls,
                        origSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod)) ) {
        /* 替换类实例方法，如果选择器不存在则添加 */
        /* 对于类簇，它总是在这里添加新的selector */
        class_replaceMethod(cls,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
        
    } else {
        /* swizzleMethod maybe belong to super */
        class_replaceMethod(cls,
                            newSelector,
                            class_replaceMethod(cls,
                                                origSelector,
                                                method_getImplementation(swizzledMethod),
                                                method_getTypeEncoding(swizzledMethod)),
                            method_getTypeEncoding(originalMethod));
    }
}

@end
