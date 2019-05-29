//
//  JCModel_ProbationNextBase.h
//
//  Created by   on 2018/6/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_ProbationNextProbation;

@interface JCModel_ProbationNextBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) NSString *current;
@property (nonatomic, strong) JCModel_ProbationNextProbation *probation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
