//
//  AbstractFactory.m
//  抽象工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import "AbstractFactory.h"
#import "HpFactory.h"
#import "DellFactory.h"
#import "BaseFactory.h"

@implementation AbstractFactory

+ (id)allocatingTask:(NSString *)factoryType {
    NSArray *productArray = @[@"Hp", @"Dell"];
    switch ([productArray indexOfObject:factoryType]) {
        case 0:
            NSLog(@"Hp工厂");
            return [[HpFactory alloc] init];
            break;
        case 1:
            NSLog(@"Dell工厂");
            return [[DellFactory alloc] init];
            break;
    }
    return NULL;
}

@end
