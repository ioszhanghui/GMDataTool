#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "GMKeyedArchiverTool.h"
#import "GMUserDefaultsTool.h"
#import "NSObject+CategoryMethod.h"

FOUNDATION_EXPORT double GMDataToolVersionNumber;
FOUNDATION_EXPORT const unsigned char GMDataToolVersionString[];

