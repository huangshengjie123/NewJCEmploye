//
//  JCModel_CusWaterInfoData.m
//
//  Created by   on 2018/8/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CusWaterInfoData.h"
#import "JCModel_CusWaterInfoWaterCardItems.h"
#import "JCModel_CusWaterInfoCustomerAddresses.h"


NSString *const kJCModel_CusWaterInfoDataId = @"id";
NSString *const kJCModel_CusWaterInfoDataPhone = @"phone";
NSString *const kJCModel_CusWaterInfoDataMbPhone = @"mbPhone";
NSString *const kJCModel_CusWaterInfoDataCreater = @"creater";
NSString *const kJCModel_CusWaterInfoDataOwner = @"owner";
NSString *const kJCModel_CusWaterInfoDataStaffMbPhone = @"staffMbPhone";
NSString *const kJCModel_CusWaterInfoDataType = @"type";
NSString *const kJCModel_CusWaterInfoDataUowner = @"uowner";
NSString *const kJCModel_CusWaterInfoDataLevel = @"level";
NSString *const kJCModel_CusWaterInfoDataWaterCardRecords = @"waterCardRecords";
NSString *const kJCModel_CusWaterInfoDataWaterCardItems = @"waterCardItems";
NSString *const kJCModel_CusWaterInfoDataUsername = @"username";
NSString *const kJCModel_CusWaterInfoDataStaffName = @"staffName";
NSString *const kJCModel_CusWaterInfoDataCustomerAddresses = @"customerAddresses";


