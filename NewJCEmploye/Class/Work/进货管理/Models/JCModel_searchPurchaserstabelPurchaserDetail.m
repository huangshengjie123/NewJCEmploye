//
//  JCModel_searchPurchaserstabelPurchaserDetail.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelPurchaserDetail.h"


NSString *const kJCModel_searchPurchaserstabelPurchaserDetailLeader = @"leader";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailFranchiser = @"franchiser";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailOrg = @"org";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailId = @"id";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailApplicant = @"applicant";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailType = @"type";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailDisGroup = @"disGroup";
NSString *const kJCModel_searchPurchaserstabelPurchaserDetailName = @"name";


@interface JCModel_searchPurchaserstabelPurchaserDetail ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelPurchaserDetail

@synthesize leader = _leader;
@synthesize franchiser = _franchiser;
@synthesize org = _org;
@synthesize purchaserDetailIdentifier = _purchaserDetailIdentifier;
@synthesize applicant = _applicant;
@synthesize type = _type;
@synthesize disGroup = _disGroup;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.leader = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailLeader fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailFranchiser fromDictionary:dict];
            self.org = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailOrg fromDictionary:dict];
            self.purchaserDetailIdentifier = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailId fromDictionary:dict];
            self.applicant = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailApplicant fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailType fromDictionary:dict];
            self.disGroup = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailDisGroup fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_searchPurchaserstabelPurchaserDetailName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.leader forKey:kJCModel_searchPurchaserstabelPurchaserDetailLeader];
    [mutableDict setValue:self.franchiser forKey:kJCModel_searchPurchaserstabelPurchaserDetailFranchiser];
    [mutableDict setValue:self.org forKey:kJCModel_searchPurchaserstabelPurchaserDetailOrg];
    [mutableDict setValue:self.purchaserDetailIdentifier forKey:kJCModel_searchPurchaserstabelPurchaserDetailId];
    [mutableDict setValue:self.applicant forKey:kJCModel_searchPurchaserstabelPurchaserDetailApplicant];
    [mutableDict setValue:self.type forKey:kJCModel_searchPurchaserstabelPurchaserDetailType];
    [mutableDict setValue:self.disGroup forKey:kJCModel_searchPurchaserstabelPurchaserDetailDisGroup];
    [mutableDict setValue:self.name forKey:kJCModel_searchPurchaserstabelPurchaserDetailName];

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

    self.leader = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailLeader];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailFranchiser];
    self.org = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailOrg];
    self.purchaserDetailIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailId];
    self.applicant = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailApplicant];
    self.type = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailType];
    self.disGroup = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailDisGroup];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchPurchaserstabelPurchaserDetailName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_leader forKey:kJCModel_searchPurchaserstabelPurchaserDetailLeader];
    [aCoder encodeObject:_franchiser forKey:kJCModel_searchPurchaserstabelPurchaserDetailFranchiser];
    [aCoder encodeObject:_org forKey:kJCModel_searchPurchaserstabelPurchaserDetailOrg];
    [aCoder encodeObject:_purchaserDetailIdentifier forKey:kJCModel_searchPurchaserstabelPurchaserDetailId];
    [aCoder encodeObject:_applicant forKey:kJCModel_searchPurchaserstabelPurchaserDetailApplicant];
    [aCoder encodeObject:_type forKey:kJCModel_searchPurchaserstabelPurchaserDetailType];
    [aCoder encodeObject:_disGroup forKey:kJCModel_searchPurchaserstabelPurchaserDetailDisGroup];
    [aCoder encodeObject:_name forKey:kJCModel_searchPurchaserstabelPurchaserDetailName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelPurchaserDetail *copy = [[JCModel_searchPurchaserstabelPurchaserDetail alloc] init];
    
    
    
    if (copy) {

        copy.leader = [self.leader copyWithZone:zone];
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.org = [self.org copyWithZone:zone];
        copy.purchaserDetailIdentifier = [self.purchaserDetailIdentifier copyWithZone:zone];
        copy.applicant = [self.applicant copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.disGroup = [self.disGroup copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
