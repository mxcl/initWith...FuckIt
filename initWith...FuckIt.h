#import <Foundation/NSAttributedString.h>

@interface NSAttributedString (FuckIt)
+ (instancetype):(NSString *)stringFormat, ...;
@end



#import <Foundation/NSString.h>

@interface NSString (FuckIt)
+ (instancetype):(NSString *)stringFormat, ...;
@end



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