@interface JCModel_CusWaterInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CusWaterInfoData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize phone = _phone;
@synthesize mbPhone = _mbPhone;
@synthesize creater = _creater;
@synthesize owner = _owner;
@synthesize staffMbPhone = _staffMbPhone;
@synthesize type = _type;
@synthesize uowner = _uowner;
@synthesize level = _level;
@synthesize waterCardRecords = _waterCardRecords;
@synthesize waterCardItems = _waterCardItems;
@synthesize username = _username;
@synthesize staffName = _staffName;
@synthesize customerAddresses = _customerAddresses;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_CusWaterInfoDataId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_CusWaterInfoDataPhone fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_CusWaterInfoDataMbPhone fromDictionary:dict];
            self.creater = [self objectOrNilForKey:kJCModel_CusWaterInfoDataCreater fromDictionary:dict];
            self.owner = [[self objectOrNilForKey:kJCModel_CusWaterInfoDataOwner fromDictionary:dict] doubleValue];
            self.staffMbPhone = [self objectOrNilForKey:kJCModel_CusWaterInfoDataStaffMbPhone fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_CusWaterInfoDataType fromDictionary:dict] doubleValue];
            self.uowner = [self objectOrNilForKey:kJCModel_CusWaterInfoDataUowner fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kJCModel_CusWaterInfoDataLevel fromDictionary:dict] doubleValue];
            self.waterCardRecords = [self objectOrNilForKey:kJCModel_CusWaterInfoDataWaterCardRecords fromDictionary:dict];
    NSObject *receivedJCModel_CusWaterInfoWaterCardItems = [dict objectForKey:kJCModel_CusWaterInfoDataWaterCardItems];
    NSMutableArray *parsedJCModel_CusWaterInfoWaterCardItems = [NSMutableArray array];
    
    if ([receivedJCModel_CusWaterInfoWaterCardItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CusWaterInfoWaterCardItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CusWaterInfoWaterCardItems addObject:[JCModel_CusWaterInfoWaterCardItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CusWaterInfoWaterCardItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CusWaterInfoWaterCardItems addObject:[JCModel_CusWaterInfoWaterCardItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CusWaterInfoWaterCardItems]];
    }

    self.waterCardItems = [NSArray arrayWithArray:parsedJCModel_CusWaterInfoWaterCardItems];
            self.username = [self objectOrNilForKey:kJCModel_CusWaterInfoDataUsername fromDictionary:dict];
            self.staffName = [self objectOrNilForKey:kJCModel_CusWaterInfoDataStaffName fromDictionary:dict];
    NSObject *receivedJCModel_CusWaterInfoCustomerAddresses = [dict objectForKey:kJCModel_CusWaterInfoDataCustomerAddresses];
    NSMutableArray *parsedJCModel_CusWaterInfoCustomerAddresses = [NSMutableArray array];
    
    if ([receivedJCModel_CusWaterInfoCustomerAddresses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CusWaterInfoCustomerAddresses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CusWaterInfoCustomerAddresses addObject:[JCModel_CusWaterInfoCustomerAddresses modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CusWaterInfoCustomerAddresses isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CusWaterInfoCustomerAddresses addObject:[JCModel_CusWaterInfoCustomerAddresses modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CusWaterInfoCustomerAddresses]];
    }

    self.customerAddresses = [NSArray arrayWithArray:parsedJCModel_CusWaterInfoCustomerAddresses];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_CusWaterInfoDataId];
    [mutableDict setValue:self.phone forKey:kJCModel_CusWaterInfoDataPhone];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_CusWaterInfoDataMbPhone];
    [mutableDict setValue:self.creater forKey:kJCModel_CusWaterInfoDataCreater];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_CusWaterInfoDataOwner];
    [mutableDict setValue:self.staffMbPhone forKey:kJCModel_CusWaterInfoDataStaffMbPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_CusWaterInfoDataType];
    [mutableDict setValue:self.uowner forKey:kJCModel_CusWaterInfoDataUowner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_CusWaterInfoDataLevel];
    [mutableDict setValue:self.waterCardRecords forKey:kJCModel_CusWaterInfoDataWaterCardRecords];
    NSMutableArray *tempArrayForWaterCardItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.waterCardItems) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWaterCardItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWaterCardItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardItems] forKey:kJCModel_CusWaterInfoDataWaterCardItems];
    [mutableDict setValue:self.username forKey:kJCModel_CusWaterInfoDataUsername];
    [mutableDict setValue:self.staffName forKey:kJCModel_CusWaterInfoDataStaffName];
    NSMutableArray *tempArrayForCustomerAddresses = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.customerAddresses) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCustomerAddresses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCustomerAddresses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddresses] forKey:kJCModel_CusWaterInfoDataCustomerAddresses];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataPhone];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataMbPhone];
    self.creater = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataCreater];
    self.owner = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoDataOwner];
    self.staffMbPhone = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataStaffMbPhone];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoDataType];
    self.uowner = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataUowner];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_CusWaterInfoDataLevel];
    self.waterCardRecords = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataWaterCardRecords];
    self.waterCardItems = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataWaterCardItems];
    self.username = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataUsername];
    self.staffName = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataStaffName];
    self.customerAddresses = [aDecoder decodeObjectForKey:kJCModel_CusWaterInfoDataCustomerAddresses];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_CusWaterInfoDataId];
    [aCoder encodeObject:_phone forKey:kJCModel_CusWaterInfoDataPhone];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_CusWaterInfoDataMbPhone];
    [aCoder encodeObject:_creater forKey:kJCModel_CusWaterInfoDataCreater];
    [aCoder encodeDouble:_owner forKey:kJCModel_CusWaterInfoDataOwner];
    [aCoder encodeObject:_staffMbPhone forKey:kJCModel_CusWaterInfoDataStaffMbPhone];
    [aCoder encodeDouble:_type forKey:kJCModel_CusWaterInfoDataType];
    [aCoder encodeObject:_uowner forKey:kJCModel_CusWaterInfoDataUowner];
    [aCoder encodeDouble:_level forKey:kJCModel_CusWaterInfoDataLevel];
    [aCoder encodeObject:_waterCardRecords forKey:kJCModel_CusWaterInfoDataWaterCardRecords];
    [aCoder encodeObject:_waterCardItems forKey:kJCModel_CusWaterInfoDataWaterCardItems];
    [aCoder encodeObject:_username forKey:kJCModel_CusWaterInfoDataUsername];
    [aCoder encodeObject:_staffName forKey:kJCModel_CusWaterInfoDataStaffName];
    [aCoder encodeObject:_customerAddresses forKey:kJCModel_CusWaterInfoDataCustomerAddresses];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CusWaterInfoData *copy = [[JCModel_CusWaterInfoData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.creater = [self.creater copyWithZone:zone];
        copy.owner = self.owner;
        copy.staffMbPhone = [self.staffMbPhone copyWithZone:zone];
        copy.type = self.type;
        copy.uowner = [self.uowner copyWithZone:zone];
        copy.level = self.level;
        copy.waterCardRecords = [self.waterCardRecords copyWithZone:zone];
        copy.waterCardItems = [self.waterCardItems copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.staffName = [self.staffName copyWithZone:zone];
        copy.customerAddresses = [self.customerAddresses copyWithZone:zone];
    }
    
    return copy;
}


@end
