//
//  JCModel_NewCooperationBase.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewCooperationBase.h"


NSString *const kJCModel_NewCooperationBaseAreaId = @"areaId";
NSString *const kJCModel_NewCooperationBaseLawPhone = @"lawPhone";
NSString *const kJCModel_NewCooperationBasePointPhone = @"pointPhone";
NSString *const kJCModel_NewCooperationBasePointAddr = @"pointAddr";
NSString *const kJCModel_NewCooperationBaseGuide = @"guide";
NSString *const kJCModel_NewCooperationBaseTag = @"tag";
NSString *const kJCModel_NewCooperationBasePointName = @"pointName";
NSString *const kJCModel_NewCooperationBaseLaw = @"law";
NSString *const kJCModel_NewCooperationBaseIsCooperation = @"isCooperation";


@interface JCModel_NewCooperationBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewCooperationBase

@synthesize areaId = _areaId;
@synthesize lawPhone = _lawPhone;
@synthesize pointPhone = _pointPhone;
@synthesize pointAddr = _pointAddr;
@synthesize guide = _guide;
@synthesize tag = _tag;
@synthesize pointName = _pointName;
@synthesize law = _law;
@synthesize isCooperation = _isCooperation;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.areaId = [self objectOrNilForKey:kJCModel_NewCooperationBaseAreaId fromDictionary:dict];
            self.lawPhone = [self objectOrNilForKey:kJCModel_NewCooperationBaseLawPhone fromDictionary:dict];
            self.pointPhone = [self objectOrNilForKey:kJCModel_NewCooperationBasePointPhone fromDictionary:dict];
            self.pointAddr = [self objectOrNilForKey:kJCModel_NewCooperationBasePointAddr fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_NewCooperationBaseGuide fromDictionary:dict] doubleValue];
            self.tag = [self objectOrNilForKey:kJCModel_NewCooperationBaseTag fromDictionary:dict];
            self.pointName = [self objectOrNilForKey:kJCModel_NewCooperationBasePointName fromDictionary:dict];
            self.law = [self objectOrNilForKey:kJCModel_NewCooperationBaseLaw fromDictionary:dict];
            self.isCooperation = [[self objectOrNilForKey:kJCModel_NewCooperationBaseIsCooperation fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.areaId forKey:kJCModel_NewCooperationBaseAreaId];
    [mutableDict setValue:self.lawPhone forKey:kJCModel_NewCooperationBaseLawPhone];
    [mutableDict setValue:self.pointPhone forKey:kJCModel_NewCooperationBasePointPhone];
    [mutableDict setValue:self.pointAddr forKey:kJCModel_NewCooperationBasePointAddr];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_NewCooperationBaseGuide];
    [mutableDict setValue:self.tag forKey:kJCModel_NewCooperationBaseTag];
    [mutableDict setValue:self.pointName forKey:kJCModel_NewCooperationBasePointName];
    [mutableDict setValue:self.law forKey:kJCModel_NewCooperationBaseLaw];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isCooperation] forKey:kJCModel_NewCooperationBaseIsCooperation];

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

    self.areaId = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBaseAreaId];
    self.lawPhone = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBaseLawPhone];
    self.pointPhone = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBasePointPhone];
    self.pointAddr = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBasePointAddr];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_NewCooperationBaseGuide];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBaseTag];
    self.pointName = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBasePointName];
    self.law = [aDecoder decodeObjectForKey:kJCModel_NewCooperationBaseLaw];
    self.isCooperation = [aDecoder decodeDoubleForKey:kJCModel_NewCooperationBaseIsCooperation];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_areaId forKey:kJCModel_NewCooperationBaseAreaId];
    [aCoder encodeObject:_lawPhone forKey:kJCModel_NewCooperationBaseLawPhone];
    [aCoder encodeObject:_pointPhone forKey:kJCModel_NewCooperationBasePointPhone];
    [aCoder encodeObject:_pointAddr forKey:kJCModel_NewCooperationBasePointAddr];
    [aCoder encodeDouble:_guide forKey:kJCModel_NewCooperationBaseGuide];
    [aCoder encodeObject:_tag forKey:kJCModel_NewCooperationBaseTag];
    [aCoder encodeObject:_pointName forKey:kJCModel_NewCooperationBasePointName];
    [aCoder encodeObject:_law forKey:kJCModel_NewCooperationBaseLaw];
    [aCoder encodeDouble:_isCooperation forKey:kJCModel_NewCooperationBaseIsCooperation];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewCooperationBase *copy = [[JCModel_NewCooperationBase alloc] init];
    
    
    
    if (copy) {

        copy.areaId = [self.areaId copyWithZone:zone];
        copy.lawPhone = [self.lawPhone copyWithZone:zone];
        copy.pointPhone = [self.pointPhone copyWithZone:zone];
        copy.pointAddr = [self.pointAddr copyWithZone:zone];
        copy.guide = self.guide;
        copy.tag = [self.tag copyWithZone:zone];
        copy.pointName = [self.pointName copyWithZone:zone];
        copy.law = [self.law copyWithZone:zone];
        copy.isCooperation = self.isCooperation;
    }
    
    return copy;
}


@end
