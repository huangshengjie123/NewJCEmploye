//
//  JCModel_updateCooPointCostItemBackBase.h
//
//  Created by   on 2019/1/17
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_updateCooPointCostItemBackBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSArray *itemXNums;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
