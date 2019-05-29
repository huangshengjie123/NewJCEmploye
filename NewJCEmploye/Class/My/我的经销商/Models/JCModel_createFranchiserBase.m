//
//  JCModel_createFranchiserBase.m
//
//  Created by   on 2018/9/19
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_createFranchiserBase.h"
#import "JCModel_createFranchiserStores.h"


NSString *const kJCModel_createFranchiserBaseStores = @"stores";
NSString *const kJCModel_createFranchiserBasePhone = @"phone";
NSString *const kJCModel_createFranchiserBaseAreaId = @"areaId";
NSString *const kJCModel_createFranchiserBaseAddress = @"address";
NSString *const kJCModel_createFranchiserBaseGuide = @"guide";
NSString *const kJCModel_createFranchiserBaseCom = @"com";
NSString *const kJCModel_createFranchiserBaseType = @"type";
NSString *const kJCModel_createFranchiserBaseName = @"name";
NSString *const kJCModel_createFranchiserBaseBalance = @"balance";


@interface JCModel_createFranchiserBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_createFranchiserBase

@synthesize stores = _stores;
@synthesize phone = _phone;
@synthesize areaId = _areaId;
@synthesize address = _address;
@synthesize guide = _guide;
@synthesize com = _com;
@synthesize type = _type;
@synthesize name = _name;
@synthesize balance = _balance;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedJCModel_createFranchiserStores = [dict objectForKey:kJCModel_createFranchiserBaseStores];
    NSMutableArray *parsedJCModel_createFranchiserStores = [NSMutableArray array];
    
    if ([receivedJCModel_createFranchiserStores isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_createFranchiserStores) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_createFranchiserStores addObject:[JCModel_createFranchiserStores modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_createFranchiserStores isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_createFranchiserStores addObject:[JCModel_createFranchiserStores modelObjectWithDictionary:(NSDictionary *)receivedJCModel_createFranchiserStores]];
    }

    self.stores = [NSArray arrayWithArray:parsedJCModel_createFranchiserStores];
            self.phone = [self objectOrNilForKey:kJCModel_createFranchiserBasePhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_createFranchiserBaseAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_createFranchiserBaseAddress fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_createFranchiserBaseGuide fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_createFranchiserBaseCom fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_createFranchiserBaseType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_createFranchiserBaseName fromDictionary:dict];
            self.balance = [[self objectOrNilForKey:kJCModel_createFranchiserBaseBalance fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForStores = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.stores) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStores addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStores addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStores] forKey:kJCModel_createFranchiserBaseStores];
    [mutableDict setValue:self.phone forKey:kJCModel_createFranchiserBasePhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_createFranchiserBaseAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_createFranchiserBaseAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_createFranchiserBaseGuide];
    [mutableDict setValue:self.com forKey:kJCModel_createFranchiserBaseCom];
    [mutableDict setValue:self.type forKey:kJCModel_createFranchiserBaseType];
    [mutableDict setValue:self.name forKey:kJCModel_createFranchiserBaseName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.balance] forKey:kJCModel_createFranchiserBaseBalance];

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

    self.stores = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBaseStores];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBasePhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBaseAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBaseAddress];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_createFranchiserBaseGuide];
    self.com = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBaseCom];
    self.type = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBaseType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_createFranchiserBaseName];
    self.balance = [aDecoder decodeDoubleForKey:kJCModel_createFranchiserBaseBalance];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_stores forKey:kJCModel_createFranchiserBaseStores];
    [aCoder encodeObject:_phone forKey:kJCModel_createFranchiserBasePhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_createFranchiserBaseAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_createFranchiserBaseAddress];
    [aCoder encodeDouble:_guide forKey:kJCModel_createFranchiserBaseGuide];
    [aCoder encodeObject:_com forKey:kJCModel_createFranchiserBaseCom];
    [aCoder encodeObject:_type forKey:kJCModel_createFranchiserBaseType];
    [aCoder encodeObject:_name forKey:kJCModel_createFranchiserBaseName];
    [aCoder encodeDouble:_balance forKey:kJCModel_createFranchiserBaseBalance];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_createFranchiserBase *copy = [[JCModel_createFranchiserBase alloc] init];
    
    
    
    if (copy) {

        copy.stores = [self.stores copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.guide = self.guide;
        copy.com = [self.com copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.balance = self.balance;
    }
    
    return copy;
}


@end
