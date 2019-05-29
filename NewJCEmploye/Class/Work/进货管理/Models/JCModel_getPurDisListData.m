//
//  JCModel_getPurDisListData.m
//
//  Created by   on 2018/9/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getPurDisListData.h"


NSString *const kJCModel_getPurDisListDataId = @"id";
NSString *const kJCModel_getPurDisListDataName = @"name";
NSString *const kJCModel_getPurDisListDataMbPhone = @"mbPhone";


@interface JCModel_getPurDisListData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getPurDisListData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize name = _name;
@synthesize mbPhone = _mbPhone;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_getPurDisListDataId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_getPurDisListDataName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_getPurDisListDataMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_getPurDisListDataId];
    [mutableDict setValue:self.name forKey:kJCModel_getPurDisListDataName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_getPurDisListDataMbPhone];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_getPurDisListDataId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_getPurDisListDataName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_getPurDisListDataMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_getPurDisListDataId];
    [aCoder encodeObject:_name forKey:kJCModel_getPurDisListDataName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_getPurDisListDataMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getPurDisListData *copy = [[JCModel_getPurDisListData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
