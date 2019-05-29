//
//  JCModel_ReadWarningList.m
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReadWarningList.h"


NSString *const kJCModel_ReadWarningListId = @"id";
NSString *const kJCModel_ReadWarningListGuide = @"guide";
NSString *const kJCModel_ReadWarningListMobile = @"mobile";
NSString *const kJCModel_ReadWarningListOwner = @"owner";
NSString *const kJCModel_ReadWarningListCreater = @"creater";
NSString *const kJCModel_ReadWarningListTotal = @"total";
NSString *const kJCModel_ReadWarningListType = @"type";
NSString *const kJCModel_ReadWarningListUowner = @"uowner";
NSString *const kJCModel_ReadWarningListLevel = @"level";
NSString *const kJCModel_ReadWarningListWaterCardRecords = @"waterCardRecords";
NSString *const kJCModel_ReadWarningListXpath = @"xpath";
NSString *const kJCModel_ReadWarningListWaterCardItems = @"waterCardItems";
NSString *const kJCModel_ReadWarningListAddress = @"address";
NSString *const kJCModel_ReadWarningListName = @"name";


@interface JCModel_ReadWarningList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReadWarningList

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize mobile = _mobile;
@synthesize owner = _owner;
@synthesize creater = _creater;
@synthesize total = _total;
@synthesize type = _type;
@synthesize uowner = _uowner;
@synthesize level = _level;
@synthesize waterCardRecords = _waterCardRecords;
@synthesize xpath = _xpath;
@synthesize waterCardItems = _waterCardItems;
@synthesize address = _address;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_ReadWarningListId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_ReadWarningListGuide fromDictionary:dict] doubleValue];
            self.mobile = [self objectOrNilForKey:kJCModel_ReadWarningListMobile fromDictionary:dict];
            self.owner = [[self objectOrNilForKey:kJCModel_ReadWarningListOwner fromDictionary:dict] doubleValue];
            self.creater = [self objectOrNilForKey:kJCModel_ReadWarningListCreater fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kJCModel_ReadWarningListTotal fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kJCModel_ReadWarningListType fromDictionary:dict] doubleValue];
            self.uowner = [self objectOrNilForKey:kJCModel_ReadWarningListUowner fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kJCModel_ReadWarningListLevel fromDictionary:dict] doubleValue];
            self.waterCardRecords = [self objectOrNilForKey:kJCModel_ReadWarningListWaterCardRecords fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_ReadWarningListXpath fromDictionary:dict];
            self.waterCardItems = [self objectOrNilForKey:kJCModel_ReadWarningListWaterCardItems fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_ReadWarningListAddress fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_ReadWarningListName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_ReadWarningListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_ReadWarningListGuide];
    [mutableDict setValue:self.mobile forKey:kJCModel_ReadWarningListMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.owner] forKey:kJCModel_ReadWarningListOwner];
    [mutableDict setValue:self.creater forKey:kJCModel_ReadWarningListCreater];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kJCModel_ReadWarningListTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_ReadWarningListType];
    [mutableDict setValue:self.uowner forKey:kJCModel_ReadWarningListUowner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kJCModel_ReadWarningListLevel];
    [mutableDict setValue:self.waterCardRecords forKey:kJCModel_ReadWarningListWaterCardRecords];
    [mutableDict setValue:self.xpath forKey:kJCModel_ReadWarningListXpath];
    [mutableDict setValue:self.waterCardItems forKey:kJCModel_ReadWarningListWaterCardItems];
    [mutableDict setValue:self.address forKey:kJCModel_ReadWarningListAddress];
    [mutableDict setValue:self.name forKey:kJCModel_ReadWarningListName];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningListGuide];
    self.mobile = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListMobile];
    self.owner = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningListOwner];
    self.creater = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListCreater];
    self.total = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningListTotal];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningListType];
    self.uowner = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListUowner];
    self.level = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningListLevel];
    self.waterCardRecords = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListWaterCardRecords];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListXpath];
    self.waterCardItems = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListWaterCardItems];
    self.address = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListAddress];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReadWarningListName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_ReadWarningListId];
    [aCoder encodeDouble:_guide forKey:kJCModel_ReadWarningListGuide];
    [aCoder encodeObject:_mobile forKey:kJCModel_ReadWarningListMobile];
    [aCoder encodeDouble:_owner forKey:kJCModel_ReadWarningListOwner];
    [aCoder encodeObject:_creater forKey:kJCModel_ReadWarningListCreater];
    [aCoder encodeDouble:_total forKey:kJCModel_ReadWarningListTotal];
    [aCoder encodeDouble:_type forKey:kJCModel_ReadWarningListType];
    [aCoder encodeObject:_uowner forKey:kJCModel_ReadWarningListUowner];
    [aCoder encodeDouble:_level forKey:kJCModel_ReadWarningListLevel];
    [aCoder encodeObject:_waterCardRecords forKey:kJCModel_ReadWarningListWaterCardRecords];
    [aCoder encodeObject:_xpath forKey:kJCModel_ReadWarningListXpath];
    [aCoder encodeObject:_waterCardItems forKey:kJCModel_ReadWarningListWaterCardItems];
    [aCoder encodeObject:_address forKey:kJCModel_ReadWarningListAddress];
    [aCoder encodeObject:_name forKey:kJCModel_ReadWarningListName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReadWarningList *copy = [[JCModel_ReadWarningList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.guide = self.guide;
        copy.mobile = [self.mobile copyWithZone:zone];
        copy.owner = self.owner;
        copy.creater = [self.creater copyWithZone:zone];
        copy.total = self.total;
        copy.type = self.type;
        copy.uowner = [self.uowner copyWithZone:zone];
        copy.level = self.level;
        copy.waterCardRecords = [self.waterCardRecords copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.waterCardItems = [self.waterCardItems copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
