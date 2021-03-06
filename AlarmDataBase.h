//
//  AlarmDataBase.h
//  BClock
//
//  Created by 白 斌 on 13-9-25.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface AlarmDataBase : NSObject
{
    NSString * docPath;
    NSString * dbPath;
    
    FMDatabase * database;
}

- (void)createDataBase;
- (void)insertDate:(NSString *)date Info:(NSString *)info  Avail:(BOOL)avail;
- (void)delete:(NSString *) para;
- (void)query:(NSString *) para Attribute:(NSString *)attribute;

- (NSMutableArray *)queryAll;




@end
