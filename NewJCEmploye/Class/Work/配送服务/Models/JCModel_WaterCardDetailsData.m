//
//  JCModel_WaterCardDetailsData.m
//
//  Created by   on 2018/7/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WaterCardDetailsData.h"
#import "JCModel_WaterCardDetailsWaterCardItems.h"
#import "JCModel_WaterCardDetailsCustomerAddresses.h"


NSString *const kJCModel_WaterCardDetailsDataId = @"id";
NSString *const kJCModel_WaterCardDetailsDataPhone = @"phone";
NSString *const kJCModel_WaterCardDetailsDataMbPhone = @"mbPhone";
NSString *const kJCModel_WaterCardDetailsDataCreater = @"creater";
NSString *const kJCModel_WaterCardDetailsDataOwner = @"owner";
NSString *const kJCModel_WaterCardDetailsDataStaffMbPhone = @"staffMbPhone";
NSString *const kJCModel_WaterCardDetailsDataType = @"type";
NSString *const kJCModel_WaterCardDetailsDataUowner = @"uowner";
NSString *const kJCModel_WaterCardDetailsDataLevel = @"level";
NSString *const kJCModel_WaterCardDetailsDataWaterCardRecords = @"waterCardRecords";
NSString *const kJCModel_WaterCardDetailsDataWaterCardItems = @"waterCardItems";
NSString *const kJCModel_WaterCardDetailsDataUsername = @"username";
NSString *const kJCModel_WaterCardDetailsDataStaffName = @"staffName";
NSString *const kJCModel_WaterCardDetailsDataCustomerAddresses = @"customerAddresses";


@interface JCModel_WaterCardDetailsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WaterCardDetailsData

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
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataPhone fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataMbPhone fromDictionary:dict];
            self.creater = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataCreater fromDictionary:dict];
            self.owner = [[self objectOrNilForKey:kJCModel_WaterCardDetailsDataOwner fromDictionary:dict] doubleValue];
            self.staffMbPhone = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataStaffMbPhone fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_WaterCardDetailsDataType fromDictionary:dict] doubleValue];
            self.uowner = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataUowner fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kJCModel_WaterCardDetailsDataLevel fromDictionary:dict] doubleValue];
            self.waterCardRecords = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataWaterCardRecords fromDictionary:dict];
    NSObject *receivedJCModel_WaterCardDetailsWaterCardItems = [dict objectForKey:kJCModel_WaterCardDetailsDataWaterCardItems];
    NSMutableArray *parsedJCModel_WaterCardDetailsWaterCardItems = [NSMutableArray array];
    
    if ([receivedJCModel_WaterCardDetailsWaterCardItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterCardDetailsWaterCardItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterCardDetailsWaterCardItems addObject:[JCModel_WaterCardDetailsWaterCardItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterCardDetailsWaterCardItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterCardDetailsWaterCardItems addObject:[JCModel_WaterCardDetailsWaterCardItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterCardDetailsWaterCardItems]];
    }

    self.waterCardItems = [NSArray arrayWithArray:parsedJCModel_WaterCardDetailsWaterCardItems];
            self.username = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataUsername fromDictionary:dict];
            self.staffName = [self objectOrNilForKey:kJCModel_WaterCardDetailsDataStaffName fromDictionary:dict];
    NSObject *receivedJCModel_WaterCardDetailsCustomerAddresses = [dict objectForKey:kJCModel_WaterCardDetailsDataCustomerAddresses];
    NSMutableArray *parsedJCModel_WaterCardDetailsCustomerAddresses = [NSMutableArray array];
    
    if ([receivedJCModel_WaterCardDetailsCustomerAddresses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_WaterCardDetailsCustomerAddresses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_WaterCardDetailsCustomerAddresses addObject:[JCModel_WaterCardDetailsCustomerAddresses modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_WaterCardDetailsCustomerAddresses isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_WaterCardDetailsCustomerAddresses addObject:[JCModel_WaterCardDetailsCustomerAddresses modelObjectWithDictionary:(NSDictionary *)receivedJCModel_WaterCardDetailsCustomerAddresses]];
    }

    self.customerAddresses = [NSArray arrayWithArray:parsedJCModel_WaterCardDetailsCustomerAddresses];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_WaterCardDetailsDataId];
    [mutableDict setValue:self.phone forKey:kJCModel_WaterCardDetailsDataPhone];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_WaterCardDetailsDataMbPhone];
    [mutableDict setValue:self.creater forKey:kJCModel_WaterCardDetailsDataCreater];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_WaterCardDetailsDataOwner];
    [mutableDict setValue:self.staffMbPhone forKey:kJCModel_WaterCardDetailsDataStaffMbPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_WaterCardDetailsDataType];
    [mutableDict setValue:self.uowner forKey:kJCModel_WaterCardDetailsDataUowner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_WaterCardDetailsDataLevel];
    [mutableDict setValue:self.waterCardRecords forKey:kJCModel_WaterCardDetailsDataWaterCardRecords];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardItems] forKey:kJCModel_WaterCardDetailsDataWaterCardItems];
    [mutableDict setValue:self.username forKey:kJCModel_WaterCardDetailsDataUsername];
    [mutableDict setValue:self.staffName forKey:kJCModel_WaterCardDetailsDataStaffName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddresses] forKey:kJCModel_WaterCardDetailsDataCustomerAddresses];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataPhone];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataMbPhone];
    self.creater = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataCreater];
    self.owner = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsDataOwner];
    self.staffMbPhone = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataStaffMbPhone];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsDataType];
    self.uowner = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataUowner];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_WaterCardDetailsDataLevel];
    self.waterCardRecords = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataWaterCardRecords];
    self.waterCardItems = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataWaterCardItems];
    self.username = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataUsername];
    self.staffName = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataStaffName];
    self.customerAddresses = [aDecoder decodeObjectForKey:kJCModel_WaterCardDetailsDataCustomerAddresses];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_WaterCardDetailsDataId];
    [aCoder encodeObject:_phone forKey:kJCModel_WaterCardDetailsDataPhone];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_WaterCardDetailsDataMbPhone];
    [aCoder encodeObject:_creater forKey:kJCModel_WaterCardDetailsDataCreater];
    [aCoder encodeDouble:_owner forKey:kJCModel_WaterCardDetailsDataOwner];
    [aCoder encodeObject:_staffMbPhone forKey:kJCModel_WaterCardDetailsDataStaffMbPhone];
    [aCoder encodeDouble:_type forKey:kJCModel_WaterCardDetailsDataType];
    [aCoder encodeObject:_uowner forKey:kJCModel_WaterCardDetailsDataUowner];
    [aCoder encodeDouble:_level forKey:kJCModel_WaterCardDetailsDataLevel];
    [aCoder encodeObject:_waterCardRecords forKey:kJCModel_WaterCardDetailsDataWaterCardRecords];
    [aCoder encodeObject:_waterCardItems forKey:kJCModel_WaterCardDetailsDataWaterCardItems];
    [aCoder encodeObject:_username forKey:kJCModel_WaterCardDetailsDataUsername];
    [aCoder encodeObject:_staffName forKey:kJCModel_WaterCardDetailsDataStaffName];
    [aCoder encodeObject:_customerAddresses forKey:kJCModel_WaterCardDetailsDataCustomerAddresses];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WaterCardDetailsData *copy = [[JCModel_WaterCardDetailsData alloc] init];
    
    
    
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
