//
//  JCModel_dealFranchiserProbationMBase.h
//
//  Created by   on 2018/9/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_dealFranchiserProbationMProbation;

@interface JCModel_dealFranchiserProbationMBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *storeHourse;
@property (nonatomic, strong) NSString *needOutStore;
@property (nonatomic, strong) JCModel_dealFranchiserProbationMProbation *probation;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
