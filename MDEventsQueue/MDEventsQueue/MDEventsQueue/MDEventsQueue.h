//
//  MDEventsQueue.h
//  MDEventsQueue
//
//  Created by demoker on 2017/5/15.
//  Copyright © 2017年 m.demoker. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString  * const MDLoginAutoDoSomethingNotification;

@class MDMethodModel;
@interface MDEventsQueue : NSObject
+ (instancetype)sharedInstance;

- (void)md_performMethod:(MDMethodModel *)method;
- (void)md_cancelDoSomethingAfterLogin;
@end
