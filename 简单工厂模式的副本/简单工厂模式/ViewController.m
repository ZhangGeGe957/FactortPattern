//
//  ViewController.m
//  简单工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "ViewController.h"
#import "SimpleFactory.h"
#import "ProductProtocol.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *mouseButton;
@property (nonatomic, strong) UIButton *keyboardButton;

@end

@implementation ViewController

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


@end
