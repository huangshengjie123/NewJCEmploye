//
//  JCModel_GroupObservers2Data.m
//
//  Created by   on 2019/4/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupObservers2Data.h"


NSString *const kJCModel_GroupObservers2DataId = @"id";
NSString *const kJCModel_GroupObservers2DataNumber = @"number";
NSString *const kJCModel_GroupObservers2DataName = @"name";
NSString *const kJCModel_GroupObservers2DataType = @"type";


@interface JCModel_GroupObservers2Data ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupObservers2Data

@synthesize dataIdentifier = _dataIdentifier;
@synthesize number = _number;
@synthesize name = _name;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_GroupObservers2DataId fromDictionary:dict];
            self.number = [[self objectOrNilForKey:kJCModel_GroupObservers2DataNumber fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_GroupObservers2DataName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_GroupObservers2DataType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_GroupObservers2DataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kJCModel_GroupObservers2DataNumber];
    [mutableDict setValue:self.name forKey:kJCModel_GroupObservers2DataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_GroupObservers2DataType];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2DataId];
    self.number = [aDecoder decodeDoubleForKey:kJCModel_GroupObservers2DataNumber];
    self.name = [aDecoder decodeObjectForKey:kJCModel_GroupObservers2DataName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_GroupObservers2DataType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_GroupObservers2DataId];
    [aCoder encodeDouble:_number forKey:kJCModel_GroupObservers2DataNumber];
    [aCoder encodeObject:_name forKey:kJCModel_GroupObservers2DataName];
    [aCoder encodeDouble:_type forKey:kJCModel_GroupObservers2DataType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupObservers2Data *copy = [[JCModel_GroupObservers2Data alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.number = self.number;
        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
