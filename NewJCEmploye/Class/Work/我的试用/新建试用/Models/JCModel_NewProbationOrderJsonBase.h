//
//  JCModel_NewProbationOrderJsonBase.h
//
//  Created by   on 2018/5/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCModel_NewProbationOrderJsonProbation;

@interface JCModel_NewProbationOrderJsonBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL isOutStore;
@property (nonatomic, strong) NSString *storeHourse;
@property (nonatomic, strong) JCModel_NewProbationOrderJsonProbation *probation;
@property (nonatomic, strong) NSString *command;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
