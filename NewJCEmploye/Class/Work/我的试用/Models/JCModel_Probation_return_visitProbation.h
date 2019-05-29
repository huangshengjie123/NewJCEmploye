//
//  JCModel_Probation_return_visitProbation.h
//
//  Created by   on 2018/6/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_Probation_return_visitProbation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *probationIdentifier;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
