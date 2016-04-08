//

#import <Foundation/Foundation.h>

/** SQLite五种数据类型 */
#define SQLTEXT     @"TEXT"     //字符串
#define SQLINTEGER  @"INTEGER"  //有符号整数类型
#define SQLREAL     @"REAL"     //浮点数类型
#define SQLBLOB     @"BLOB"     //二进制表示
#define SQLNULL     @"NULL"     //空值

#define PrimaryKey  @"primary key"

@interface MIADBModel : NSObject

//列名
@property (retain, readonly, nonatomic) NSMutableArray         *columeNames;
//列类型
@property (retain, readonly, nonatomic) NSMutableArray         *columeTypes;

/** 
 *  获取该类的所有属性
 */
+ (NSDictionary *)getPropertys;

/**
 *  获取所有属性，包括主键
 *
 *  @return 属性
 */
+ (NSDictionary *)getAllProperties;

/**
 *  数据库中是否存在表
 *
 *  @return true为存在，false为不存在
 */
+ (BOOL)isExistInTable;

/**
 *  获取表中的字段
 *
 *  @param tableName 表名
 *
 *  @return 返回的字段
 */
+ (NSArray *)getColumns;
/** 保存单个数据 */
- (BOOL)save;
/** 批量保存数据 */
+ (BOOL)saveObjects:(NSArray *)array;
/** 更新单个数据 */
- (BOOL)update:(NSString *)condition;
/** 批量更新数据*/
+ (BOOL)updateObjects:(NSArray *)array condition:(NSString*)condition;
/** 删除单个数据 */
- (BOOL)deleteObject:(NSString *)condition;
/** 批量删除数据 */
+ (BOOL)deleteObjects:(NSArray *)array condition:(NSString *)condition;
/** 通过条件删除数据 */
+ (BOOL)deleteObjectsByCriteria:(NSString *)criteria;
/** 通过条件删除 (多参数）--2 */
+ (BOOL)deleteObjectsWithFormat:(NSString *)format, ...;
/** 清空表 */
+ (BOOL)clearTable;

/** 查询全部数据 */
+ (NSArray *)findAll;

+ (instancetype)findFirstWithFormat:(NSString *)format, ...;

/** 查找某条数据 */
+ (instancetype)findFirstByCriteria:(NSString *)criteria;

+ (NSArray *)findWithFormat:(NSString *)format, ...;

/** 通过条件查找数据 
 * 这样可以进行分页查询 @" WHERE pk > 5 limit 10"
 */
+ (NSArray *)findByCriteria:(NSString *)criteria;
/**
 * 创建表
 * 如果已经创建，返回YES
 */
+ (BOOL)createTable;

#pragma mark - must be override method
/** 如果子类中有一些property不需要创建数据库字段，那么这个方法必须在子类中重写 
 */
+ (NSArray *)transients;

/**
 *  主键
 *
 *  @return 返回需要设置的主键字段
 */
+ (NSArray *)primarykeys;
@end
