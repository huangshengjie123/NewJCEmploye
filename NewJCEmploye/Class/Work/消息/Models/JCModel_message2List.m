//
//  JCModel_message2List.m
//
//  Created by   on 2019/3/16
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_message2List.h"


NSString *const kJCModel_message2ListId = @"id";
NSString *const kJCModel_message2ListComments = @"comments";
NSString *const kJCModel_message2ListCus = @"cus";
NSString *const kJCModel_message2ListCusName = @"cusName";
NSString *const kJCModel_message2ListToCom = @"toCom";
NSString *const kJCModel_message2ListUpdaterName = @"updaterName";
NSString *const kJCModel_message2ListFrom = @"from";
NSString *const kJCModel_message2ListFromName = @"fromName";
NSString *const kJCModel_message2ListFromComName = @"fromComName";
NSString *const kJCModel_message2ListToComName = @"toComName";
NSString *const kJCModel_message2ListCreateTime = @"createTime";
NSString *const kJCModel_message2ListCusMobile = @"cusMobile";
NSString *const kJCModel_message2ListUpdater = @"updater";
NSString *const kJCModel_message2ListFromCom = @"fromCom";
NSString *const kJCModel_message2ListToName = @"toName";
NSString *const kJCModel_message2ListTo = @"to";


@interface JCModel_message2List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_message2List

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize cus = _cus;
@synthesize cusName = _cusName;
@synthesize toCom = _toCom;
@synthesize updaterName = _updaterName;
@synthesize from = _from;
@synthesize fromName = _fromName;
@synthesize fromComName = _fromComName;
@synthesize toComName = _toComName;
@synthesize createTime = _createTime;
@synthesize cusMobile = _cusMobile;
@synthesize updater = _updater;
@synthesize fromCom = _fromCom;
@synthesize toName = _toName;
@synthesize to = _to;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_message2ListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_message2ListComments fromDictionary:dict];
            self.cus = [[self objectOrNilForKey:kJCModel_message2ListCus fromDictionary:dict] doubleValue];
            self.cusName = [self objectOrNilForKey:kJCModel_message2ListCusName fromDictionary:dict];
            self.toCom = [self objectOrNilForKey:kJCModel_message2ListToCom fromDictionary:dict];
            self.updaterName = [self objectOrNilForKey:kJCModel_message2ListUpdaterName fromDictionary:dict];
            self.from = [[self objectOrNilForKey:kJCModel_message2ListFrom fromDictionary:dict] doubleValue];
            self.fromName = [self objectOrNilForKey:kJCModel_message2ListFromName fromDictionary:dict];
            self.fromComName = [self objectOrNilForKey:kJCModel_message2ListFromComName fromDictionary:dict];
            self.toComName = [self objectOrNilForKey:kJCModel_message2ListToComName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_message2ListCreateTime fromDictionary:dict];
            self.cusMobile = [self objectOrNilForKey:kJCModel_message2ListCusMobile fromDictionary:dict];
            self.updater = [[self objectOrNilForKey:kJCModel_message2ListUpdater fromDictionary:dict] doubleValue];
            self.fromCom = [self objectOrNilForKey:kJCModel_message2ListFromCom fromDictionary:dict];
            self.toName = [self objectOrNilForKey:kJCModel_message2ListToName fromDictionary:dict];
            self.to = [[self objectOrNilForKey:kJCModel_message2ListTo fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_message2ListId];
    [mutableDict setValue:self.comments forKey:kJCModel_message2ListComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cus] forKey:kJCModel_message2ListCus];
    [mutableDict setValue:self.cusName forKey:kJCModel_message2ListCusName];
    [mutableDict setValue:self.toCom forKey:kJCModel_message2ListToCom];
    [mutableDict setValue:self.updaterName forKey:kJCModel_message2ListUpdaterName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.from] forKey:kJCModel_message2ListFrom];
    [mutableDict setValue:self.fromName forKey:kJCModel_message2ListFromName];
    [mutableDict setValue:self.fromComName forKey:kJCModel_message2ListFromComName];
    [mutableDict setValue:self.toComName forKey:kJCModel_message2ListToComName];
    [mutableDict setValue:self.createTime forKey:kJCModel_message2ListCreateTime];
    [mutableDict setValue:self.cusMobile forKey:kJCModel_message2ListCusMobile];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updater] forKey:kJCModel_message2ListUpdater];
    [mutableDict setValue:self.fromCom forKey:kJCModel_message2ListFromCom];
    [mutableDict setValue:self.toName forKey:kJCModel_message2ListToName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.to] forKey:kJCModel_message2ListTo];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_message2ListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_message2ListComments];
    self.cus = [aDecoder decodeDoubleForKey:kJCModel_message2ListCus];
    self.cusName = [aDecoder decodeObjectForKey:kJCModel_message2ListCusName];
    self.toCom = [aDecoder decodeObjectForKey:kJCModel_message2ListToCom];
    self.updaterName = [aDecoder decodeObjectForKey:kJCModel_message2ListUpdaterName];
    self.from = [aDecoder decodeDoubleForKey:kJCModel_message2ListFrom];
    self.fromName = [aDecoder decodeObjectForKey:kJCModel_message2ListFromName];
    self.fromComName = [aDecoder decodeObjectForKey:kJCModel_message2ListFromComName];
    self.toComName = [aDecoder decodeObjectForKey:kJCModel_message2ListToComName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_message2ListCreateTime];
    self.cusMobile = [aDecoder decodeObjectForKey:kJCModel_message2ListCusMobile];
    self.updater = [aDecoder decodeDoubleForKey:kJCModel_message2ListUpdater];
    self.fromCom = [aDecoder decodeObjectForKey:kJCModel_message2ListFromCom];
    self.toName = [aDecoder decodeObjectForKey:kJCModel_message2ListToName];
    self.to = [aDecoder decodeDoubleForKey:kJCModel_message2ListTo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_message2ListId];
    [aCoder encodeObject:_comments forKey:kJCModel_message2ListComments];
    [aCoder encodeDouble:_cus forKey:kJCModel_message2ListCus];
    [aCoder encodeObject:_cusName forKey:kJCModel_message2ListCusName];
    [aCoder encodeObject:_toCom forKey:kJCModel_message2ListToCom];
    [aCoder encodeObject:_updaterName forKey:kJCModel_message2ListUpdaterName];
    [aCoder encodeDouble:_from forKey:kJCModel_message2ListFrom];
    [aCoder encodeObject:_fromName forKey:kJCModel_message2ListFromName];
    [aCoder encodeObject:_fromComName forKey:kJCModel_message2ListFromComName];
    [aCoder encodeObject:_toComName forKey:kJCModel_message2ListToComName];
    [aCoder encodeObject:_createTime forKey:kJCModel_message2ListCreateTime];
    [aCoder encodeObject:_cusMobile forKey:kJCModel_message2ListCusMobile];
    [aCoder encodeDouble:_updater forKey:kJCModel_message2ListUpdater];
    [aCoder encodeObject:_fromCom forKey:kJCModel_message2ListFromCom];
    [aCoder encodeObject:_toName forKey:kJCModel_message2ListToName];
    [aCoder encodeDouble:_to forKey:kJCModel_message2ListTo];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_message2List *copy = [[JCModel_message2List alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.cus = self.cus;
        copy.cusName = [self.cusName copyWithZone:zone];
        copy.toCom = [self.toCom copyWithZone:zone];
        copy.updaterName = [self.updaterName copyWithZone:zone];
        copy.from = self.from;
        copy.fromName = [self.fromName copyWithZone:zone];
        copy.fromComName = [self.fromComName copyWithZone:zone];
        copy.toComName = [self.toComName copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.cusMobile = [self.cusMobile copyWithZone:zone];
        copy.updater = self.updater;
        copy.fromCom = [self.fromCom copyWithZone:zone];
        copy.toName = [self.toName copyWithZone:zone];
        copy.to = self.to;
    }
    
    return copy;
}


@end
