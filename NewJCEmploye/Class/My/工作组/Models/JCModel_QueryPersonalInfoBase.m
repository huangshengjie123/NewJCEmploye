//
//  JCModel_QueryPersonalInfoBase.m
//
//  Created by   on 2018/8/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_QueryPersonalInfoBase.h"


NSString *const kJCModel_QueryPersonalInfoBaseCycle = @"cycle";
NSString *const kJCModel_QueryPersonalInfoBaseGroupId = @"groupId";
NSString *const kJCModel_QueryPersonalInfoBaseCycleNum = @"cycleNum";
NSString *const kJCModel_QueryPersonalInfoBaseUid = @"uid";


@interface JCModel_QueryPersonalInfoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_QueryPersonalInfoBase

@synthesize cycle = _cycle;
@synthesize groupId = _groupId;
@synthesize cycleNum = _cycleNum;
@synthesize uid = _uid;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cycle = [self objectOrNilForKey:kJCModel_QueryPersonalInfoBaseCycle fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kJCModel_QueryPersonalInfoBaseGroupId fromDictionary:dict];
            self.cycleNum = [self objectOrNilForKey:kJCModel_QueryPersonalInfoBaseCycleNum fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_QueryPersonalInfoBaseUid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cycle forKey:kJCModel_QueryPersonalInfoBaseCycle];
    [mutableDict setValue:self.groupId forKey:kJCModel_QueryPersonalInfoBaseGroupId];
    [mutableDict setValue:self.cycleNum forKey:kJCModel_QueryPersonalInfoBaseCycleNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_QueryPersonalInfoBaseUid];

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

    self.cycle = [aDecoder decodeObjectForKey:kJCModel_QueryPersonalInfoBaseCycle];
    self.groupId = [aDecoder decodeObjectForKey:kJCModel_QueryPersonalInfoBaseGroupId];
    self.cycleNum = [aDecoder decodeObjectForKey:kJCModel_QueryPersonalInfoBaseCycleNum];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_QueryPersonalInfoBaseUid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cycle forKey:kJCModel_QueryPersonalInfoBaseCycle];
    [aCoder encodeObject:_groupId forKey:kJCModel_QueryPersonalInfoBaseGroupId];
    [aCoder encodeObject:_cycleNum forKey:kJCModel_QueryPersonalInfoBaseCycleNum];
    [aCoder encodeDouble:_uid forKey:kJCModel_QueryPersonalInfoBaseUid];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_QueryPersonalInfoBase *copy = [[JCModel_QueryPersonalInfoBase alloc] init];
    
    
    
    if (copy) {

        copy.cycle = [self.cycle copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.cycleNum = [self.cycleNum copyWithZone:zone];
        copy.uid = self.uid;
    }
    
    return copy;
}


@end
