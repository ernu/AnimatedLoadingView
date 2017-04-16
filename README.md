# AnimatedLoadingView

Animated circle loading view, with changing colors.

##### Pod Install
```
pod 'AnimatedLoadingView', '0.0.1'
```

##### Default Loading View Example
```
AnimatedLoadingView *defaultLoadingView = [[AnimatedLoadingView alloc] initWithFrame:self.view.frame];
[self.view addSubview:defaultLoadingView];
[defaultLoadingView start];
```

##### Customizable Loading View Example
```
AnimatedLoadingView *colorChangeLoadingView = [[AnimatedLoadingView alloc] initWithFrame:self.textView.frame bgColor:[[UIColor blackColor] colorWithAlphaComponent:0.5] firstColor:[UIColor greenColor] secondColor:[UIColor purpleColor]];
[self.view addSubview:colorChangeLoadingView];
[colorChangeLoadingView start];
```

##### Stop Loading
```
[defaultLoadingView stop];
[colorChangeLoadingView stop];
```
