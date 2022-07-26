//
//  MouseFactory.m
//  工厂方法模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "MouseFactory.h"
#import "MouseProduct.h"

@implementation MouseFactory

- (id)creatProduct {
    NSLog(@"生产鼠标");
    return [[MouseProduct alloc] init];
}

@end
