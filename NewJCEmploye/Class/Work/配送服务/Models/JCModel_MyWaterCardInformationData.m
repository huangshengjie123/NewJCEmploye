//
//  JCModel_MyWaterCardInformationData.m
//
//  Created by   on 2018/7/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyWaterCardInformationData.h"
#import "JCModel_MyWaterCardInformationWaterCardItems.h"


NSString *const kJCModel_MyWaterCardInformationDataId = @"id";
NSString *const kJCModel_MyWaterCardInformationDataPhone = @"phone";
NSString *const kJCModel_MyWaterCardInformationDataMbPhone = @"mbPhone";
NSString *const kJCModel_MyWaterCardInformationDataCreater = @"creater";
NSString *const kJCModel_MyWaterCardInformationDataOwner = @"owner";
NSString *const kJCModel_MyWaterCardInformationDataStaffMbPhone = @"staffMbPhone";
NSString *const kJCModel_MyWaterCardInformationDataType = @"type";
NSString *const kJCModel_MyWaterCardInformationDataUowner = @"uowner";
NSString *const kJCModel_MyWaterCardInformationDataLevel = @"level";
NSString *const kJCModel_MyWaterCardInformationDataWaterCardRecords = @"waterCardRecords";
NSString *const kJCModel_MyWaterCardInformationDataWaterCardItems = @"waterCardItems";
NSString *const kJCModel_MyWaterCardInformationDataUsername = @"username";
NSString *const kJCModel_MyWaterCardInformationDataStaffName = @"staffName";
NSString *const kJCModel_MyWaterCardInformationDataCustomerAddresses = @"customerAddresses";


