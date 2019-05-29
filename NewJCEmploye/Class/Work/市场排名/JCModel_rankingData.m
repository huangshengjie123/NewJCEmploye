//
//  JCModel_rankingData.m
//
//  Created by   on 2019/3/26
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_rankingData.h"


NSString *const kJCModel_rankingDataAmount = @"amount";
NSString *const kJCModel_rankingDataId = @"id";
NSString *const kJCModel_rankingDataXpath = @"xpath";
NSString *const kJCModel_rankingDataName = @"name";


@interface JCModel_rankingData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_rankingData

@synthesize amount = _amount;
@synthesize dataIdentifier = _dataIdentifier;
@synthesize xpath = _xpath;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amount = [[self objectOrNilForKey:kJCModel_rankingDataAmount fromDictionary:dict] doubleValue];
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_rankingDataId fromDictionary:dict] doubleValue];
            self.xpath = [self objectOrNilForKey:kJCModel_rankingDataXpath fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_rankingDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_rankingDataAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_rankingDataId];
    [mutableDict setValue:self.xpath forKey:kJCModel_rankingDataXpath];
    [mutableDict setValue:self.name forKey:kJCModel_rankingDataName];

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

    self.amount = [aDecoder decodeDoubleForKey:kJCModel_rankingDataAmount];
    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_rankingDataId];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_rankingDataXpath];
    self.name = [aDecoder decodeObjectForKey:kJCModel_rankingDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amount forKey:kJCModel_rankingDataAmount];
    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_rankingDataId];
    [aCoder encodeObject:_xpath forKey:kJCModel_rankingDataXpath];
    [aCoder encodeObject:_name forKey:kJCModel_rankingDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_rankingData *copy = [[JCModel_rankingData alloc] init];
    
    
    
    if (copy) {

        copy.amount = self.amount;
        copy.dataIdentifier = self.dataIdentifier;
        copy.xpath = [self.xpath copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
