//
//  DellFactory.m
//  抽象工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "DellFactory.h"
#import "KeyboardDellProduct.h"
#import "MouseDellProduct.h"

@implementation DellFactory

- (id)createKeyboard {
    NSLog(@"Dell Factory Create Keyboard");
    return [[KeyboardDellProduct alloc] init];
}
- (id)createMouse {
    NSLog(@"Dell Factory Create Mouse");
    return [[MouseDellProduct alloc] init];
}

@end
