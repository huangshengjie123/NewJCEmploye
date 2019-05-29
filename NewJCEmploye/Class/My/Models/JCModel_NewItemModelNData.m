//
//  JCModel_NewItemModelNData.m
//
//  Created by   on 2018/11/13
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewItemModelNData.h"


NSString *const kJCModel_NewItemModelNDataNum = @"num";
NSString *const kJCModel_NewItemModelNDataState = @"state";
NSString *const kJCModel_NewItemModelNDataItem = @"item";
NSString *const kJCModel_NewItemModelNDataName = @"name";
NSString *const kJCModel_NewItemModelNDataType = @"type";


@interface JCModel_NewItemModelNData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewItemModelNData

@synthesize num = _num;
@synthesize state = _state;
@synthesize item = _item;
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
            self.num = [[self objectOrNilForKey:kJCModel_NewItemModelNDataNum fromDictionary:dict] doubleValue];
            self.state = [[self objectOrNilForKey:kJCModel_NewItemModelNDataState fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_NewItemModelNDataItem fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_NewItemModelNDataName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_NewItemModelNDataType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_NewItemModelNDataNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kJCModel_NewItemModelNDataState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_NewItemModelNDataItem];
    [mutableDict setValue:self.name forKey:kJCModel_NewItemModelNDataName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_NewItemModelNDataType];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_NewItemModelNDataNum];
    self.state = [aDecoder decodeDoubleForKey:kJCModel_NewItemModelNDataState];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_NewItemModelNDataItem];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewItemModelNDataName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_NewItemModelNDataType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_NewItemModelNDataNum];
    [aCoder encodeDouble:_state forKey:kJCModel_NewItemModelNDataState];
    [aCoder encodeDouble:_item forKey:kJCModel_NewItemModelNDataItem];
    [aCoder encodeObject:_name forKey:kJCModel_NewItemModelNDataName];
    [aCoder encodeDouble:_type forKey:kJCModel_NewItemModelNDataType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewItemModelNData *copy = [[JCModel_NewItemModelNData alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.state = self.state;
        copy.item = self.item;
        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
    }
    
    return copy;
}


@end
