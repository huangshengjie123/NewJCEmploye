//
//  JCModel_updateFranchiserDoBase.m
//
//  Created by   on 2019/4/9
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateFranchiserDoBase.h"


NSString *const kJCModel_updateFranchiserDoBasePhone = @"phone";
NSString *const kJCModel_updateFranchiserDoBaseAreaId = @"areaId";
NSString *const kJCModel_updateFranchiserDoBaseAddress = @"address";
NSString *const kJCModel_updateFranchiserDoBaseId = @"id";
NSString *const kJCModel_updateFranchiserDoBaseGuide = @"guide";
NSString *const kJCModel_updateFranchiserDoBaseCom = @"com";
NSString *const kJCModel_updateFranchiserDoBaseName = @"name";
NSString *const kJCModel_updateFranchiserDoBaseBalance = @"balance";


@interface JCModel_updateFranchiserDoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateFranchiserDoBase

@synthesize phone = _phone;
@synthesize areaId = _areaId;
@synthesize address = _address;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize guide = _guide;
@synthesize com = _com;
@synthesize name = _name;
@synthesize balance = _balance;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.phone = [self objectOrNilForKey:kJCModel_updateFranchiserDoBasePhone fromDictionary:dict];
            self.areaId = [self objectOrNilForKey:kJCModel_updateFranchiserDoBaseAreaId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kJCModel_updateFranchiserDoBaseAddress fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kJCModel_updateFranchiserDoBaseId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_updateFranchiserDoBaseGuide fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_updateFranchiserDoBaseCom fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_updateFranchiserDoBaseName fromDictionary:dict];
            self.balance = [[self objectOrNilForKey:kJCModel_updateFranchiserDoBaseBalance fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kJCModel_updateFranchiserDoBasePhone];
    [mutableDict setValue:self.areaId forKey:kJCModel_updateFranchiserDoBaseAreaId];
    [mutableDict setValue:self.address forKey:kJCModel_updateFranchiserDoBaseAddress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kJCModel_updateFranchiserDoBaseId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_updateFranchiserDoBaseGuide];
    [mutableDict setValue:self.com forKey:kJCModel_updateFranchiserDoBaseCom];
    [mutableDict setValue:self.name forKey:kJCModel_updateFranchiserDoBaseName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.balance] forKey:kJCModel_updateFranchiserDoBaseBalance];

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

    self.phone = [aDecoder decodeObjectForKey:kJCModel_updateFranchiserDoBasePhone];
    self.areaId = [aDecoder decodeObjectForKey:kJCModel_updateFranchiserDoBaseAreaId];
    self.address = [aDecoder decodeObjectForKey:kJCModel_updateFranchiserDoBaseAddress];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kJCModel_updateFranchiserDoBaseId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_updateFranchiserDoBaseGuide];
    self.com = [aDecoder decodeObjectForKey:kJCModel_updateFranchiserDoBaseCom];
    self.name = [aDecoder decodeObjectForKey:kJCModel_updateFranchiserDoBaseName];
    self.balance = [aDecoder decodeDoubleForKey:kJCModel_updateFranchiserDoBaseBalance];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kJCModel_updateFranchiserDoBasePhone];
    [aCoder encodeObject:_areaId forKey:kJCModel_updateFranchiserDoBaseAreaId];
    [aCoder encodeObject:_address forKey:kJCModel_updateFranchiserDoBaseAddress];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kJCModel_updateFranchiserDoBaseId];
    [aCoder encodeDouble:_guide forKey:kJCModel_updateFranchiserDoBaseGuide];
    [aCoder encodeObject:_com forKey:kJCModel_updateFranchiserDoBaseCom];
    [aCoder encodeObject:_name forKey:kJCModel_updateFranchiserDoBaseName];
    [aCoder encodeDouble:_balance forKey:kJCModel_updateFranchiserDoBaseBalance];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateFranchiserDoBase *copy = [[JCModel_updateFranchiserDoBase alloc] init];
    
    
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.areaId = [self.areaId copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.guide = self.guide;
        copy.com = [self.com copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.balance = self.balance;
    }
    
    return copy;
}


@end
