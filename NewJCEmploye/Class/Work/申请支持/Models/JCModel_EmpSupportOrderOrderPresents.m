//
//  JCModel_EmpSupportOrderOrderPresents.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderOrderPresents.h"


NSString *const kJCModel_EmpSupportOrderOrderPresentsNum = @"num";
NSString *const kJCModel_EmpSupportOrderOrderPresentsItem = @"item";
NSString *const kJCModel_EmpSupportOrderOrderPresentsUnit = @"unit";
NSString *const kJCModel_EmpSupportOrderOrderPresentsName = @"name";


@interface JCModel_EmpSupportOrderOrderPresents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderOrderPresents

@synthesize num = _num;
@synthesize item = _item;
@synthesize unit = _unit;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.num = [[self objectOrNilForKey:kJCModel_EmpSupportOrderOrderPresentsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_EmpSupportOrderOrderPresentsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_EmpSupportOrderOrderPresentsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_EmpSupportOrderOrderPresentsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_EmpSupportOrderOrderPresentsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_EmpSupportOrderOrderPresentsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_EmpSupportOrderOrderPresentsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_EmpSupportOrderOrderPresentsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderOrderPresentsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderOrderPresentsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderOrderPresentsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderOrderPresentsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_EmpSupportOrderOrderPresentsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_EmpSupportOrderOrderPresentsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_EmpSupportOrderOrderPresentsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_EmpSupportOrderOrderPresentsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderOrderPresents *copy = [[JCModel_EmpSupportOrderOrderPresents alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
