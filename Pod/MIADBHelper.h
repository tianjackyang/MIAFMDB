//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "MIADefine.h"

@interface MIADBHelper : NSObject

@property (nonatomic, retain, readonly) FMDatabaseQueue *dbQueue;

HMSingletonH(Help)

/**
 *  创建数据库
 *
 *  @param dbpath 数据库路径
 *
 *  @return 返回数据库
 */
- (FMDatabaseQueue *)createDBQueue:(NSString*)dbpath;

/**
 *  切换数据库
 *
 *  @param dbpath 数据库
 *
 *  @return 返回切换后的数据库
 */
- (BOOL)changeDBQueue:(NSString *)dbpath;

@end
