//
//  JCModel_FinancialGroupData.h
//
//  Created by   on 2018/6/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface JCModel_FinancialGroupData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double owner;
@property (nonatomic, strong) NSString *org;
@property (nonatomic, assign) id parent;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) id level;
@property (nonatomic, strong) NSString *dataDescription;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *groupRelations;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
