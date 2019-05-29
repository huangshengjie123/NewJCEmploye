//
//  JCModel_createCooPointOrderBase.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_createCooPointOrderInOutStoreCmd, JCModel_createCooPointOrderCooPointOrder;

@interface JCModel_createCooPointOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JCModel_createCooPointOrderInOutStoreCmd *inOutStoreCmd;
@property (nonatomic, strong) JCModel_createCooPointOrderCooPointOrder *cooPointOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
