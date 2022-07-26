//
//  BaseFactory.h
//  抽象工厂模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseFactory : NSObject

- (id)createKeyboard;
- (id)createMouse;

@end

NS_ASSUME_NONNULL_END
