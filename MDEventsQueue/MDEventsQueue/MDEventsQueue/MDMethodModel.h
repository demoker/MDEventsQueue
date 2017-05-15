//
//  MDMethodModel.h
//  MDEventsQueue
//
//  Created by demoker on 2017/5/15.
//  Copyright © 2017年 m.demoker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDMethodModel : NSObject
/* 是否需要登录之后再自动执行一次操作*/
@property (assign, nonatomic) BOOL md_isAuto;

/* 操作的执行对象*/
@property (copy, nonatomic) id md_objectB;

/* 操作的方法*/
@property (assign, nonatomic) SEL md_methodB;

/* 方法需要的参数*/
@property (copy, nonatomic) NSString * md_argument;
@end
