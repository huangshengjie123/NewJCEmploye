//
//  JCModel_InterstIncomeCreditComInfo.m
//
//  Created by   on 2019/3/13
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InterstIncomeCreditComInfo.h"


NSString *const kJCModel_InterstIncomeCreditComInfoOrgId = @"orgId";
NSString *const kJCModel_InterstIncomeCreditComInfoOrgName = @"orgName";


@interface JCModel_InterstIncomeCreditComInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InterstIncomeCreditComInfo

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
            self.orgId = [self objectOrNilForKey:kJCModel_InterstIncomeCreditComInfoOrgId fromDictionary:dict];
            self.orgName = [self objectOrNilForKey:kJCModel_InterstIncomeCreditComInfoOrgName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orgId forKey:kJCModel_InterstIncomeCreditComInfoOrgId];
    [mutableDict setValue:self.orgName forKey:kJCModel_InterstIncomeCreditComInfoOrgName];

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

    self.orgId = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeCreditComInfoOrgId];
    self.orgName = [aDecoder decodeObjectForKey:kJCModel_InterstIncomeCreditComInfoOrgName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orgId forKey:kJCModel_InterstIncomeCreditComInfoOrgId];
    [aCoder encodeObject:_orgName forKey:kJCModel_InterstIncomeCreditComInfoOrgName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InterstIncomeCreditComInfo *copy = [[JCModel_InterstIncomeCreditComInfo alloc] init];
    
    
    
    if (copy) {

        copy.orgId = [self.orgId copyWithZone:zone];
        copy.orgName = [self.orgName copyWithZone:zone];
    }
    
    return copy;
}


@end
