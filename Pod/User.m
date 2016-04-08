//
//  User.m
//

/*#import "User.h"
#import "MIADBHelper.h"

@interface User ()

@property (nonatomic, copy) NSString *duty;

@end

@implementation User
//如果需要从服务器获取json数据到数据模型，必须实现该协议

//NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                //options:NSJSONReadingMutableContainers
                                                                  //error:nil];
//User * user = [MTLJSONAdapter modelOfClass:[User class] fromJSONDictionary:jsonDictionary error:nil];

#pragma mark - override method
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    //{属性字段名 : json数据字段名}
    return @{@"account"         : @"account",
             @"name"            : @"name",
             @"sex"             : @"sex",
             @"portraitPath"    : @"portraitPath",
             @"moblie"          : @"moblie",
             @"descn"           : @"descn",
             @"age"             : @"age",
             @"height"          : @"height",
             @"field1"          : @"field1",
             @"field2"          : @"field2"};
}

+(NSArray *)transients
{
    return [NSArray arrayWithObjects:@"field1",@"field2",nil];
}

+(NSArray *)primarykeys
{
    return [NSArray arrayWithObjects:@"account", nil];
}
 
+ (NSArray *)uniqueIndex
{
    return [NSArray arrayWithObjects:@"account", nil];
}
@end*/
