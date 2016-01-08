# XLSideViewController
XLSideViewController is a sidebar 一个侧边栏的抽屉
#####只需传入两个控制器即可，支持手势拖拽，同时也支持点击隐藏或显示侧边栏抽屉，实时监听侧边栏抽屉的显示隐藏状态
```
XLSideViewController *sideViewController = [[XLSideViewController alloc] initWithMainViewController:navigationController leftViewController:leftViewController];

self.window.rootViewController = sideViewController;
```

![](https://github.com/ShelinShelin/XLSideViewController/blob/master/Untitled_1.gif)

