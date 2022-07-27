在基类中定义创建对象的一个接口，让子类决定实例化哪个类。工厂方法让一个类的实例化延迟到子类中进行。工厂方法要解决的问题是对象的创建时机，它提供了一种扩展的策略，很好地符合了开放封闭原则。`工厂方法`也叫做`虚构造器（Virtual Constructor）`。
## 1.简单工厂模式（Simple Factory Pattern）
专门定义一个类（工厂类）来负责创建其他类的实例。可以根据创建方法的参数来返回不同类的实例，被创建的实例通常具有共同的父类。就是通过你传入的参数来判断具体要实现的实例。
![4234234](https://img-blog.csdnimg.cn/01d30bc1f8c64cd89f6613d0ec742b46.png)

==通俗的讲：== 简单工厂模式就是一个工厂可以生产多种产品，只需要用户说明自己想生产的产品工厂就可以生产对应的产品。

### 优点：
- 将对象的创建和对象本身业务处理分离可以降低系统的耦合度，使得两者修改起来都相对容易。
- 根据约定好的参数就可以获取所需要的对象，而不需要知道其创建的细节。减少了系统的耦合度。
- 在调用工厂类的工厂方法时，由于工厂方法是静态方法，使用起来很方便，可通过类名直接调用，而且只需要传入一个简单的参数即可，修改参数时无须修改任何源代码
- 客户端无须知道所创建的具体产品类的类名，只需要知道具体产品类所对应的参数即可，减少开发者的记忆成本。
### 缺点：
- 简单工厂模式最大的问题在于工厂类的职责相对过重，增加新的产品需要修改工厂类的判断逻辑，这一点与开闭原则是相违背的。
- 在产品类型较多时，有可能造成工厂逻辑过于复杂。所以简单工厂模式比较适合产品种类比较少而且增多的概率很低的情况。

### 代码例子：
设置两个button，控制不同的产品：
```objectivec
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mouseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mouseButton setTitle:@"Mouse" forState:UIControlStateNormal];
    [self.view addSubview:self.mouseButton];
    [self.mouseButton setFrame:CGRectMake(50, 200, 100, 100)];
    [self.mouseButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.keyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.keyboardButton setTitle:@"Keyboard" forState:UIControlStateNormal];
    [self.view addSubview:self.keyboardButton];
    [self.keyboardButton setFrame:CGRectMake(150, 200, 100, 100)];
    [self.keyboardButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressButton:(UIButton *)button {
    id whichProduct = [SimpleFactory createProduct:button.titleLabel.text];
    [whichProduct productType];
}
```
![4234234](https://img-blog.csdnimg.cn/275f96f8d2914c4b9c0e38fb19518a72.png)
并且创建相应的产品：
```objectivec
#import "keyboardProduct.h"

@implementation keyboardProduct

- (void)productType {
    NSLog(@"键盘");
}

@end
```
通过传递的信息来告诉工厂你想加工的产品：
```objectivec
+ (id)createProduct:(NSString *)productType {
    NSArray *productArray = @[@"Mouse", @"Keyboard"];
    switch ([productArray indexOfObject:productType]) {
        case 0:
            return [[MouseProduct alloc] init];
            break;
        case 1:
            return [[keyboardProduct alloc] init];
            break;
    }
    return NULL;
}
```
![5345345](https://img-blog.csdnimg.cn/11c584f8584d4fad9baad46ec41b62f4.png)

## 2.工厂方法模式（Factory Method Pattern）
`工厂方法模式(Factory Method Pattern)`又称为`工厂模式`，工厂父类负责定义创建产品对象的公共接口，而工厂子类则负责生成具体的产品对象，即通过不同的工厂子类来创建不同的产品对象。就像Cocoa Touch中的`NSNumber`的`numberWithBool`和`numberWithInt`方法，他们传入不同类型的参数，获得`NSNumber`实例。
![4234234](https://img-blog.csdnimg.cn/3f2ce4d39edc4dbfac7d04e0ba06d2e0.png)


==通俗的讲：== 工厂方法模式就是在简单工厂模式的前提下，扩展了工厂，他不再是通过一个工厂来完成多个产品的生产，而是通过一个统一的抽象工厂，分配任务给底下相应生产专一产品的工厂让他们来生产产品。
### 优点：
- 根据所需产品找对应工厂进行生产，不关心产品细节，也不需要知道产品类的类名。
- 当系统中加入新产品时，不需要修改抽象工厂和抽象产品提供的接口，也无须修改客户端和其他的具体工厂和具体产品，而只要添加一个具体工厂和与其对应的具体产品就可以了，符合了开闭原则。
- 降低了工厂类的内聚，满足了类之间的层次关系，又很好的符合了面向对象设计中的单一职责原则，这样有利于程序的拓展。
### 缺点：
- 当系统中加入新产品时，除了需要提供新的产品类之外，还要提供与其对应的具体工厂类。因此系统中类的个数将成对增加，增加了系统的复杂度。

### 与简单工厂的区别：
工厂方法和简单工厂有一些区别，简单工厂是由一个代工厂生产不同的产品，而工厂方法是对工厂进行抽象化，不同产品都由专门的具体工厂来生产。
**即：多个工厂对应多个品牌厂商进行一对一生产。**

### 代码例子：
创建两个button，控制不同工厂生产产品：
```objectivec
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mouseButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.mouseButton setTitle:@"Mouse" forState:UIControlStateNormal];
    [self.view addSubview:self.mouseButton];
    [self.mouseButton setFrame:CGRectMake(50, 200, 100, 100)];
    [self.mouseButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.keyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.keyboardButton setTitle:@"Keyboard" forState:UIControlStateNormal];
    [self.view addSubview:self.keyboardButton];
    [self.keyboardButton setFrame:CGRectMake(150, 200, 100, 100)];
    [self.keyboardButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressButton:(UIButton *)button {
    id whichFactory = [MethodFactory allocatingTask:button.titleLabel.text];
    id whichProduct = [whichFactory creatProduct];
    [whichProduct productType];
}
```
![5345345](https://img-blog.csdnimg.cn/c9603b1d5c6948229041d56d50216db5.png)

定义工厂基类，其中包含子类工厂要实现的方法：
```objectivec
#import <Foundation/Foundation.h>
#import "ProductProtocol.h"

@interface BaseFactory : NSObject<ProductProtocol>

- (id)creatProduct;

@end
```
子类去实现该基类的方法：
```objectivec
//.h文件
#import "BaseFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface KeyboardFactory : BaseFactory


@end

NS_ASSUME_NONNULL_END


//.m文件
#import "KeyboardFactory.h"
#import "KeyboardProduct.h"


@implementation KeyboardFactory

- (id)creatProduct {
    NSLog(@"生产键盘");
    return [[KeyboardProduct alloc] init];
}

@end
```
同时实现工厂产品类：
```objectivec
#import "KeyboardProduct.h"

@implementation KeyboardProduct

- (void)productType {
    NSLog(@"开始生产键盘");
}

@end
```
![5345345](https://img-blog.csdnimg.cn/64eafa324fd842a1b72235f17f268aa3.png)


## 3.抽象工厂模式（Abstract Factory Pattern）
提供一个创建一系列相关或相互依赖对象的接口，而无须指定他们具体的类。一个工厂等级结构可以创建出分属于不同产品等级结构的一个产品族中的所有对象。
![5345345](https://img-blog.csdnimg.cn/2104e55e89ee4834b8ebbadd4cac0a9b.png)

==通俗的讲：== 抽象工厂就是在工厂方法模式的基础上，扩展了产品，之前通过抽象工厂给各实例工厂说明自己要生产的产品，但是一个工厂就只能生产一种产品，但是抽象工厂就是它的升级版，现在的一个实例工厂就可以生产多个产品，相当于一个工厂就是一个品牌，他可以生产手机、键盘、电脑等等。
### 优点：
- 不需要生产产品细节，只需要知道产品属于那个工厂就行，当一个产品族中的多个对象被设计成一起工作时，它能够保证客户端始终只使用同一个产品族中的对象。这对一些需要根据当前环境来决定其行为的软件系统来说，是一种非常实用的设计模式。
- 让你感觉不到内部差异性（cocoa框架里到处都是使用了这种设计，比如NSString、NSNumber）。
### 缺点：
- 如果你修改了抽象类的方法，那么所有的子类都要跟着一起修改。

### 抽象工厂模式和工厂模式的比较：
- **工厂方法模式**：每个抽象产品派生多个具体产品类，每个抽象工厂类派生多个具体工厂类，每个具体工厂类负责一个具体产品的实例创建；
- **抽象工厂模式**：每个抽象工厂派生多个具体工厂类，每个具体工厂负责多个（一系列）具体产品的实例创建。

### 代码例子：
定义两个button，控制不同的工厂厂家：
```objectivec
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.hpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.hpButton setTitle:@"Hp" forState:UIControlStateNormal];
    [self.view addSubview:self.hpButton];
    [self.hpButton setFrame:CGRectMake(50, 200, 100, 100)];
    [self.hpButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.dellButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.dellButton setTitle:@"Dell" forState:UIControlStateNormal];
    [self.view addSubview:self.dellButton];
    [self.dellButton setFrame:CGRectMake(150, 200, 100, 100)];
    [self.dellButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressButton:(UIButton *)button {
    id whichFactory = [AbstractFactory allocatingTask:button.titleLabel.text];
    id whichProduct = [whichFactory createMouse];
    [whichProduct productType];
    
}
```
再定义两个基类，一个工厂基类，一个产品基类：
```objectivec
//工厂基类
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseFactory : NSObject

- (id)createKeyboard;
- (id)createMouse;

@end

NS_ASSUME_NONNULL_END

//产品基类
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseProduct : NSObject

- (void)productType;

@end

NS_ASSUME_NONNULL_END
```
在定义上述两个基类的子类，并实现其方法：
```objectivec
//工厂子类，剩下的等同
//.h文件
#import "BaseFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface HpFactory : BaseFactory

@end

NS_ASSUME_NONNULL_END

//.m文件
#import "HpFactory.h"
#import "KeyboardHpProduct.h"
#import "MouseHpProduct.h"

@implementation HpFactory

- (id)createKeyboard {
    NSLog(@"Hp Factory Create Keyboard");
    return [[KeyboardHpProduct alloc] init];
}
- (id)createMouse {
    NSLog(@"Hp Factory Create Mouse");
    return [[MouseHpProduct alloc] init];
}

@end


//产品子类，剩下的等同
//.h文件
#import "BaseProduct.h"

NS_ASSUME_NONNULL_BEGIN

@interface KeyboardDellProduct : BaseProduct

@end

NS_ASSUME_NONNULL_END

//.m文件
#import "KeyboardDellProduct.h"

@implementation KeyboardDellProduct

- (void)productType {
    NSLog(@"Dell keyboard");
}

@end
```
![53434534](https://img-blog.csdnimg.cn/a2b57eba08874ca19fed0edd63392090.png)
