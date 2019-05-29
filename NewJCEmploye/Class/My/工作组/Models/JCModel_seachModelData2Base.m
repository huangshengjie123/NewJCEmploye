//
//  JCModel_seachModelData2Base.m
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_seachModelData2Base.h"


NSString *const kJCModel_seachModelData2BaseCycle = @"cycle";
NSString *const kJCModel_seachModelData2BaseGroupId = @"groupId";
NSString *const kJCModel_seachModelData2BaseCycleNum = @"cycleNum";


@interface JCModel_seachModelData2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_seachModelData2Base

@synthesize cycle = _cycle;
@synthesize groupId = _groupId;
@synthesize cycleNum = _cycleNum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cycle = [self objectOrNilForKey:kJCModel_seachModelData2BaseCycle fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kJCModel_seachModelData2BaseGroupId fromDictionary:dict];
            self.cycleNum = [self objectOrNilForKey:kJCModel_seachModelData2BaseCycleNum fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cycle forKey:kJCModel_seachModelData2BaseCycle];
    [mutableDict setValue:self.groupId forKey:kJCModel_seachModelData2BaseGroupId];
    [mutableDict setValue:self.cycleNum forKey:kJCModel_seachModelData2BaseCycleNum];

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

    self.cycle = [aDecoder decodeObjectForKey:kJCModel_seachModelData2BaseCycle];
    self.groupId = [aDecoder decodeObjectForKey:kJCModel_seachModelData2BaseGroupId];
    self.cycleNum = [aDecoder decodeObjectForKey:kJCModel_seachModelData2BaseCycleNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cycle forKey:kJCModel_seachModelData2BaseCycle];
    [aCoder encodeObject:_groupId forKey:kJCModel_seachModelData2BaseGroupId];
    [aCoder encodeObject:_cycleNum forKey:kJCModel_seachModelData2BaseCycleNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_seachModelData2Base *copy = [[JCModel_seachModelData2Base alloc] init];
    
    
    
    if (copy) {

        copy.cycle = [self.cycle copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.cycleNum = [self.cycleNum copyWithZone:zone];
    }
    
    return copy;
}


@end
