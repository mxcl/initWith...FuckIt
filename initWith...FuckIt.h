#import <Foundation/NSAttributedString.h>

@interface NSAttributedString (FuckIt)
+ (instancetype):(NSString *)stringFormat, ...;
@end




#import <Foundation/NSIndexSet.h>

@interface NSIndexSet (FuckIt)
+ (instancetype):(NSUInteger)index;
+ (instancetype):(NSUInteger)index1 :(NSUInteger)index2;
+ (instancetype):(NSUInteger)index1 :(NSUInteger)index2 :(NSUInteger)index3;
@end



#import <Foundation/NSIndexPath.h>

@interface NSIndexPath (FuckIt)
+ (instancetype):(NSUInteger)row :(NSUInteger)section;
@end



#import <Foundation/NSString.h>

@interface NSString (FuckIt)
+ (instancetype):(NSString *)stringFormat, ...;
@end



#import <Foundation/NSURL.h>

@interface NSURL (FuckIt)
+ (instancetype):(NSString *)url;
@end



#if !TARGET_OS_IPHONE



#import <Foundation/NSTask.h>

@interface NSTask (FuckIt)
/**
 You can pass a stringFormat or an array.

 If you pass a string then we will split it on spaces to construct the
 arguments array that NSTask requires.

 A common trick to get around space problems is to set environment
 variables. The shell will then insert them in a space-safe way.
*/
+ (instancetype):(id)stringFormatOrArray, ...;
@end




#else



#import <UIKit/UIAlertView.h>

@interface UIAlertView (FuckIt)
+ (instancetype):(id)titleOrError;
+ (instancetype):(NSString *)title :(id)message;
+ (instancetype):(NSString *)title :(id)message :(NSString *)cancelButtonText;
@end



#import <UIKit/UIImage.h>

@interface UIImage (FuckIt)
+ (instancetype):(NSString *)name;
@end



#import <UIKit/UILabel.h>

@interface UILabel (FuckIt)
+ (instancetype):(id)text;
+ (instancetype):(id)text :(UIFont *)font;
+ (instancetype):(id)text :(NSString *)fontName :(float)size;
@end



#import <UIKit/UIImageView.h>

@interface UIImageView (FuckIt)
+ (instancetype):(id)imageOrImageNameString;
@end



#import <UIKit/UIBarButtonItem.h>

@interface UIBarButtonItem (FuckIt)
+ (instancetype):(UIImage *)img target:(id)target :(SEL)selector;
@end



#endif
