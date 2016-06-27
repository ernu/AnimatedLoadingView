# AnimatedLoadingView

Animated circle loading view, with changing colors.

##### Default Loading View
```
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        firstColor = [UIColor blueColor];
        secondColor = [UIColor yellowColor];
        [self loadView];
    }
    return self;
}
```

##### Customizable Loading View
```
- (id)initWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor firstColor:(UIColor *)fColor secondColor:(UIColor *)sColor
{
    self = [super initWithFrame:frame];
    if (self) {
        if (bgColor) backgroundColor = bgColor;
        else backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        
        if (fColor) firstColor = fColor;
        else firstColor = [UIColor blueColor];
        
        if (sColor) secondColor = sColor;
        else secondColor = [UIColor yellowColor];
        
        [self loadView];
    }
    return self;
}
```
