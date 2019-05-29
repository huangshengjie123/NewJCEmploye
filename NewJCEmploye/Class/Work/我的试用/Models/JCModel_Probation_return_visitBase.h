//
//  JCModel_Probation_return_visitBase.h
//
//  Created by   on 2018/6/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_Probation_return_visitProbation;

@interface JCModel_Probation_return_visitBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *current;
@property (nonatomic, assign) BOOL isDeal;
@property (nonatomic, assign) BOOL isInStore;
@property (nonatomic, strong) NSString *command;
@property (nonatomic, strong) JCModel_Probation_return_visitProbation *probation;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
