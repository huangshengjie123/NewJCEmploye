//
//  JCModel_doDistributionUPBase.h
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_doDistributionUPDistribution;

@interface JCModel_doDistributionUPBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *isComplete;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_doDistributionUPDistribution *distribution;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
