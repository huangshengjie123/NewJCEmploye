//
//  JCModel_inventoryWarningData.m
//
//  Created by   on 2018/10/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inventoryWarningData.h"
#import "JCModel_inventoryWarningPurchaserStores.h"


NSString *const kJCModel_inventoryWarningDataLeader = @"leader";
NSString *const kJCModel_inventoryWarningDataFranchiser = @"franchiser";
NSString *const kJCModel_inventoryWarningDataOrg = @"org";
NSString *const kJCModel_inventoryWarningDataId = @"id";
NSString *const kJCModel_inventoryWarningDataOrganization = @"organization";
NSString *const kJCModel_inventoryWarningDataPurchaserStores = @"purchaserStores";
NSString *const kJCModel_inventoryWarningDataDisGroup = @"disGroup";
NSString *const kJCModel_inventoryWarningDataType = @"type";
NSString *const kJCModel_inventoryWarningDataApplicant = @"applicant";
NSString *const kJCModel_inventoryWarningDataName = @"name";


@interface JCModel_inventoryWarningData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inventoryWarningData

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
            self.leader = [[self objectOrNilForKey:kJCModel_inventoryWarningDataLeader fromDictionary:dict] doubleValue];
            self.franchiser = [self objectOrNilForKey:kJCModel_inventoryWarningDataFranchiser fromDictionary:dict];
            self.org = [self objectOrNilForKey:kJCModel_inventoryWarningDataOrg fromDictionary:dict];
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_inventoryWarningDataId fromDictionary:dict];
            self.organization = [self objectOrNilForKey:kJCModel_inventoryWarningDataOrganization fromDictionary:dict];
    NSObject *receivedJCModel_inventoryWarningPurchaserStores = [dict objectForKey:kJCModel_inventoryWarningDataPurchaserStores];
    NSMutableArray *parsedJCModel_inventoryWarningPurchaserStores = [NSMutableArray array];
    
    if ([receivedJCModel_inventoryWarningPurchaserStores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_inventoryWarningPurchaserStores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_inventoryWarningPurchaserStores addObject:[JCModel_inventoryWarningPurchaserStores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_inventoryWarningPurchaserStores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_inventoryWarningPurchaserStores addObject:[JCModel_inventoryWarningPurchaserStores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_inventoryWarningPurchaserStores]];
    }

    self.purchaserStores = [NSArray arrayWithArray:parsedJCModel_inventoryWarningPurchaserStores];
            self.disGroup = [self objectOrNilForKey:kJCModel_inventoryWarningDataDisGroup fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_inventoryWarningDataType fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_inventoryWarningDataApplicant fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_inventoryWarningDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_inventoryWarningDataLeader];
    [mutableDict setValue:self.franchiser forKey:kJCModel_inventoryWarningDataFranchiser];
    [mutableDict setValue:self.org forKey:kJCModel_inventoryWarningDataOrg];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_inventoryWarningDataId];
    [mutableDict setValue:self.organization forKey:kJCModel_inventoryWarningDataOrganization];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPurchaserStores] forKey:kJCModel_inventoryWarningDataPurchaserStores];
    [mutableDict setValue:self.disGroup forKey:kJCModel_inventoryWarningDataDisGroup];
    [mutableDict setValue:self.type forKey:kJCModel_inventoryWarningDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_inventoryWarningDataApplicant];
    [mutableDict setValue:self.name forKey:kJCModel_inventoryWarningDataName];

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

    self.leader = [aDecoder decodeDoubleForKey:kJCModel_inventoryWarningDataLeader];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataFranchiser];
    self.org = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataOrg];
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataId];
    self.organization = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataOrganization];
    self.purchaserStores = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataPurchaserStores];
    self.disGroup = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataDisGroup];
    self.type = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataType];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_inventoryWarningDataApplicant];
    self.name = [aDecoder decodeObjectForKey:kJCModel_inventoryWarningDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_leader forKey:kJCModel_inventoryWarningDataLeader];
    [aCoder encodeObject:_franchiser forKey:kJCModel_inventoryWarningDataFranchiser];
    [aCoder encodeObject:_org forKey:kJCModel_inventoryWarningDataOrg];
    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_inventoryWarningDataId];
    [aCoder encodeObject:_organization forKey:kJCModel_inventoryWarningDataOrganization];
    [aCoder encodeObject:_purchaserStores forKey:kJCModel_inventoryWarningDataPurchaserStores];
    [aCoder encodeObject:_disGroup forKey:kJCModel_inventoryWarningDataDisGroup];
    [aCoder encodeObject:_type forKey:kJCModel_inventoryWarningDataType];
    [aCoder encodeDouble:_applicant forKey:kJCModel_inventoryWarningDataApplicant];
    [aCoder encodeObject:_name forKey:kJCModel_inventoryWarningDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inventoryWarningData *copy = [[JCModel_inventoryWarningData alloc] init];
    
    
    
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
