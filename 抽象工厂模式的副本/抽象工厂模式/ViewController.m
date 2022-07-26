//
//  ViewController.m
//  抽象工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "ViewController.h"
#import "AbstractFactory.h"
#import "BaseFactory.h"
#import "BaseProduct.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *hpButton;
@property (nonatomic, strong) UIButton *dellButton;

@end

@implementation ViewController

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


@end
