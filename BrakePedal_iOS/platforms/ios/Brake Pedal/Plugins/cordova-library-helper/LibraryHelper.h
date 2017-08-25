//	LibraryHelper-cordova	
//	http://github.com/coryjthompson/LibraryHelper-cordova
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Cordova/CDVPlugin.h>


@interface LibraryHelper : CDVPlugin
- (void)compressImage:(CDVInvokedUrlCommand *)command;
- (void)getVideoInfo:(CDVInvokedUrlCommand *)command;
- (void)saveImageToLibrary:(CDVInvokedUrlCommand *)command;
- (void)saveVideoToLibrary:(CDVInvokedUrlCommand *)command;
@end
