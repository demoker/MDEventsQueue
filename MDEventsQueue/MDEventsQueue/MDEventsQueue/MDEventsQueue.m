//
//  MDEventsQueue.m
//  MDEventsQueue
//
//  Created by demoker on 2017/5/15.
//  Copyright © 2017年 m.demoker. All rights reserved.
//

#import "MDEventsQueue.h"
#import "MDMethodModel.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

NSString * const MDLoginAutoDoSomethingNotification = @"MDLoginAutoDoSomethingNotification";
@interface MDEventsQueue ()
@property (copy, nonatomic) NSDate * didThingDate;
@property (copy, nonatomic) NSMutableArray <MDMethodModel *>* methods;
@end

@implementation MDEventsQueue

+ (instancetype)sharedInstance {
    static MDEventsQueue *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (NSMutableArray *)methods{
    if(!_methods){
        _methods = [[NSMutableArray alloc]init];
    }
    return _methods;
}

- (void)md_performMethod:(MDMethodModel *)method{
    _didThingDate = [NSDate date];
    [self.methods addObject:method];
    //在未知是否登录的情况下，先去执行操作
    SuppressPerformSelectorLeakWarning([method.md_objectB performSelector:method.md_methodB withObject:method.md_argument]);
}

- (void)md_cancelDoSomethingAfterLogin{
    [self.methods removeAllObjects];
}

- (void)receiveMDLoginAutoDoSomething:(NSNotification *)noti{
    if([noti.name isEqualToString:MDLoginAutoDoSomethingNotification]){
        for(MDMethodModel * method in self.methods){
            if(method.md_isAuto){
                 SuppressPerformSelectorLeakWarning([method.md_objectB performSelector:method.md_methodB withObject:method.md_argument]);
            }
        }
        [self.methods removeAllObjects];
    }
}

@end
