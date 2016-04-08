//
//  Example.m
//

/*#import "ExampleFMDB.h"
#import "UserModel.h"
#import "MIADBHelper.h"
#import "MIAFileManager.h"

@implementation Example

-(void)opt {
    [self insertData];
    [self insertData2];
    [self insertData3];
    [self insertData4];
    [self deleteData];
    [self deleteData2];
    [self deleteData3];
    [self  updateData];
    [self updateData1];
    [self queryData];
    [self queryData1];
    [self queryData2];
    [self queryData3];
    
}

-(instancetype)init {
    self = [super init];
    if (self) {
        if (![MIAFileManager existsItemAtPath:[MIAFileManager pathForDocumentsDirectoryWithPath:@"db/db.sqlite"]]) {
            [MIAFileManager createDirectoriesForFileAtPath:[MIAFileManager pathForDocumentsDirectoryWithPath:@"db/db.sqlite"]];
        }
        [[MIADBHelper sharedHelp] createDBQueue:[MIAFileManager pathForDocumentsDirectoryWithPath:@"db/db.sqlite"]];
    }
    NSLog(@"%@",[MIAFileManager pathForDocumentsDirectoryWithPath:@"db/db.sqlite"]);
    return self;
}

#pragma mark - 插入数据
- (void)insertData {
    User *user = [[User alloc] init];
    user.name = @"麻子";
    user.sex = @"男";
    user.age = 23;
    user.account = @"hel";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [user save];
    });
}

- (void)insertData2 {

    dispatch_queue_t q1 = dispatch_queue_create("appid.iphone.flaginfo.com.umsapp.myqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q1, ^{
        for (int i = 0; i < 5; ++i) {
            User *user = [[User alloc] init];
            user.name = @"赵五";
            user.sex = @"女";
            user.age = 20+5;
            user.account = [NSString stringWithFormat:@"hello%d", i];
            [user save];
        }
    });
}

- (void)insertData3 {
    for (int i = 0; i < 1000; ++i) {
        User *user = [[User alloc] init];
        user.name = @"张三";
        user.sex = @"男";
        user.age = 27;
        user.account = [NSString stringWithFormat:@"word%d", i];
        
        [user save];
    }
}

- (void)insertData4 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 500; i++) {
            User *user = [[User alloc] init];
            user.name = [NSString stringWithFormat:@"李四%d",i];
            user.age = 24;
            user.sex = @"女";
            user.account = [NSString stringWithFormat:@"fuck%d", i];
            [array addObject:user];
        }
        [User saveObjects:array];
    });
}

#pragma mark - 删除数据
- (void)deleteData {
//    [User deleteObjectsByCriteria:@" WHERE pk < 10"];
    [User deleteObjectsWithFormat:@"Where %@ = \"%@\"",@"sex",@"女"];
}

- (void)deleteData2 {
    for (int i = 0; i < 5; i++) {
        User *user = [[User alloc] init];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [user deleteObject:@"where name = '赵五'"];
        });
    }
}

- (void)deleteData3 {

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 500; i++) {
            User *user = [[User alloc] init];
            [array addObject:user];
        }
        [User deleteObjects:array condition:@"where age = 24"];
    });
}

#pragma mark - 修改数据
- (void)updateData1 {
    User *user = [[User alloc] init];
    user.name = [NSString stringWithFormat:@"更新%d",2];
    user.age = 26;
    user.account = [NSString stringWithFormat:@"word%d", 1112];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [user update:@"where account = 'word0'"];
    });
}

- (void)updateData {
    dispatch_queue_t q3 = dispatch_queue_create("appid.iphone.flaginfo.com.umsapp.myqueue2", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q3, ^{
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 500; i++) {
            User *user = [[User alloc] init];
            user.name = [NSString stringWithFormat:@"啊我哦%d",i];
            user.age = 88+i;
            user.account = [NSString stringWithFormat:@"fuck%d", i];
            [array addObject:user];
        }
        [User updateObjects:array condition:@"where sex = '女'"];
    });
}

#pragma mark - 查询
- (void)queryData1 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"第一条:%@",[User findFirstByCriteria:@" WHERE age = 24 "]);
    });
}

- (void)queryData2 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"小于20岁:%@",[User findByCriteria:@" WHERE age > 24 "]);
    });
}

- (void)queryData3 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"全部:%@",[User findAll]);
    });
}

- (void)queryData {
    NSArray *array = [User findByCriteria:[NSString stringWithFormat:@" WHERE age > %d limit 10",24]];
    NSLog(@"array:%@",array);
}
@end*/
