//
//  JCModel_createCooPointOrderCooPointOrder.h
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_createCooPointOrderCooPointOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *cooPointOrderCosts;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) double cooId;
@property (nonatomic, strong) NSString *comments;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
