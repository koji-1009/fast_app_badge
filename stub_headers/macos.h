#import <Foundation/Foundation.h>

@interface NSDockTile : NSObject
@property (copy) NSString *badgeLabel;
@end

@interface NSApplication : NSObject
+ (instancetype)sharedApplication;
@property (readonly, strong) NSDockTile *dockTile;
@end
