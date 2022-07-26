//
//  MethodFactory.h
//  工厂方法模式
//
//  Created by 张佳乔 on 2022/7/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MethodFactory : NSObject

+ (id)allocatingTask:(NSString *)productType;

@end

NS_ASSUME_NONNULL_END
