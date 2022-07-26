//
//  BaseFactory.h
//  工厂方法模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import <Foundation/Foundation.h>
#import "ProductProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseFactory : NSObject<ProductProtocol>

- (id)creatProduct;

@end

NS_ASSUME_NONNULL_END
