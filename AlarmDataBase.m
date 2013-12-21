//
//  AlarmDataBase.m
//  BClock
//
//  Created by 白 斌 on 13-9-25.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "AlarmDataBase.h"
#import "Alarm.h"
#import "Utility.h"


#define DBNAME    @"alarm.db"
#define INFO      @"info"
#define DATE      @"date"
#define AVAIL     @"avail"
#define TABLENAME @"alarm"

@implementation AlarmDataBase

- (void)createDataBase
{
     docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
     dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    //获取数据库并打开
    database  = [FMDatabase databaseWithPath:dbPath];
    if (![database open]) {
        NSLog(@"Open database failed");
        return;
    }
    
    NSString * sqlString = @"CREATE TABLE alarm (date TEXT PRIMARY KEY, info TEXT,avail BOOL)";
    //创建表（FMDB中只有update和query操作，出了查询其他都是update操作）
    [database executeUpdate:sqlString];
    
    [database close];

}

- (void)insertDate:(NSString *)date Info:(NSString *)info  Avail:(BOOL)avail
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    if (![database open]) {
        return;
    }
    //插入数据
    BOOL insert = [database executeUpdate:@"insert into alarm values (?,?,?)",date,info
                   ,[NSNumber numberWithBool:avail]];
    
    if(!insert)
    {
      NSLog(@"Insert failed");
    }
    
    [database close];
}

- (void)delete:(NSString *) para
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return;
    }
    
    NSLog(@"sssss%@",para);
    
    BOOL delete = [database executeUpdate:@"delete from alarm where date = ?",para];
    if (delete)
    {
         NSLog(@"Delete failed");
    }
    [database close];
}

- (void)query:(NSString *) para Attribute:(NSString *)attribute
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return;
    }
    
    FMResultSet *resultSet = [database executeQuery:@"select * from alarm where ? = ?",attribute,para];
    while ([resultSet next]) {
        
        NSString *info = [resultSet stringForColumn:@"info"];
        NSString *date = [resultSet stringForColumn:@"date"];
        int avail = [resultSet intForColumn:@"avail"];
        
        NSLog(@"Name:%@,Gender:%@,Age:%d",info,date,avail);
    }
    [database close];

}

- (NSMutableArray *)queryAll
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return nil;
    }
    
    //不需要像Android中那样关闭Cursor关闭FMResultSet，因为相关的数据库关闭时，FMResultSet也会被自动关闭
    FMResultSet *resultSet = [database executeQuery:@"select * from alarm"];
    
    NSMutableArray * array  = [[NSMutableArray alloc] init];
    
    while ([resultSet next]) {
        
        NSString *info = [resultSet stringForColumn:@"info"];
        NSString *date = [resultSet stringForColumn:@"date"];
        BOOL avail = [resultSet boolForColumn:@"avail"];

        Alarm * alarm = [[Alarm alloc]initAlarm:info Date:[Utility ChangeStringToDate:date] Availability:avail];
        
        [array addObject:alarm];
        
    }
    
    [database close];
    return  array;
  
}

- (void)updateDate
{

    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return;
    }
    //参数必须是NSObject的子类，int,double,bool这种基本类型，需要封装成对应的包装类才可以
    BOOL update = [database executeUpdate:@"update alarm set name = ? where age = ?",@"RyanTang",[NSNumber numberWithInt:24]];
    if(update)
    {
        NSLog(@"Update failed");
    }
    [database close];

}

@end
