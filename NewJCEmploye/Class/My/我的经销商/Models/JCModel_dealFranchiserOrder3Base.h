//
//  JCModel_dealFranchiserOrder3Base.h
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_dealFranchiserOrder3FranchiserOrder;

@interface JCModel_dealFranchiserOrder3Base : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sellGroupId;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *needOutStore;
@property (nonatomic, strong) NSString *storeHourse;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_dealFranchiserOrder3FranchiserOrder *franchiserOrder;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
