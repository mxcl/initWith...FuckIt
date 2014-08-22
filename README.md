Constructors for people who don’t give a fuck if you think terseness is readable or not.

Do you find this unreadable?

```objc
- (void)onSomeFuckingErrorHappened:(NSError *)fuckingError {
    UIAlertView *alert = [UIAlertView:fuckingError];
    [alert show];
}

- (void)makeLabels {
    UILabel *ll = [UILabel:@"Terseness is cool":@"Times New Roman":16];
    [self.view addSubview:ll]
}
```

If you don’t like it…whatever.


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
