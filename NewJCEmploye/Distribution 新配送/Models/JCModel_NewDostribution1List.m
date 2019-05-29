//
//  JCModel_NewDostribution1List.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1List.h"
#import "JCModel_NewDostribution1Customer.h"
#import "JCModel_NewDostribution1Items.h"
#import "JCModel_NewDostribution1Cars.h"


NSString *const kJCModel_NewDostribution1ListId = @"id";
NSString *const kJCModel_NewDostribution1ListStaff = @"staff";
NSString *const kJCModel_NewDostribution1ListProcessId = @"processId";
NSString *const kJCModel_NewDostribution1ListLeader = @"leader";
NSString *const kJCModel_NewDostribution1ListAddrId = @"addrId";
NSString *const kJCModel_NewDostribution1ListCustomer = @"customer";
NSString *const kJCModel_NewDostribution1ListCom = @"com";
NSString *const kJCModel_NewDostribution1ListUserExtInfo = @"userExtInfo";
NSString *const kJCModel_NewDostribution1ListComment = @"comment";
NSString *const kJCModel_NewDostribution1ListCarId = @"carId";
NSString *const kJCModel_NewDostribution1ListCreateTime = @"createTime";
NSString *const kJCModel_NewDostribution1ListItems = @"items";
NSString *const kJCModel_NewDostribution1ListCardId = @"cardId";
NSString *const kJCModel_NewDostribution1ListCars = @"cars";
NSString *const kJCModel_NewDostribution1ListStatus = @"status";
NSString *const kJCModel_NewDostribution1ListCusId = @"cusId";


@interface JCModel_NewDostribution1List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1List

