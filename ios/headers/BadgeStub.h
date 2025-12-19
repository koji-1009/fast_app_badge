#import <Foundation/Foundation.h>

@interface UIApplication : NSObject

+ (instancetype)sharedApplication;
@property (nonatomic) NSInteger applicationIconBadgeNumber;

@end