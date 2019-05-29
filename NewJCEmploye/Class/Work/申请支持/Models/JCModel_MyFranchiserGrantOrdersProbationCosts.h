//
//  JCModel_MyFranchiserGrantOrdersProbationCosts.h
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_MyFranchiserGrantOrdersProbationCosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, strong) NSString *probationCostsIdentifier;
@property (nonatomic, assign) double item;
@property (nonatomic, assign) double unit;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
