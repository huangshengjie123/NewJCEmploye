//
//  JCModel_BindedFranchiserOrderBase.h
//
//  Created by   on 2018/9/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_BindedFranchiserOrderFranchiserOrder;

@interface JCModel_BindedFranchiserOrderBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *waterCardId;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) NSString *needBindCard;
@property (nonatomic, strong) JCModel_BindedFranchiserOrderFranchiserOrder *franchiserOrder;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
