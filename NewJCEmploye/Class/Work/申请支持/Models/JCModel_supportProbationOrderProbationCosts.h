//
//  JCModel_supportProbationOrderProbationCosts.h
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_supportProbationOrderProbationCosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double num;
@property (nonatomic, assign) double item;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
