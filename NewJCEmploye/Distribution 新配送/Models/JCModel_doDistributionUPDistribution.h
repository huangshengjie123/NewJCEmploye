//
//  JCModel_doDistributionUPDistribution.h
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_doDistributionUPDistribution : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *distributionIdentifier;
@property (nonatomic, strong) NSArray *items;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
