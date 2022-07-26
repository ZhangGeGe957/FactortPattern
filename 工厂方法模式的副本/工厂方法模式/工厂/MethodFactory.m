//
//  MethodFactory.m
//  工厂方法模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "MethodFactory.h"
#import "KeyboardFactory.h"
#import "MouseFactory.h"

@implementation MethodFactory

+ (id)allocatingTask:(NSString *)productType {
    NSArray *productArray = @[@"Mouse", @"Keyboard"];
    switch ([productArray indexOfObject:productType]) {
        case 0:
            NSLog(@"鼠标工厂");
            return [[MouseFactory alloc] init];
            break;
        case 1:
            NSLog(@"键盘工厂");
            return [[KeyboardFactory alloc] init];
            break;
    }
    return NULL;
}

@end
