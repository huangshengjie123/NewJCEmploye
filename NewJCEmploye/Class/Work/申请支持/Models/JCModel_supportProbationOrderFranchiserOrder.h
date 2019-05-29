//
//  JCModel_supportProbationOrderFranchiserOrder.h
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_supportProbationOrderFranProbation;

@interface JCModel_supportProbationOrderFranchiserOrder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *franchiserOrderIdentifier;
@property (nonatomic, strong) JCModel_supportProbationOrderFranProbation *franProbation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
