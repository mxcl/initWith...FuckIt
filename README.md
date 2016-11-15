Constructors for people who GT(F)D.

```objc
- (void)onSomeFuckingErrorHappened:(NSError *)fuckingError {
    UIAlertController *alert = [UIAlertController:fuckingError];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)makeSomeFuckingLabels {
    UILabel *l1 = [UILabel:@"Terseness is cool"];
    UILabel *l2 = [UILabel:@"Terseness is cool":[UIFont systemFontOfSize:13]];
    UILabel *l3 = [UILabel:@"Terseness is cool":@"Times New Roman":16];
    // …
}
```


# Install

In your fucking `Podfile`:

```ruby
pod 'initWith...FuckIt'
```

In your fucking `.m` files:

```objc
#import <initWith...FuckIt.h>
```


# License

Do whatever the fuck you want (public domain).
