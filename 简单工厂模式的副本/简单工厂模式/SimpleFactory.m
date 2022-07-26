//
//  SimpleFactory.m
//  简单工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "SimpleFactory.h"
#import "MouseProduct.h"
#import "keyboardProduct.h"

@implementation SimpleFactory

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

@end
