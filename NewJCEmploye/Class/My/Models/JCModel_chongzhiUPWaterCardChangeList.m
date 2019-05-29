//
//  JCModel_chongzhiUPWaterCardChangeList.m
//
//  Created by   on 2018/10/26
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_chongzhiUPWaterCardChangeList.h"


NSString *const kJCModel_chongzhiUPWaterCardChangeListNum = @"num";
NSString *const kJCModel_chongzhiUPWaterCardChangeListStaffCardId = @"staffCardId";
NSString *const kJCModel_chongzhiUPWaterCardChangeListItem = @"item";


@interface JCModel_chongzhiUPWaterCardChangeList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_chongzhiUPWaterCardChangeList

@synthesize num = _num;
@synthesize staffCardId = _staffCardId;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_chongzhiUPWaterCardChangeListNum fromDictionary:dict] doubleValue];
            self.staffCardId = [self objectOrNilForKey:kJCModel_chongzhiUPWaterCardChangeListStaffCardId fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_chongzhiUPWaterCardChangeListItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_chongzhiUPWaterCardChangeListNum];
    [mutableDict setValue:self.staffCardId forKey:kJCModel_chongzhiUPWaterCardChangeListStaffCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_chongzhiUPWaterCardChangeListItem];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_chongzhiUPWaterCardChangeListNum];
    self.staffCardId = [aDecoder decodeObjectForKey:kJCModel_chongzhiUPWaterCardChangeListStaffCardId];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_chongzhiUPWaterCardChangeListItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_chongzhiUPWaterCardChangeListNum];
    [aCoder encodeObject:_staffCardId forKey:kJCModel_chongzhiUPWaterCardChangeListStaffCardId];
    [aCoder encodeDouble:_item forKey:kJCModel_chongzhiUPWaterCardChangeListItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_chongzhiUPWaterCardChangeList *copy = [[JCModel_chongzhiUPWaterCardChangeList alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.staffCardId = [self.staffCardId copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
