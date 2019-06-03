
#import <Foundation/Foundation.h>
#import <React/RCTViewManager.h>
#import "EasyARView.h"
#import <easyar/engine.oc.h>


@interface RNVideoARManager : RCTViewManager
@end

@implementation RNVideoARManager

RCT_EXPORT_MODULE(RCTEasyAR)
RCT_EXPORT_VIEW_PROPERTY(videoUrl, NSString)
RCT_EXPORT_VIEW_PROPERTY(targetName, NSString)

- (UIView *)view
{
  return [[EasyARView alloc] init];
}

@end
