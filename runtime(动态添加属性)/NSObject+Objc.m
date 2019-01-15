//
//  NSObject+Objc.m
//  runtime(动态添加属性)
//
//  Created by 袁伟森 on 2019/1/14.
//  Copyright © 2019 袁伟森. All rights reserved.
//

#import "NSObject+Objc.h"
#import <objc/message.h>
@implementation NSObject (Objc)

static NSString *key = @"name";

-(void)setName:(NSString *)name{
    
    //动态添加属性
//    objc_setAssociatedObject(id  _Nonnull object_, const void * _Nonnull key, id  _Nullable value, objc_AssociationPolicy policy)
    
    //object_ : 给那个对象添加属性
    //key:属性名，根据key去获取关联的对象，void * == id
    //value :关联的值
    //policy:关联策略
    //有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
    
    
//    OBJC_ASSOCIATION_ASSIGN ----- assign
//    OBJC_ASSOCIATION_RETAIN_NONATOMIC ----- nonatomic, strong
//    OBJC_ASSOCIATION_COPY_NONATOMIC ----- nonatomic, copy
//    OBJC_ASSOCIATION_RETAIN ------ atomic, strong
//    OBJC_ASSOCIATION_COPY ---atomic, copy
    
    
    objc_setAssociatedObject(self, &key, name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(NSString *)name{
    return objc_getAssociatedObject(self, &key);
}

@end
