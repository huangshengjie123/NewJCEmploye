//
//  JCModel_NewDistributionCarDetailsData.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsData.h"
#import "JCModel_NewDistributionCarDetailsCustomer.h"
#import "JCModel_NewDistributionCarDetailsItems.h"
#import "JCModel_NewDistributionCarDetailsCars.h"


NSString *const kJCModel_NewDistributionCarDetailsDataId = @"id";
NSString *const kJCModel_NewDistributionCarDetailsDataStaff = @"staff";
NSString *const kJCModel_NewDistributionCarDetailsDataProcessId = @"processId";
NSString *const kJCModel_NewDistributionCarDetailsDataLeader = @"leader";
NSString *const kJCModel_NewDistributionCarDetailsDataAddrId = @"addrId";
NSString *const kJCModel_NewDistributionCarDetailsDataCustomer = @"customer";
NSString *const kJCModel_NewDistributionCarDetailsDataCom = @"com";
NSString *const kJCModel_NewDistributionCarDetailsDataUserExtInfo = @"userExtInfo";
NSString *const kJCModel_NewDistributionCarDetailsDataComment = @"comment";
NSString *const kJCModel_NewDistributionCarDetailsDataCarId = @"carId";
NSString *const kJCModel_NewDistributionCarDetailsDataTag = @"tag";
NSString *const kJCModel_NewDistributionCarDetailsDataCreateTime = @"createTime";
NSString *const kJCModel_NewDistributionCarDetailsDataItems = @"items";
NSString *const kJCModel_NewDistributionCarDetailsDataCardId = @"cardId";
NSString *const kJCModel_NewDistributionCarDetailsDataCars = @"cars";
NSString *const kJCModel_NewDistributionCarDetailsDataStatus = @"status";
NSString *const kJCModel_NewDistributionCarDetailsDataCusId = @"cusId";


