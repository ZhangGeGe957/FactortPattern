//
//  HpFactory.m
//  抽象工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

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
