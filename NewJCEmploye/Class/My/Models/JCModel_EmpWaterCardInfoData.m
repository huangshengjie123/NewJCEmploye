//
//  JCModel_EmpWaterCardInfoData.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpWaterCardInfoData.h"
#import "JCModel_EmpWaterCardInfoWaterCardItems.h"


NSString *const kJCModel_EmpWaterCardInfoDataId = @"id";
NSString *const kJCModel_EmpWaterCardInfoDataPhone = @"phone";
NSString *const kJCModel_EmpWaterCardInfoDataMbPhone = @"mbPhone";
NSString *const kJCModel_EmpWaterCardInfoDataCreater = @"creater";
NSString *const kJCModel_EmpWaterCardInfoDataOwner = @"owner";
NSString *const kJCModel_EmpWaterCardInfoDataStaffMbPhone = @"staffMbPhone";
NSString *const kJCModel_EmpWaterCardInfoDataType = @"type";
NSString *const kJCModel_EmpWaterCardInfoDataUowner = @"uowner";
NSString *const kJCModel_EmpWaterCardInfoDataLevel = @"level";
NSString *const kJCModel_EmpWaterCardInfoDataWaterCardRecords = @"waterCardRecords";
NSString *const kJCModel_EmpWaterCardInfoDataWaterCardItems = @"waterCardItems";
NSString *const kJCModel_EmpWaterCardInfoDataUsername = @"username";
NSString *const kJCModel_EmpWaterCardInfoDataStaffName = @"staffName";
NSString *const kJCModel_EmpWaterCardInfoDataCustomerAddresses = @"customerAddresses";


@interface JCModel_EmpWaterCardInfoData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpWaterCardInfoData

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
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataPhone fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataMbPhone fromDictionary:dict];
            self.creater = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataCreater fromDictionary:dict];
            self.owner = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataOwner fromDictionary:dict];
            self.staffMbPhone = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataStaffMbPhone fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataType fromDictionary:dict] doubleValue];
            self.uowner = [[self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataUowner fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataLevel fromDictionary:dict] doubleValue];
            self.waterCardRecords = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataWaterCardRecords fromDictionary:dict];
    NSObject *receivedJCModel_EmpWaterCardInfoWaterCardItems = [dict objectForKey:kJCModel_EmpWaterCardInfoDataWaterCardItems];
    NSMutableArray *parsedJCModel_EmpWaterCardInfoWaterCardItems = [NSMutableArray array];
    
    if ([receivedJCModel_EmpWaterCardInfoWaterCardItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_EmpWaterCardInfoWaterCardItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_EmpWaterCardInfoWaterCardItems addObject:[JCModel_EmpWaterCardInfoWaterCardItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_EmpWaterCardInfoWaterCardItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_EmpWaterCardInfoWaterCardItems addObject:[JCModel_EmpWaterCardInfoWaterCardItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_EmpWaterCardInfoWaterCardItems]];
    }

    self.waterCardItems = [NSArray arrayWithArray:parsedJCModel_EmpWaterCardInfoWaterCardItems];
            self.username = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataUsername fromDictionary:dict];
            self.staffName = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataStaffName fromDictionary:dict];
            self.customerAddresses = [self objectOrNilForKey:kJCModel_EmpWaterCardInfoDataCustomerAddresses fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_EmpWaterCardInfoDataId];
    [mutableDict setValue:self.phone forKey:kJCModel_EmpWaterCardInfoDataPhone];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_EmpWaterCardInfoDataMbPhone];
    [mutableDict setValue:self.creater forKey:kJCModel_EmpWaterCardInfoDataCreater];
    [mutableDict setValue:self.owner forKey:kJCModel_EmpWaterCardInfoDataOwner];
    [mutableDict setValue:self.staffMbPhone forKey:kJCModel_EmpWaterCardInfoDataStaffMbPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_EmpWaterCardInfoDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uowner] forKey:kJCModel_EmpWaterCardInfoDataUowner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_EmpWaterCardInfoDataLevel];
    [mutableDict setValue:self.waterCardRecords forKey:kJCModel_EmpWaterCardInfoDataWaterCardRecords];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardItems] forKey:kJCModel_EmpWaterCardInfoDataWaterCardItems];
    [mutableDict setValue:self.username forKey:kJCModel_EmpWaterCardInfoDataUsername];
    [mutableDict setValue:self.staffName forKey:kJCModel_EmpWaterCardInfoDataStaffName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddresses] forKey:kJCModel_EmpWaterCardInfoDataCustomerAddresses];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataPhone];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataMbPhone];
    self.creater = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataCreater];
    self.owner = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataOwner];
    self.staffMbPhone = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataStaffMbPhone];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_EmpWaterCardInfoDataType];
    self.uowner = [aDecoder decodeDoubleForKey:kJCModel_EmpWaterCardInfoDataUowner];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_EmpWaterCardInfoDataLevel];
    self.waterCardRecords = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataWaterCardRecords];
    self.waterCardItems = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataWaterCardItems];
    self.username = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataUsername];
    self.staffName = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataStaffName];
    self.customerAddresses = [aDecoder decodeObjectForKey:kJCModel_EmpWaterCardInfoDataCustomerAddresses];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_EmpWaterCardInfoDataId];
    [aCoder encodeObject:_phone forKey:kJCModel_EmpWaterCardInfoDataPhone];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_EmpWaterCardInfoDataMbPhone];
    [aCoder encodeObject:_creater forKey:kJCModel_EmpWaterCardInfoDataCreater];
    [aCoder encodeObject:_owner forKey:kJCModel_EmpWaterCardInfoDataOwner];
    [aCoder encodeObject:_staffMbPhone forKey:kJCModel_EmpWaterCardInfoDataStaffMbPhone];
    [aCoder encodeDouble:_type forKey:kJCModel_EmpWaterCardInfoDataType];
    [aCoder encodeDouble:_uowner forKey:kJCModel_EmpWaterCardInfoDataUowner];
    [aCoder encodeDouble:_level forKey:kJCModel_EmpWaterCardInfoDataLevel];
    [aCoder encodeObject:_waterCardRecords forKey:kJCModel_EmpWaterCardInfoDataWaterCardRecords];
    [aCoder encodeObject:_waterCardItems forKey:kJCModel_EmpWaterCardInfoDataWaterCardItems];
    [aCoder encodeObject:_username forKey:kJCModel_EmpWaterCardInfoDataUsername];
    [aCoder encodeObject:_staffName forKey:kJCModel_EmpWaterCardInfoDataStaffName];
    [aCoder encodeObject:_customerAddresses forKey:kJCModel_EmpWaterCardInfoDataCustomerAddresses];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpWaterCardInfoData *copy = [[JCModel_EmpWaterCardInfoData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.creater = [self.creater copyWithZone:zone];
        copy.owner = [self.owner copyWithZone:zone];
        copy.staffMbPhone = [self.staffMbPhone copyWithZone:zone];
        copy.type = self.type;
        copy.uowner = self.uowner;
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
