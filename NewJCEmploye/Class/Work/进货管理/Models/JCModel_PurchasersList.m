//
//  JCModel_PurchasersList.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PurchasersList.h"
#import "JCModel_PurchasersPurchaserStores.h"


NSString *const kJCModel_PurchasersListLeader = @"leader";
NSString *const kJCModel_PurchasersListFranchiser = @"franchiser";
NSString *const kJCModel_PurchasersListOrg = @"org";
NSString *const kJCModel_PurchasersListId = @"id";
NSString *const kJCModel_PurchasersListOrganization = @"organization";
NSString *const kJCModel_PurchasersListPurchaserStores = @"purchaserStores";
NSString *const kJCModel_PurchasersListDisGroup = @"disGroup";
NSString *const kJCModel_PurchasersListType = @"type";
NSString *const kJCModel_PurchasersListApplicant = @"applicant";
NSString *const kJCModel_PurchasersListName = @"name";


@interface JCModel_PurchasersList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PurchasersList

@synthesize leader = _leader;
@synthesize franchiser = _franchiser;
@synthesize org = _org;
@synthesize listIdentifier = _listIdentifier;
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
            self.leader = [[self objectOrNilForKey:kJCModel_PurchasersListLeader fromDictionary:dict] doubleValue];
            self.franchiser = [self objectOrNilForKey:kJCModel_PurchasersListFranchiser fromDictionary:dict];
            self.org = [self objectOrNilForKey:kJCModel_PurchasersListOrg fromDictionary:dict];
            self.listIdentifier = [self objectOrNilForKey:kJCModel_PurchasersListId fromDictionary:dict];
            self.organization = [self objectOrNilForKey:kJCModel_PurchasersListOrganization fromDictionary:dict];
    NSObject *receivedJCModel_PurchasersPurchaserStores = [dict objectForKey:kJCModel_PurchasersListPurchaserStores];
    NSMutableArray *parsedJCModel_PurchasersPurchaserStores = [NSMutableArray array];
    
    if ([receivedJCModel_PurchasersPurchaserStores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_PurchasersPurchaserStores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_PurchasersPurchaserStores addObject:[JCModel_PurchasersPurchaserStores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_PurchasersPurchaserStores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_PurchasersPurchaserStores addObject:[JCModel_PurchasersPurchaserStores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_PurchasersPurchaserStores]];
    }

    self.purchaserStores = [NSArray arrayWithArray:parsedJCModel_PurchasersPurchaserStores];
            self.disGroup = [self objectOrNilForKey:kJCModel_PurchasersListDisGroup fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_PurchasersListType fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_PurchasersListApplicant fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_PurchasersListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_PurchasersListLeader];
    [mutableDict setValue:self.franchiser forKey:kJCModel_PurchasersListFranchiser];
    [mutableDict setValue:self.org forKey:kJCModel_PurchasersListOrg];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_PurchasersListId];
    [mutableDict setValue:self.organization forKey:kJCModel_PurchasersListOrganization];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPurchaserStores] forKey:kJCModel_PurchasersListPurchaserStores];
    [mutableDict setValue:self.disGroup forKey:kJCModel_PurchasersListDisGroup];
    [mutableDict setValue:self.type forKey:kJCModel_PurchasersListType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_PurchasersListApplicant];
    [mutableDict setValue:self.name forKey:kJCModel_PurchasersListName];

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

    self.leader = [aDecoder decodeDoubleForKey:kJCModel_PurchasersListLeader];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_PurchasersListFranchiser];
    self.org = [aDecoder decodeObjectForKey:kJCModel_PurchasersListOrg];
    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_PurchasersListId];
    self.organization = [aDecoder decodeObjectForKey:kJCModel_PurchasersListOrganization];
    self.purchaserStores = [aDecoder decodeObjectForKey:kJCModel_PurchasersListPurchaserStores];
    self.disGroup = [aDecoder decodeObjectForKey:kJCModel_PurchasersListDisGroup];
    self.type = [aDecoder decodeObjectForKey:kJCModel_PurchasersListType];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_PurchasersListApplicant];
    self.name = [aDecoder decodeObjectForKey:kJCModel_PurchasersListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_leader forKey:kJCModel_PurchasersListLeader];
    [aCoder encodeObject:_franchiser forKey:kJCModel_PurchasersListFranchiser];
    [aCoder encodeObject:_org forKey:kJCModel_PurchasersListOrg];
    [aCoder encodeObject:_listIdentifier forKey:kJCModel_PurchasersListId];
    [aCoder encodeObject:_organization forKey:kJCModel_PurchasersListOrganization];
    [aCoder encodeObject:_purchaserStores forKey:kJCModel_PurchasersListPurchaserStores];
    [aCoder encodeObject:_disGroup forKey:kJCModel_PurchasersListDisGroup];
    [aCoder encodeObject:_type forKey:kJCModel_PurchasersListType];
    [aCoder encodeDouble:_applicant forKey:kJCModel_PurchasersListApplicant];
    [aCoder encodeObject:_name forKey:kJCModel_PurchasersListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PurchasersList *copy = [[JCModel_PurchasersList alloc] init];
    
    
    
    if (copy) {

        copy.leader = self.leader;
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.org = [self.org copyWithZone:zone];
        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
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
