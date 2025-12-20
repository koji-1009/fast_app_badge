#import <Foundation/Foundation.h>

@interface UNUserNotificationCenter : NSObject
+ (instancetype)currentNotificationCenter;
- (void)requestAuthorizationWithOptions:(NSUInteger)options
                      completionHandler:(void *)completionHandler;
@end

@interface UIApplication : NSObject

+ (instancetype)sharedApplication;
@property (nonatomic) NSInteger applicationIconBadgeNumber;

@end
