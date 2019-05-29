//
//  JCModel_DistributionCarPGroupRelations.h
//
//  Created by   on 2018/10/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_DistributionCarPGroupRelations : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *groupRelationsIdentifier;
@property (nonatomic, assign) double number;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
