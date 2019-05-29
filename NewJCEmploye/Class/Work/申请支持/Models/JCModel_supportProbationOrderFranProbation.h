//
//  JCModel_supportProbationOrderFranProbation.h
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_supportProbationOrderFranProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *probationCosts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
