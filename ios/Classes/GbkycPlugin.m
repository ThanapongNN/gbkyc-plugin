#import "GbkycPlugin.h"
#if __has_include(<gbkyc/gbkyc-Swift.h>)
#import <gbkyc/gbkyc-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gbkyc-Swift.h"
#endif

@implementation GbkycPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGbkycPlugin registerWithRegistrar:registrar];
}
@end
