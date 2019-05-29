//
//  JCModel_GroupObserversData.m
//
//  Created by   on 2018/12/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GroupObserversData.h"
//type

NSString *const kJCModel_GroupObserversDataId = @"id";
NSString *const kJCModel_GroupObserversDataNumber = @"number";
NSString *const kJCModel_GroupObserversDataName = @"name";
NSString *const kJCModel_GroupObserversDataType = @"type";

@interface JCModel_GroupObserversData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GroupObserversData

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
            self.dataIdentifier = [self objectOrNilForKey:kJCModel_GroupObserversDataId fromDictionary:dict];
            self.number = [[self objectOrNilForKey:kJCModel_GroupObserversDataNumber fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_GroupObserversDataName fromDictionary:dict];
        self.type = [self objectOrNilForKey:kJCModel_GroupObserversDataType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kJCModel_GroupObserversDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kJCModel_GroupObserversDataNumber];
    [mutableDict setValue:self.name forKey:kJCModel_GroupObserversDataName];
    [mutableDict setValue:self.type forKey:kJCModel_GroupObserversDataType];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kJCModel_GroupObserversDataId];
    self.number = [aDecoder decodeDoubleForKey:kJCModel_GroupObserversDataNumber];
    self.name = [aDecoder decodeObjectForKey:kJCModel_GroupObserversDataName];
    self.type = [aDecoder decodeObjectForKey:kJCModel_GroupObserversDataType];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kJCModel_GroupObserversDataId];
    [aCoder encodeDouble:_number forKey:kJCModel_GroupObserversDataNumber];
    [aCoder encodeObject:_name forKey:kJCModel_GroupObserversDataName];
    [aCoder encodeObject:_type forKey:kJCModel_GroupObserversDataType];

}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GroupObserversData *copy = [[JCModel_GroupObserversData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.number = self.number;
        copy.name = [self.name copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];

    }
    
    return copy;
}


@end
