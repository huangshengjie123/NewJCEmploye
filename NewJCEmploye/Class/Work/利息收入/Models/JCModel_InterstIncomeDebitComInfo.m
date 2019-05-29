//
//  JCModel_InterstIncomeDebitComInfo.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeDebitComInfo.h"


NSString *const kJCModel_InterstIncomeDebitComInfoOrgId = @"orgId";
NSString *const kJCModel_InterstIncomeDebitComInfoOrgName = @"orgName";


@interface JCModel_InterstIncomeDebitComInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeDebitComInfo

@synthesize orgId = _orgId;
@synthesize orgName = _orgName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orgId = [self objectOrNilForKey:kJCModel_InterstIncomeDebitComInfoOrgId fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_InterstIncomeDebitComInfoOrgName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orgId forKey:kJCModel_InterstIncomeDebitComInfoOrgId];
    [mutableDict setValue:self.orgName forKey:kJCModel_InterstIncomeDebitComInfoOrgName];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.orgId = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeDebitComInfoOrgId];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeDebitComInfoOrgName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orgId forKey:kJCModel_InterstIncomeDebitComInfoOrgId];
    [aCoder encodeObject:_orgName forKey:kJCModel_InterstIncomeDebitComInfoOrgName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeDebitComInfo *copy = [[JCModel_InterstIncomeDebitComInfo alloc] init];
    
    
    
    if (copy) {

        copy.orgId = [self.orgId copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
    }
    
    return copy;
}


@end
