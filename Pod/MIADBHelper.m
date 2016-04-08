//

#import <objc/runtime.h>

#import "MIADBHelper.h"
#import "MIADBModel.h"

@interface MIADBHelper ()

@property (nonatomic, retain) FMDatabaseQueue *dbQueue;

@end

@implementation MIADBHelper
@synthesize dbQueue = _dbQueue;

HMSingletonM(Help)

- (FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        NSAssert(_dbQueue != nil, @"数据库为空，请重新创建数据库!");
    }
    return _dbQueue;
}

- (FMDatabaseQueue *)createDBQueue:(NSString*)dbpath {
    _dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbpath];
    if (_dbQueue == nil) {
        NSLog(@"创建数据库失败！");
    }
    
    return _dbQueue;
}

- (BOOL)changeDBQueue:(NSString *)dbPath
{
    if (_dbQueue) {
        _dbQueue = nil;
    }
    _dbQueue = [self createDBQueue:dbPath];
    
    int numClasses;
    Class *classes = NULL;
    numClasses = objc_getClassList(NULL,0);
    
    if (numClasses >0 )
    {
        classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
        numClasses = objc_getClassList(classes, numClasses);
        for (int i = 0; i < numClasses; i++) {
            if (class_getSuperclass(classes[i]) == [MIADBModel class]){
                id class = classes[i];
                [class performSelector:@selector(createTable) withObject:nil];
            }
        }
        free(classes);
    }
    
    return YES;
}

@end
