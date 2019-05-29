//
//  JCModel_MyFranchiserGrantOrdersOrderPresents.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersOrderPresents.h"


NSString *const kJCModel_MyFranchiserGrantOrdersOrderPresentsNum = @"num";
NSString *const kJCModel_MyFranchiserGrantOrdersOrderPresentsItem = @"item";
NSString *const kJCModel_MyFranchiserGrantOrdersOrderPresentsUnit = @"unit";
NSString *const kJCModel_MyFranchiserGrantOrdersOrderPresentsName = @"name";


@interface JCModel_MyFranchiserGrantOrdersOrderPresents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersOrderPresents

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
            self.num = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsNum fromDictionary:dict] doubleValue];
            self.item = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsItem fromDictionary:dict] doubleValue];
            self.unit = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsUnit fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.item] forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unit] forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsUnit];
    [mutableDict setValue:self.name forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsName];

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

    self.num = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsNum];
    self.item = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsItem];
    self.unit = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsUnit];
    self.name = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_num forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsNum];
    [aCoder encodeDouble:_item forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsItem];
    [aCoder encodeDouble:_unit forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsUnit];
    [aCoder encodeObject:_name forKey:kJCModel_MyFranchiserGrantOrdersOrderPresentsName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersOrderPresents *copy = [[JCModel_MyFranchiserGrantOrdersOrderPresents alloc] init];
    
    
    
    if (copy) {

        copy.num = self.num;
        copy.item = self.item;
        copy.unit = self.unit;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
