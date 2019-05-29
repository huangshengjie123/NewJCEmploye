//
//  JCModel_groupLeaderTransferwaterWaterCardChangeList.m
//
//  Created by   on 2018/12/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_groupLeaderTransferwaterWaterCardChangeList.h"


NSString *const kJCModel_groupLeaderTransferwaterWaterCardChangeListStaffCardId = @"staffCardId";
NSString *const kJCModel_groupLeaderTransferwaterWaterCardChangeListNum = @"num";
NSString *const kJCModel_groupLeaderTransferwaterWaterCardChangeListItem = @"item";
NSString *const kJCModel_groupLeaderTransferwaterWaterCardChangeListCusCardId = @"cusCardId";


@interface JCModel_groupLeaderTransferwaterWaterCardChangeList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_groupLeaderTransferwaterWaterCardChangeList

@synthesize staffCardId = _staffCardId;
@synthesize num = _num;
@synthesize item = _item;
@synthesize cusCardId = _cusCardId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.staffCardId = [self objectOrNilForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListStaffCardId fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListItem fromDictionary:dict] doubleValue];
            self.cusCardId = [self objectOrNilForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListCusCardId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.staffCardId forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListStaffCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListItem];
    [mutableDict setValue:self.cusCardId forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListCusCardId];

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

    self.staffCardId = [aDecoder decodeObjectForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListStaffCardId];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListItem];
    self.cusCardId = [aDecoder decodeObjectForKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListCusCardId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_staffCardId forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListStaffCardId];
    [aCoder encodeDouble:_num forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListNum];
    [aCoder encodeDouble:_item forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListItem];
    [aCoder encodeObject:_cusCardId forKey:kJCModel_groupLeaderTransferwaterWaterCardChangeListCusCardId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_groupLeaderTransferwaterWaterCardChangeList *copy = [[JCModel_groupLeaderTransferwaterWaterCardChangeList alloc] init];
    
    
    
    if (copy) {

        copy.staffCardId = [self.staffCardId copyWithZone:zone];
        copy.num = self.num;
        copy.item = self.item;
        copy.cusCardId = [self.cusCardId copyWithZone:zone];
    }
    
    return copy;
}


@end
