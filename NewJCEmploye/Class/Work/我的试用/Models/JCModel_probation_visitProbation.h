//
//  JCModel_probation_visitProbation.h
//
//  Created by   on 2018/10/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_probation_visitProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *probationIdentifier;
@property (nonatomic, strong) NSString *isDeal;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
