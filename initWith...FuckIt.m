#import <Foundation/Foundation.h>
#import "initWith...FuckIt.h"
#import <UIKit/UIKit.h>



@implementation NSAttributedString (FuckIt)

+ (instancetype):(NSString *)stringFormat, ... {
    va_list args;
    va_start(args, stringFormat);
    id rv = [[self alloc] initWithString:[[NSString alloc] initWithFormat:stringFormat arguments:args]];
    va_end(args);
    return rv;
}

@end



@implementation NSIndexPath (FuckIt)

+ (instancetype):(NSUInteger)row :(NSUInteger)section {
    return [NSIndexPath indexPathForRow:row inSection:section];
}

@end



@implementation NSIndexSet (FuckIt)

+ (instancetype):(NSUInteger)index {
    return [NSIndexSet indexSetWithIndex:index];
}

+ (instancetype):(NSUInteger)index1 :(NSUInteger)index2 {
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    [set addIndex:index1];
    [set addIndex:index2];
    return set;
}

+ (instancetype):(NSUInteger)index1 :(NSUInteger)index2 :(NSUInteger)index3 {
    NSMutableIndexSet *set = [NSMutableIndexSet indexSet];
    [set addIndex:index1];
    [set addIndex:index2];
    [set addIndex:index3];
    return set;
}

@end



@implementation NSString (FuckIt)

+ (instancetype):(NSString *)stringFormat, ... {
    va_list args;
    va_start(args, stringFormat);
    id rv = [[NSString alloc] initWithFormat:stringFormat arguments:args];
    va_end(args);
    return [[self alloc] initWithString:rv];
}

@end



@implementation NSURL (FuckIt)

+ (instancetype):(NSString *)url {
    return [NSURL URLWithString:url];
}

@end



#if TARGET_OS_IPHONE



@implementation UILabel (FuckIt)

+ (instancetype):(id)text {
    UILabel *label = [self new];
    label.text = [text description];
    [label sizeToFit];
    return label;
}

+ (instancetype):(id)text :(UIFont *)font {
    UILabel *label = [self new];
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



static NSString *UIAlertControllerTitleForErrorDomain(NSString *domain) {
    if (domain == NSURLErrorDomain) return @"Network Error";
    if ([domain isEqualToString:@"kCLErrorDomain"]) return @"Location Error";
    if ([domain isEqualToString:@"SKErrorDomain"]) return @"App Store Error";
    if ([domain isEqualToString:@"PMKErrorDomain"]) return @"Unexpected Error";
    if (domain == NSXMLParserErrorDomain) return @"XML Parsing Error";
    return @"Error";
}



@implementation UIAlertController (FuckIt)

+ (instancetype):(id)title {
    if ([title isKindOfClass:[NSError class]]) {
        NSError *error = title;
        if (error.domain == NSCocoaErrorDomain && error.code == 3840) {
            // is a NSJSONSerialization error and we need to make it more helpful
            id parts = [NSArray arrayWithObjects:error.localizedDescription, error.userInfo[@"NSDebugDescription"], nil];
            id message = [parts componentsJoinedByString:@". "];
            return [self:@"JSON Error":message];
        }
        return [self:UIAlertControllerTitleForErrorDomain(error.domain):error];
    } else {
        return [self:title:nil];
    }
}

+ (instancetype):(NSString *)title :(id)message {
    return [self:title:message:@"OK"];
}

+ (instancetype):(NSString *)title :(id)message :(NSString *)cancelButtonText {
    if ([message respondsToSelector:@selector(localizedFailureReason)]) {
        NSString *fr = [message localizedFailureReason];
        if (fr.length)
            NSLog(@"Error Localized Failure Reason: %@", fr);
    }

    if ([message isKindOfClass:[NSError class]]) {
        NSError *error = (id) message;
        message = [error.localizedDescription stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if (![message hasSuffix:@"."])
            message = [message stringByAppendingString:@"."];

        NSHTTPURLResponse *rsp = error.userInfo[@"PMKURLErrorFailingURLResponseKey"];
        if (rsp) {
            message = [message stringByAppendingFormat:@" When accessing: %@.", rsp.URL.absoluteString];
            if ([rsp isKindOfClass:[NSHTTPURLResponse class]]) {
                int code = (int) rsp.statusCode;
                message = [message stringByAppendingFormat:@" Response code: %d", code];
            }
        }
    } else {
        message = [message description];
    }

    UIAlertController *av = [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [av addAction:[UIAlertAction actionWithTitle:cancelButtonText style:UIAlertActionStyleCancel handler:nil]];
    return av;
}


@end



@implementation UIBarButtonItem (FuckIt)

+ (instancetype):(UIImage *)img target:(id)target :(SEL)selector {
    return [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target:target action:selector];
}

@end



@implementation UIImage (FuckIt)

+ (instancetype):(NSString *)name {
    return [self imageNamed:name];
}

@end



@implementation UIImageView (FuckIt)

+ (instancetype):(id)obj {
    if (![obj isKindOfClass:[UIImage class]])
        obj = [UIImage imageNamed:[obj description]];
    UIImageView *iv = [[self alloc] initWithImage:obj];
    [iv sizeToFit];
    return iv;
}

@end



#else



@implementation NSTask (MM)

+ (instancetype):(id)input, ... {
    if ([input isKindOfClass:[NSString class]]) {
        va_list args;
        va_start(args, input);
        id s = [[NSString alloc] initWithFormat:input arguments:args]];
        va_end(args);

        input = [s componentsSeparatedByString:@" "];
    }

    NSTask *task = [self new];
    task.launchPath = input.firstObject;
    task.arguments = [input subarrayWithRange:NSMakeRange(1, input.count - 1)];
    return task;
}

@end



#endif
