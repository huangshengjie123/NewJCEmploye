//
//  JCModel_createCooPointOrderInOutOrder.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_createCooPointOrderInOutOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double checkerM;
@property (nonatomic, assign) double storeHouse;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
