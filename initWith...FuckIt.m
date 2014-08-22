#import "initWith...FuckIt.h"
#import <UIKit/UIKit.h>



@implementation UILabel (FuckIt)

+ (instancetype):(id)text {
    UILabel *label = [UILabel new];
    label.text = [text description];
    [label sizeToFit];
    return label;
}

+ (instancetype):(id)text :(UIFont *)font {
    UILabel *label = [UILabel new];
    label.text = [text description];
    label.font = font;
    [label sizeToFit];
    return label;
}

+ (instancetype):(id)text :(id)fontName :(float)size {
    id font = fontName ? [UIFont fontWithName:fontName size:size] : [UIFont systemFontOfSize:size];
    return [self :text:font];
}

@end



@implementation UIAlertView (FuckIt)

+ (instancetype):(id)title {
    if ([title isKindOfClass:[NSError class]]) {
        return [self:@"Unexpected Error":title];
    } else {
        return [self:title:nil];
    }
}

+ (instancetype):(NSString *)title :(id)message {
    return [UIAlertView:title:message:@"OK"];
}

+ (instancetype):(NSString *)title :(id)message :(NSString *)cancelButtonText {
    if ([message respondsToSelector:@selector(localizedFailureReason)]) {
        NSString *fr = [message localizedFailureReason];
        if (fr.length)
            NSLog(@"Error Localized Failure Reason: %@", fr);
    }

    message = [message respondsToSelector:@selector(localizedDescription)]
        ? [message localizedDescription]
        : [message description];

    UIAlertView *av = [[self alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonText otherButtonTitles:nil];
    [av show];  // no more forgetting to call `-show` in production code
    return av;
}

@end

