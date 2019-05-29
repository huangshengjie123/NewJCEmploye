//
//  JCModel_searchOrg2Data.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchOrg2Data.h"
#import "JCModel_searchOrg2PurchaserStores.h"


NSString *const kJCModel_searchOrg2DataLeader = @"leader";
NSString *const kJCModel_searchOrg2DataFranchiser = @"franchiser";
NSString *const kJCModel_searchOrg2DataOrg = @"org";
NSString *const kJCModel_searchOrg2DataId = @"id";
NSString *const kJCModel_searchOrg2DataOrganization = @"organization";
NSString *const kJCModel_searchOrg2DataPurchaserStores = @"purchaserStores";
NSString *const kJCModel_searchOrg2DataDisGroup = @"disGroup";
NSString *const kJCModel_searchOrg2DataType = @"type";
NSString *const kJCModel_searchOrg2DataApplicant = @"applicant";
NSString *const kJCModel_searchOrg2DataName = @"name";


@interface JCModel_searchOrg2Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchOrg2Data

@synthesize leader = _leader;
@synthesize franchiser = _franchiser;
@synthesize org = _org;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize organization = _organization;
@synthesize purchaserStores = _purchaserStores;
@synthesize disGroup = _disGroup;
@synthesize type = _type;
@synthesize applicant = _applicant;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.leader = [[self objectOrNilForKey:kJCModel_searchOrg2DataLeader fromDictionary:dict] doubleValue];
            self.franchiser = [self objectOrNilForKey:kJCModel_searchOrg2DataFranchiser fromDictionary:dict];
            self.org = [self objectOrNilForKey:kJCModel_searchOrg2DataOrg fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_searchOrg2DataId fromDictionary:dict];
            self.organization = [self objectOrNilForKey:kJCModel_searchOrg2DataOrganization fromDictionary:dict];
    NSObject *receivedJCModel_searchOrg2PurchaserStores = [dict objectForKey:kJCModel_searchOrg2DataPurchaserStores];
    NSMutableArray *parsedJCModel_searchOrg2PurchaserStores = [NSMutableArray array];
    
    if ([receivedJCModel_searchOrg2PurchaserStores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_searchOrg2PurchaserStores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_searchOrg2PurchaserStores addObject:[JCModel_searchOrg2PurchaserStores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_searchOrg2PurchaserStores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_searchOrg2PurchaserStores addObject:[JCModel_searchOrg2PurchaserStores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_searchOrg2PurchaserStores]];
    }

    self.purchaserStores = [NSArray arrayWithArray:parsedJCModel_searchOrg2PurchaserStores];
            self.disGroup = [self objectOrNilForKey:kJCModel_searchOrg2DataDisGroup fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_searchOrg2DataType fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_searchOrg2DataApplicant fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_searchOrg2DataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_searchOrg2DataLeader];
    [mutableDict setValue:self.franchiser forKey:kJCModel_searchOrg2DataFranchiser];
    [mutableDict setValue:self.org forKey:kJCModel_searchOrg2DataOrg];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_searchOrg2DataId];
    [mutableDict setValue:self.organization forKey:kJCModel_searchOrg2DataOrganization];
    NSMutableArray *tempArrayForPurchaserStores = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.purchaserStores) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPurchaserStores addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPurchaserStores addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPurchaserStores] forKey:kJCModel_searchOrg2DataPurchaserStores];
    [mutableDict setValue:self.disGroup forKey:kJCModel_searchOrg2DataDisGroup];
    [mutableDict setValue:self.type forKey:kJCModel_searchOrg2DataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_searchOrg2DataApplicant];
    [mutableDict setValue:self.name forKey:kJCModel_searchOrg2DataName];

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

    self.leader = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2DataLeader];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataFranchiser];
    self.org = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataOrg];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataId];
    self.organization = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataOrganization];
    self.purchaserStores = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataPurchaserStores];
    self.disGroup = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataDisGroup];
    self.type = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataType];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_searchOrg2DataApplicant];
    self.name = [aDecoder decodeObjectForKey:kJCModel_searchOrg2DataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_leader forKey:kJCModel_searchOrg2DataLeader];
    [aCoder encodeObject:_franchiser forKey:kJCModel_searchOrg2DataFranchiser];
    [aCoder encodeObject:_org forKey:kJCModel_searchOrg2DataOrg];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_searchOrg2DataId];
    [aCoder encodeObject:_organization forKey:kJCModel_searchOrg2DataOrganization];
    [aCoder encodeObject:_purchaserStores forKey:kJCModel_searchOrg2DataPurchaserStores];
    [aCoder encodeObject:_disGroup forKey:kJCModel_searchOrg2DataDisGroup];
    [aCoder encodeObject:_type forKey:kJCModel_searchOrg2DataType];
    [aCoder encodeDouble:_applicant forKey:kJCModel_searchOrg2DataApplicant];
    [aCoder encodeObject:_name forKey:kJCModel_searchOrg2DataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchOrg2Data *copy = [[JCModel_searchOrg2Data alloc] init];
    
    
    
    if (copy) {

        copy.leader = self.leader;
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.org = [self.org copyWithZone:zone];
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.organization = [self.organization copyWithZone:zone];
        copy.purchaserStores = [self.purchaserStores copyWithZone:zone];
        copy.disGroup = [self.disGroup copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.applicant = self.applicant;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