@synthesize listIdentifier = _listIdentifier;
@synthesize staff = _staff;
@synthesize processId = _processId;
@synthesize leader = _leader;
@synthesize addrId = _addrId;
@synthesize customer = _customer;
@synthesize com = _com;
@synthesize userExtInfo = _userExtInfo;
@synthesize comment = _comment;
@synthesize carId = _carId;
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
            self.listIdentifier = [self objectOrNilForKey:kJCModel_NewDostribution1ListId fromDictionary:dict];
            self.staff = [[self objectOrNilForKey:kJCModel_NewDostribution1ListStaff fromDictionary:dict] doubleValue];
            self.processId = [self objectOrNilForKey:kJCModel_NewDostribution1ListProcessId fromDictionary:dict];
            self.leader = [[self objectOrNilForKey:kJCModel_NewDostribution1ListLeader fromDictionary:dict] doubleValue];
            self.addrId = [[self objectOrNilForKey:kJCModel_NewDostribution1ListAddrId fromDictionary:dict] doubleValue];
            self.customer = [JCModel_NewDostribution1Customer modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDostribution1ListCustomer]];
            self.com = [self objectOrNilForKey:kJCModel_NewDostribution1ListCom fromDictionary:dict];
            self.userExtInfo = [self objectOrNilForKey:kJCModel_NewDostribution1ListUserExtInfo fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_NewDostribution1ListComment fromDictionary:dict];
            self.carId = [[self objectOrNilForKey:kJCModel_NewDostribution1ListCarId fromDictionary:dict] doubleValue];
            self.createTime = [self objectOrNilForKey:kJCModel_NewDostribution1ListCreateTime fromDictionary:dict];
    NSObject *receivedJCModel_NewDostribution1Items = [dict objectForKey:kJCModel_NewDostribution1ListItems];
    NSMutableArray *parsedJCModel_NewDostribution1Items = [NSMutableArray array];
    
    if ([receivedJCModel_NewDostribution1Items isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDostribution1Items) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDostribution1Items addObject:[JCModel_NewDostribution1Items modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDostribution1Items isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDostribution1Items addObject:[JCModel_NewDostribution1Items modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDostribution1Items]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_NewDostribution1Items];
            self.cardId = [self objectOrNilForKey:kJCModel_NewDostribution1ListCardId fromDictionary:dict];
            self.cars = [JCModel_NewDostribution1Cars modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDostribution1ListCars]];
            self.status = [self objectOrNilForKey:kJCModel_NewDostribution1ListStatus fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_NewDostribution1ListCusId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_NewDostribution1ListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.staff] forKey:kJCModel_NewDostribution1ListStaff];
    [mutableDict setValue:self.processId forKey:kJCModel_NewDostribution1ListProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.leader] forKey:kJCModel_NewDostribution1ListLeader];
    [mutableDict setValue:[NSNumber numberWithDouble:self.addrId] forKey:kJCModel_NewDostribution1ListAddrId];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_NewDostribution1ListCustomer];
    [mutableDict setValue:self.com forKey:kJCModel_NewDostribution1ListCom];
    [mutableDict setValue:self.userExtInfo forKey:kJCModel_NewDostribution1ListUserExtInfo];
    [mutableDict setValue:self.comment forKey:kJCModel_NewDostribution1ListComment];
    [mutableDict setValue:[NSNumber numberWithDouble:self.carId] forKey:kJCModel_NewDostribution1ListCarId];
    [mutableDict setValue:self.createTime forKey:kJCModel_NewDostribution1ListCreateTime];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_NewDostribution1ListItems];
    [mutableDict setValue:self.cardId forKey:kJCModel_NewDostribution1ListCardId];
    [mutableDict setValue:[self.cars dictionaryRepresentation] forKey:kJCModel_NewDostribution1ListCars];
    [mutableDict setValue:self.status forKey:kJCModel_NewDostribution1ListStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_NewDostribution1ListCusId];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListId];
    self.staff = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ListStaff];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListProcessId];
    self.leader = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ListLeader];
    self.addrId = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ListAddrId];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListCustomer];
    self.com = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListCom];
    self.userExtInfo = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListUserExtInfo];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListComment];
    self.carId = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ListCarId];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListCreateTime];
    self.items = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListItems];
    self.cardId = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListCardId];
    self.cars = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListCars];
    self.status = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1ListStatus];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1ListCusId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_NewDostribution1ListId];
    [aCoder encodeDouble:_staff forKey:kJCModel_NewDostribution1ListStaff];
    [aCoder encodeObject:_processId forKey:kJCModel_NewDostribution1ListProcessId];
    [aCoder encodeDouble:_leader forKey:kJCModel_NewDostribution1ListLeader];
    [aCoder encodeDouble:_addrId forKey:kJCModel_NewDostribution1ListAddrId];
    [aCoder encodeObject:_customer forKey:kJCModel_NewDostribution1ListCustomer];
    [aCoder encodeObject:_com forKey:kJCModel_NewDostribution1ListCom];
    [aCoder encodeObject:_userExtInfo forKey:kJCModel_NewDostribution1ListUserExtInfo];
    [aCoder encodeObject:_comment forKey:kJCModel_NewDostribution1ListComment];
    [aCoder encodeDouble:_carId forKey:kJCModel_NewDostribution1ListCarId];
    [aCoder encodeObject:_createTime forKey:kJCModel_NewDostribution1ListCreateTime];
    [aCoder encodeObject:_items forKey:kJCModel_NewDostribution1ListItems];
    [aCoder encodeObject:_cardId forKey:kJCModel_NewDostribution1ListCardId];
    [aCoder encodeObject:_cars forKey:kJCModel_NewDostribution1ListCars];
    [aCoder encodeObject:_status forKey:kJCModel_NewDostribution1ListStatus];
    [aCoder encodeDouble:_cusId forKey:kJCModel_NewDostribution1ListCusId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1List *copy = [[JCModel_NewDostribution1List alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.staff = self.staff;
        copy.processId = [self.processId copyWithZone:zone];
        copy.leader = self.leader;
        copy.addrId = self.addrId;
        copy.customer = [self.customer copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.userExtInfo = [self.userExtInfo copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.carId = self.carId;
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
