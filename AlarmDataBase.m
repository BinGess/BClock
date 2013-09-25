//
//  AlarmDataBase.m
//  BClock
//
//  Created by 白 斌 on 13-9-25.
//  Copyright (c) 2013年 baibin. All rights reserved.
//

#import "AlarmDataBase.h"


#define DBNAME    @"alarm.db"
#define NAME      @"name"
#define AGE       @"age"
#define ADDRESS   @"address"
#define TABLENAME @"PERSONINFO"

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
    
    NSString * sqlString = @"create table user (name text,gender text,age integer)";
    //创建表（FMDB中只有update和query操作，出了查询其他都是update操作）
    [database executeUpdate:sqlString];

}

- (void)insert:(NSString *)paraOne ParaTwo:(NSString *)paratwo ParaThree:(NSString *)parathree
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    if (![database open]) {
        return;
    }
    //插入数据
    BOOL insert = [database executeUpdate:@"insert into user values (?,?,?)",paraOne,paratwo,parathree];
    
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
    
    BOOL delete = [database executeUpdate:@"delete from user where name = ?",para];
    if (delete) {

        
    }
    [database close];
}

- (void)query:(NSString *) para
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return;
    }
    
    FMResultSet *resultSet = [database executeQuery:@"select * from user where name = ?",para];
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"name"];
        NSString *gender = [resultSet stringForColumn:@"gender"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"Name:%@,Gender:%@,Age:%d",name,gender,age);
    }
    [database close];

}

- (void)queryAll
{
    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return;
    }
    
    //不需要像Android中那样关闭Cursor关闭FMResultSet，因为相关的数据库关闭时，FMResultSet也会被自动关闭
    FMResultSet *resultSet = [database executeQuery:@"select * from user"];
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"name"];
        NSString *gender = [resultSet stringForColumn:@"gender"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"Name:%@,Gender:%@,Age:%d",name,gender,age);
    }
    [database close];
}

- (void)update
{

    docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [docPath stringByAppendingPathComponent:DBNAME];
    
    database = [FMDatabase databaseWithPath:dbPath];
    
    if (![database open]) {
        return;
    }
    
    //参数必须是NSObject的子类，int,double,bool这种基本类型，需要封装成对应的包装类才可以
    BOOL update = [database executeUpdate:@"update user set name = ? where age = ?",@"RyanTang",[NSNumber numberWithInt:24]];
    
    if(update){
        
    }
    
    [database close];

}

@end
