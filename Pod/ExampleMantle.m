//
//  Example.m
//

#import "ExampleMantle.h"
#import "DBMovie.h"

@implementation Example

-(void)opt {
    
    [self getMovie];
    
}

- (void)getMovie  {
    
    NSURL * url = [NSURL URLWithString:@"https://api.douban.com/v2/movie/4212172"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError) {
            NSLog(@"error:%@", connectionError);
            return;
        }
        
        NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
        
        DBMovie * movie = [MTLJSONAdapter modelOfClass:[DBMovie class] fromJSONDictionary:jsonDictionary error:nil];
        
#warning 在这边设置断点查看对象
        
        [[[UIAlertView alloc]initWithTitle:@"信息" message:@"获取成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil]show];
    }];
    
}

@end