@interface JCModel_MyWaterCardInformationData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyWaterCardInformationData

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
    
    
    if (self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.dataIdentifier = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataId fromDictionary:dict];
        self.phone = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataPhone fromDictionary:dict];
        self.mbPhone = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataMbPhone fromDictionary:dict];
        self.creater = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataCreater fromDictionary:dict];
        self.owner = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataOwner fromDictionary:dict];
        self.staffMbPhone = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataStaffMbPhone fromDictionary:dict];
        self.type = [[self objectOrNilForKey:kJCModel_MyWaterCardInformationDataType fromDictionary:dict] doubleValue];
        self.uowner = [[self objectOrNilForKey:kJCModel_MyWaterCardInformationDataUowner fromDictionary:dict] doubleValue];
        self.level = [[self objectOrNilForKey:kJCModel_MyWaterCardInformationDataLevel fromDictionary:dict] doubleValue];
        self.waterCardRecords = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataWaterCardRecords fromDictionary:dict];
        NSObject *receivedJCModel_MyWaterCardInformationWaterCardItems = [dict objectForKey:kJCModel_MyWaterCardInformationDataWaterCardItems];
        NSMutableArray *parsedJCModel_MyWaterCardInformationWaterCardItems = [NSMutableArray array];
        
        if ([receivedJCModel_MyWaterCardInformationWaterCardItems isKindOfClass:[NSArray class]])
        {
            for (NSDictionary *item in (NSArray *)receivedJCModel_MyWaterCardInformationWaterCardItems)
            {
                if ([item isKindOfClass:[NSDictionary class]])
                {
                    [parsedJCModel_MyWaterCardInformationWaterCardItems addObject:[JCModel_MyWaterCardInformationWaterCardItems modelObjectWithDictionary:item]];
                }
            }
        }
        else if ([receivedJCModel_MyWaterCardInformationWaterCardItems isKindOfClass:[NSDictionary class]])
        {
            [parsedJCModel_MyWaterCardInformationWaterCardItems addObject:[JCModel_MyWaterCardInformationWaterCardItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyWaterCardInformationWaterCardItems]];
        }
        
        self.waterCardItems = [NSArray arrayWithArray:parsedJCModel_MyWaterCardInformationWaterCardItems];
        self.username = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataUsername fromDictionary:dict];
        self.staffName = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataStaffName fromDictionary:dict];
        self.customerAddresses = [self objectOrNilForKey:kJCModel_MyWaterCardInformationDataCustomerAddresses fromDictionary:dict];
        
    }
    
    return self;
    
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_MyWaterCardInformationDataId];
    [mutableDict setValue:self.phone forKey:kJCModel_MyWaterCardInformationDataPhone];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_MyWaterCardInformationDataMbPhone];
    [mutableDict setValue:self.creater forKey:kJCModel_MyWaterCardInformationDataCreater];
    [mutableDict setValue:self.owner forKey:kJCModel_MyWaterCardInformationDataOwner];
    [mutableDict setValue:self.staffMbPhone forKey:kJCModel_MyWaterCardInformationDataStaffMbPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_MyWaterCardInformationDataType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uowner] forKey:kJCModel_MyWaterCardInformationDataUowner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_MyWaterCardInformationDataLevel];
    [mutableDict setValue:self.waterCardRecords forKey:kJCModel_MyWaterCardInformationDataWaterCardRecords];
    NSMutableArray *tempArrayForWaterCardItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.waterCardItems)
    {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)])
        {
            // This class is a model object
            [tempArrayForWaterCardItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else
        {
            // Generic object
            [tempArrayForWaterCardItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWaterCardItems] forKey:kJCModel_MyWaterCardInformationDataWaterCardItems];
    [mutableDict setValue:self.username forKey:kJCModel_MyWaterCardInformationDataUsername];
    [mutableDict setValue:self.staffName forKey:kJCModel_MyWaterCardInformationDataStaffName];
    NSMutableArray *tempArrayForCustomerAddresses = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.customerAddresses)
    {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)])
        {
            // This class is a model object
            [tempArrayForCustomerAddresses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        }
        else
        {
            // Generic object
            [tempArrayForCustomerAddresses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddresses] forKey:kJCModel_MyWaterCardInformationDataCustomerAddresses];

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
    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataId];
    self.phone = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataPhone];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataMbPhone];
    self.creater = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataCreater];
    self.owner = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataOwner];
    self.staffMbPhone = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataStaffMbPhone];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_MyWaterCardInformationDataType];
    self.uowner = [aDecoder decodeDoubleForKey:kJCModel_MyWaterCardInformationDataUowner];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_MyWaterCardInformationDataLevel];
    self.waterCardRecords = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataWaterCardRecords];
    self.waterCardItems = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataWaterCardItems];
    self.username = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataUsername];
    self.staffName = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataStaffName];
    self.customerAddresses = [aDecoder decodeObjectForKey:kJCModel_MyWaterCardInformationDataCustomerAddresses];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_MyWaterCardInformationDataId];
    [aCoder encodeObject:_phone forKey:kJCModel_MyWaterCardInformationDataPhone];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_MyWaterCardInformationDataMbPhone];
    [aCoder encodeObject:_creater forKey:kJCModel_MyWaterCardInformationDataCreater];
    [aCoder encodeObject:_owner forKey:kJCModel_MyWaterCardInformationDataOwner];
    [aCoder encodeObject:_staffMbPhone forKey:kJCModel_MyWaterCardInformationDataStaffMbPhone];
    [aCoder encodeDouble:_type forKey:kJCModel_MyWaterCardInformationDataType];
    [aCoder encodeDouble:_uowner forKey:kJCModel_MyWaterCardInformationDataUowner];
    [aCoder encodeDouble:_level forKey:kJCModel_MyWaterCardInformationDataLevel];
    [aCoder encodeObject:_waterCardRecords forKey:kJCModel_MyWaterCardInformationDataWaterCardRecords];
    [aCoder encodeObject:_waterCardItems forKey:kJCModel_MyWaterCardInformationDataWaterCardItems];
    [aCoder encodeObject:_username forKey:kJCModel_MyWaterCardInformationDataUsername];
    [aCoder encodeObject:_staffName forKey:kJCModel_MyWaterCardInformationDataStaffName];
    [aCoder encodeObject:_customerAddresses forKey:kJCModel_MyWaterCardInformationDataCustomerAddresses];
}

- (id)copyWithZone:(NSZone *)zone {
    
    JCModel_MyWaterCardInformationData *copy = [[JCModel_MyWaterCardInformationData alloc] init];

    if (copy)
    {
        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.phone = (id)[self.phone copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
        copy.creater = [self.creater copyWithZone:zone];
        copy.owner = (id)[self.owner copyWithZone:zone];
        copy.staffMbPhone = (id)[self.staffMbPhone copyWithZone:zone];
        copy.type = self.type;
        copy.uowner = self.uowner;
        copy.level = self.level;
        copy.waterCardRecords = (id)[self.waterCardRecords copyWithZone:zone];
        copy.waterCardItems = [self.waterCardItems copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.staffName = (id)[self.staffName copyWithZone:zone];
        copy.customerAddresses = [self.customerAddresses copyWithZone:zone];
    }
    
    return copy;
}


@end
