//
//  JCModel_CooperationPoiontOrderCooPointSimp.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderCooPointSimp.h"


NSString *const kJCModel_CooperationPoiontOrderCooPointSimpId = @"id";
NSString *const kJCModel_CooperationPoiontOrderCooPointSimpPointAddr = @"pointAddr";
NSString *const kJCModel_CooperationPoiontOrderCooPointSimpPointName = @"pointName";
NSString *const kJCModel_CooperationPoiontOrderCooPointSimpXpath = @"xpath";
NSString *const kJCModel_CooperationPoiontOrderCooPointSimpPointPhone = @"pointPhone";


@interface JCModel_CooperationPoiontOrderCooPointSimp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderCooPointSimp

@synthesize cooPointSimpIdentifier = _cooPointSimpIdentifier;
@synthesize pointAddr = _pointAddr;
@synthesize pointName = _pointName;
@synthesize xpath = _xpath;
@synthesize pointPhone = _pointPhone;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cooPointSimpIdentifier = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointSimpId fromDictionary:dict] doubleValue];
            self.pointAddr = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointSimpPointAddr fromDictionary:dict];
            self.pointName = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointSimpPointName fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointSimpXpath fromDictionary:dict];
            self.pointPhone = [self objectOrNilForKey:kJCModel_CooperationPoiontOrderCooPointSimpPointPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cooPointSimpIdentifier] forKey:kJCModel_CooperationPoiontOrderCooPointSimpId];
    [mutableDict setValue:self.pointAddr forKey:kJCModel_CooperationPoiontOrderCooPointSimpPointAddr];
    [mutableDict setValue:self.pointName forKey:kJCModel_CooperationPoiontOrderCooPointSimpPointName];
    [mutableDict setValue:self.xpath forKey:kJCModel_CooperationPoiontOrderCooPointSimpXpath];
    [mutableDict setValue:self.pointPhone forKey:kJCModel_CooperationPoiontOrderCooPointSimpPointPhone];

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

    self.cooPointSimpIdentifier = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderCooPointSimpId];
    self.pointAddr = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderCooPointSimpPointAddr];
    self.pointName = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderCooPointSimpPointName];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderCooPointSimpXpath];
    self.pointPhone = [aDecoder decodeObjectForKey:kJCModel_CooperationPoiontOrderCooPointSimpPointPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cooPointSimpIdentifier forKey:kJCModel_CooperationPoiontOrderCooPointSimpId];
    [aCoder encodeObject:_pointAddr forKey:kJCModel_CooperationPoiontOrderCooPointSimpPointAddr];
    [aCoder encodeObject:_pointName forKey:kJCModel_CooperationPoiontOrderCooPointSimpPointName];
    [aCoder encodeObject:_xpath forKey:kJCModel_CooperationPoiontOrderCooPointSimpXpath];
    [aCoder encodeObject:_pointPhone forKey:kJCModel_CooperationPoiontOrderCooPointSimpPointPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderCooPointSimp *copy = [[JCModel_CooperationPoiontOrderCooPointSimp alloc] init];
    
    
    
    if (copy) {

        copy.cooPointSimpIdentifier = self.cooPointSimpIdentifier;
        copy.pointAddr = [self.pointAddr copyWithZone:zone];
        copy.pointName = [self.pointName copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.pointPhone = [self.pointPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
