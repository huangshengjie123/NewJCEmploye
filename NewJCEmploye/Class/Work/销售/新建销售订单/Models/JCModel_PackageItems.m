//
//  JCModel_PackageItems.m
//
//  Created by   on 2018/6/12
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PackageItems.h"


NSString *const kJCModel_PackageItemsName = @"name";
NSString *const kJCModel_PackageItemsNum = @"num";
NSString *const kJCModel_PackageItemsGid = @"gid";
NSString *const kJCModel_PackageItemsPrice = @"price";
NSString *const kJCModel_PackageItemsType = @"type";
NSString *const kJCModel_PackageItemsItem = @"item";


@interface JCModel_PackageItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PackageItems

@synthesize name = _name;
@synthesize num = _num;
@synthesize gid = _gid;
@synthesize price = _price;
@synthesize type = _type;
@synthesize item = _item;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.name = [self objectOrNilForKey:kJCModel_PackageItemsName fromDictionary:dict];
            self.num = [[self objectOrNilForKey:kJCModel_PackageItemsNum fromDictionary:dict] doubleValue];
            self.gid = [[self objectOrNilForKey:kJCModel_PackageItemsGid fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kJCModel_PackageItemsPrice fromDictionary:dict] doubleValue];
            self.type = [self objectOrNilForKey:kJCModel_PackageItemsType fromDictionary:dict];
            self.item = [[self objectOrNilForKey:kJCModel_PackageItemsItem fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kJCModel_PackageItemsName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_PackageItemsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gid] forKey:kJCModel_PackageItemsGid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kJCModel_PackageItemsPrice];
    [mutableDict setValue:self.type forKey:kJCModel_PackageItemsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_PackageItemsItem];

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

    self.name = [aDecoder decodeObjectForKey:kJCModel_PackageItemsName];
    self.num = [aDecoder decodeDoubleForKey:kJCModel_PackageItemsNum];
    self.gid = [aDecoder decodeDoubleForKey:kJCModel_PackageItemsGid];
    self.price = [aDecoder decodeDoubleForKey:kJCModel_PackageItemsPrice];
    self.type = [aDecoder decodeObjectForKey:kJCModel_PackageItemsType];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_PackageItemsItem];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kJCModel_PackageItemsName];
    [aCoder encodeDouble:_num forKey:kJCModel_PackageItemsNum];
    [aCoder encodeDouble:_gid forKey:kJCModel_PackageItemsGid];
    [aCoder encodeDouble:_price forKey:kJCModel_PackageItemsPrice];
    [aCoder encodeObject:_type forKey:kJCModel_PackageItemsType];
    [aCoder encodeDouble:_item forKey:kJCModel_PackageItemsItem];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PackageItems *copy = [[JCModel_PackageItems alloc] init];
    
    
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.num = self.num;
        copy.gid = self.gid;
        copy.price = self.price;
        copy.type = [self.type copyWithZone:zone];
        copy.item = self.item;
    }
    
    return copy;
}


@end