@interface JCModel_NewDistributionCarDetailsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize staff = _staff;
@synthesize processId = _processId;
@synthesize leader = _leader;
@synthesize addrId = _addrId;
@synthesize customer = _customer;
@synthesize com = _com;
@synthesize userExtInfo = _userExtInfo;
@synthesize comment = _comment;
@synthesize carId = _carId;
@synthesize tag = _tag;
@synthesize createTime = _createTime;
@synthesize items = _items;
@synthesize cardId = _cardId;
@synthesize cars = _cars;
@synthesize status = _status;
@synthesize cusId = _cusId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataId fromDictionary:dict];
            self.staff = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataStaff fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataProcessId fromDictionary:dict];
            self.leader = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataLeader fromDictionary:dict] doubleValue];
            self.addrId = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataAddrId fromDictionary:dict] doubleValue];
            self.customer = [JCModel_NewDistributionCarDetailsCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDistributionCarDetailsDataCustomer]];
            self.com = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataCom fromDictionary:dict];
            self.userExtInfo = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataUserExtInfo fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataComment fromDictionary:dict];
            self.carId = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataCarId fromDictionary:dict] doubleValue];
            self.tag = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataTag fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_NewDistributionCarDetailsItems = [dict objectForKey:kJCModel_NewDistributionCarDetailsDataItems];
    NSMutableArray *parsedJCModel_NewDistributionCarDetailsItems = [NSMutableArray array];
    
    if ([receivedJCModel_NewDistributionCarDetailsItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDistributionCarDetailsItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDistributionCarDetailsItems addObject:[JCModel_NewDistributionCarDetailsItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDistributionCarDetailsItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDistributionCarDetailsItems addObject:[JCModel_NewDistributionCarDetailsItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDistributionCarDetailsItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_NewDistributionCarDetailsItems];
            self.cardId = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataCardId fromDictionary:dict];
            self.cars = [JCModel_NewDistributionCarDetailsCars modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDistributionCarDetailsDataCars]];
            self.status = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataStatus fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsDataCusId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_NewDistributionCarDetailsDataId];
    [mutableDict setValue:self.staff forKey:kJCModel_NewDistributionCarDetailsDataStaff];
    [mutableDict setValue:self.processId forKey:kJCModel_NewDistributionCarDetailsDataProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_NewDistributionCarDetailsDataLeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addrId] forKey:kJCModel_NewDistributionCarDetailsDataAddrId];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_NewDistributionCarDetailsDataCustomer];
    [mutableDict setValue:self.com forKey:kJCModel_NewDistributionCarDetailsDataCom];
    [mutableDict setValue:self.userExtInfo forKey:kJCModel_NewDistributionCarDetailsDataUserExtInfo];
    [mutableDict setValue:self.comment forKey:kJCModel_NewDistributionCarDetailsDataComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.carId] forKey:kJCModel_NewDistributionCarDetailsDataCarId];
    [mutableDict setValue:self.tag forKey:kJCModel_NewDistributionCarDetailsDataTag];
    [mutableDict setValue:self.createTime forKey:kJCModel_NewDistributionCarDetailsDataCreateTime];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_NewDistributionCarDetailsDataItems];
    [mutableDict setValue:self.cardId forKey:kJCModel_NewDistributionCarDetailsDataCardId];
    [mutableDict setValue:[self.cars dictionaryRepresentation] forKey:kJCModel_NewDistributionCarDetailsDataCars];
    [mutableDict setValue:self.status forKey:kJCModel_NewDistributionCarDetailsDataStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_NewDistributionCarDetailsDataCusId];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataId];
    self.staff = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataStaff];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataProcessId];
    self.leader = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsDataLeader];
    self.addrId = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsDataAddrId];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataCustomer];
    self.com = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataCom];
    self.userExtInfo = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataUserExtInfo];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataComment];
    self.carId = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsDataCarId];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataTag];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataItems];
    self.cardId = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataCardId];
    self.cars = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataCars];
    self.status = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsDataStatus];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsDataCusId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_NewDistributionCarDetailsDataId];
    [aCoder encodeObject:_staff forKey:kJCModel_NewDistributionCarDetailsDataStaff];
    [aCoder encodeObject:_processId forKey:kJCModel_NewDistributionCarDetailsDataProcessId];
    [aCoder encodeDouble:_leader forKey:kJCModel_NewDistributionCarDetailsDataLeader];
    [aCoder encodeDouble:_addrId forKey:kJCModel_NewDistributionCarDetailsDataAddrId];
    [aCoder encodeObject:_customer forKey:kJCModel_NewDistributionCarDetailsDataCustomer];
    [aCoder encodeObject:_com forKey:kJCModel_NewDistributionCarDetailsDataCom];
    [aCoder encodeObject:_userExtInfo forKey:kJCModel_NewDistributionCarDetailsDataUserExtInfo];
    [aCoder encodeObject:_comment forKey:kJCModel_NewDistributionCarDetailsDataComment];
    [aCoder encodeDouble:_carId forKey:kJCModel_NewDistributionCarDetailsDataCarId];
    [aCoder encodeObject:_tag forKey:kJCModel_NewDistributionCarDetailsDataTag];
    [aCoder encodeObject:_createTime forKey:kJCModel_NewDistributionCarDetailsDataCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_NewDistributionCarDetailsDataItems];
    [aCoder encodeObject:_cardId forKey:kJCModel_NewDistributionCarDetailsDataCardId];
    [aCoder encodeObject:_cars forKey:kJCModel_NewDistributionCarDetailsDataCars];
    [aCoder encodeObject:_status forKey:kJCModel_NewDistributionCarDetailsDataStatus];
    [aCoder encodeDouble:_cusId forKey:kJCModel_NewDistributionCarDetailsDataCusId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsData *copy = [[JCModel_NewDistributionCarDetailsData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.staff = [self.staff copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.leader = self.leader;
        copy.addrId = self.addrId;
        copy.customer = [self.customer copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.userExtInfo = [self.userExtInfo copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.carId = self.carId;
        copy.tag = [self.tag copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.cardId = [self.cardId copyWithZone:zone];
        copy.cars = [self.cars copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.cusId = self.cusId;
    }
    
    return copy;
}


@end
