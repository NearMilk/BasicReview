//
//  LifeCycleNibVC.m
//  BasicReview
//
//  Created by near on 2017/11/21.
//  Copyright © 2017年 near. All rights reserved.
//

#import "LifeCycleNibVC.h"
#import "LifeCycleView.h"

/**
 资料来源于 http://www.jianshu.com/p/d60b388b19f5
 */

/**
 init
     ⬇️
 initWithNibName:bundle:
     ⬇️
 loadView
     ⬇️
 viewDidLoad
     ⬇️
 viewWillAppear
     ⬇️
 viewWillLayoutSubviews
     ⬇️
 viewDidLayoutSubviews
     ⬇️
 viewDidAppear
     ⬇️
 viewWillDisappear
     ⬇️
 viewDidDisappear
     ⬇️
 dealloc
 */


@interface LifeCycleNibVC ()

@end

@implementation LifeCycleNibVC

- (instancetype)init {
    NSLog(@"%s", __func__);
    return [super init];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"%s", __func__);
    return [super initWithCoder:aDecoder];
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSLog(@"%s", __func__);
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    /**
    初始化UIViewController，执行关键数据初始化操作，非StoryBoard创建UIViewController都会调用这个方法。
    注意: 不要在这里做View相关操作，View在loadView方法中才初始化
     */
}

//- (void)loadView {
//    NSLog(@"%s", __func__);
//    self.view = [[UIView alloc] init];
//    self.view.backgroundColor = [UIColor whiteColor];
//    LifeCycleView *lifeCycleView = [[LifeCycleView alloc] init];
//    [self.view addSubview:lifeCycleView];
////    很多人都会疑惑self.view,这个view道理是哪里来的，就是在这里。一般不需要去操作这个。但如果有特殊的需求，要求这个self.view是我们自己自定义的view时候就可以用这个方法
//
//    /**
//     当执行到loadView方法时，如果视图控制器是通过nib创建，那么视图控制器已经从nib文件中被解档并创建好了，接下来任务就是对view进行初始化。
//
//     loadView方法在UIViewController对象的view被访问且为空的时候调用。这是它与awakeFromNib方法的一个区别。
//     假设我们在处理内存警告时释放view属性:self.view = nil。因此loadView方法在视图控制器的生命周期内可能被调用多次。
//     loadView方法不应该直接被调用，而是由系统调用。它会加载或创建一个view并把它赋值给UIViewController的view属性。
//
//     在创建view的过程中，首先会根据nibName去找对应的nib文件然后加载。如果nibName为空或找不到对应的nib文件，则会创建一个空视图(这种情况一般是纯代码)
//     NOTE:在重写loadView方法的时候，不要调用父类的方法。
//     */
//}
- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __func__);
    /**
     当awakeFromNib方法被调用时，所有视图的outlet和action已经连接，但还没有被确定，这个方法可以算作适合视图控制器的实例化配合一起使用的，因为有些需要根据用户洗好来进行设置的内容，无法存在storyBoard或xib中，所以可以在awakeFromNib方法中被加载进来。
     */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s", __func__);
    LifeCycleView *lifeCycleView = [[LifeCycleView alloc] init];
    [self.view addSubview:lifeCycleView];
    /**
     当loadView将view载入内存中，会进一步调用viewDidLoad方法来进行进一步设置。此时，视图层次已经放到内存中，通常，我们对于各种初始化数据的载入，初始设定、修改约束、移除视图等很多操作都可以这个方法中实现。
     
     视图层次(view hierachy):因为每个视图都有自己的子视图，这个视图层次其实也可以理解为一颗树状的数据结构。而树的根节点，也就是根视图(root view),在UIViewController中以view属性。它可以看做是其他所有子视图的容器，也就是根节点。
     */
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s", __func__);
    /**
     系统在载入所有的数据后，将会在屏幕上显示视图，这时会先调用这个方法，通常我们会在这个方法对即将显示的视图做进一步的设置。比如，设置设备不同方向时该如何显示；设置状态栏方向、设置视图显示样式等。
     
     另一方面，当APP有多个视图时，上下级视图切换是也会调用这个方法，如果在调入视图时，需要对数据做更新，就只能在这个方法内实现
     */
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%s", __func__);
    /**
     在view被添加到视图层级中以及多视图，上下级视图切换时调用这个方法，在这里可以对正在显示的视图做进一步的设置。
     */
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%s", __func__);
    /**
     在视图切换时，当前视图在即将被移除、或被覆盖是，会调用该方法，此时还没有调用removeFromSuperview
     */
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%s", __func__);
    /**
     view已经消失或被覆盖，此时已经调用removeFromSuperView
     */
}

- (void)viewWillLayoutSubviews {
    NSLog(@"%s", __func__);
    /**
    view 即将布局其Subviews。 比如view的bounds改变了(例如:状态栏从不显示到显示,视图方向变化)，要调整Subviews的位置，在调整之前要做的工作可以放在该方法中实现
    */
}

- (void)viewDidLayoutSubviews {
    NSLog(@"%s", __func__);
    /**
     view已经布局其Subviews，这里可以放置调整完成之后需要做的工作
     */
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    /**
    视图被销毁，此次需要对你在init和viewDidLoad中创建的对象进行释放
     */
}

@end
