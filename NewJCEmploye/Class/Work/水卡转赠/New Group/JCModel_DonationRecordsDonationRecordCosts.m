//
//  JCModel_DonationRecordsDonationRecordCosts.m
//
//  Created by   on 2018/12/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DonationRecordsDonationRecordCosts.h"


NSString *const kJCModel_DonationRecordsDonationRecordCostsNum = @"num";
NSString *const kJCModel_DonationRecordsDonationRecordCostsId = @"id";
NSString *const kJCModel_DonationRecordsDonationRecordCostsItemName = @"itemName";
NSString *const kJCModel_DonationRecordsDonationRecordCostsItem = @"item";
NSString *const kJCModel_DonationRecordsDonationRecordCostsUnit = @"unit";


@interface JCModel_DonationRecordsDonationRecordCosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DonationRecordsDonationRecordCosts

@synthesize num = _num;
@synthesize donationRecordCostsIdentifier = _donationRecordCostsIdentifier;
@synthesize itemName = _itemName;
@synthesize item = _item;
@synthesize unit = _unit;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_DonationRecordsDonationRecordCostsNum fromDictionary:dict] doubleValue];
            self.donationRecordCostsIdentifier = [self objectOrNilForKey:kJCModel_DonationRecordsDonationRecordCostsId fromDictionary:dict];
            self.itemName = [self objectOrNilForKey:kJCModel_DonationRecordsDonationRecordCostsItemName fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_DonationRecordsDonationRecordCostsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_DonationRecordsDonationRecordCostsUnit fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_DonationRecordsDonationRecordCostsNum];
    [mutableDict setValue:self.donationRecordCostsIdentifier forKey:kJCModel_DonationRecordsDonationRecordCostsId];
    [mutableDict setValue:self.itemName forKey:kJCModel_DonationRecordsDonationRecordCostsItemName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_DonationRecordsDonationRecordCostsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_DonationRecordsDonationRecordCostsUnit];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_DonationRecordsDonationRecordCostsNum];
    self.donationRecordCostsIdentifier = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsDonationRecordCostsId];
    self.itemName = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsDonationRecordCostsItemName];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_DonationRecordsDonationRecordCostsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_DonationRecordsDonationRecordCostsUnit];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_DonationRecordsDonationRecordCostsNum];
    [aCoder encodeObject:_donationRecordCostsIdentifier forKey:kJCModel_DonationRecordsDonationRecordCostsId];
    [aCoder encodeObject:_itemName forKey:kJCModel_DonationRecordsDonationRecordCostsItemName];
    [aCoder encodeDouble:_item forKey:kJCModel_DonationRecordsDonationRecordCostsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_DonationRecordsDonationRecordCostsUnit];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DonationRecordsDonationRecordCosts *copy = [[JCModel_DonationRecordsDonationRecordCosts alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.donationRecordCostsIdentifier = [self.donationRecordCostsIdentifier copyWithZone:zone];
        copy.itemName = [self.itemName copyWithZone:zone];
        copy.item = self.item;
        copy.unit = self.unit;
    }
    
    return copy;
}


@end
