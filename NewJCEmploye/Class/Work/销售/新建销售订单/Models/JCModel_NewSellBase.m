//
//  JCModel_NewSellBase.m
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewSellBase.h"
#import "JCModel_NewSellOrder.h"


NSString *const kJCModel_NewSellBaseIsPre = @"isPre";
NSString *const kJCModel_NewSellBaseCurrent = @"current";
NSString *const kJCModel_NewSellBaseOrder = @"order";
NSString *const kJCModel_NewSellBasePreId = @"preId";
NSString *const kJCModel_NewSellBaseCommand = @"command";


@interface JCModel_NewSellBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewSellBase

@synthesize isPre = _isPre;
@synthesize current = _current;
@synthesize order = _order;
@synthesize preId = _preId;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isPre = [[self objectOrNilForKey:kJCModel_NewSellBaseIsPre fromDictionary:dict] boolValue];
            self.current = [self objectOrNilForKey:kJCModel_NewSellBaseCurrent fromDictionary:dict];
            self.order = [JCModel_NewSellOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_NewSellBaseOrder]];
            self.preId = [[self objectOrNilForKey:kJCModel_NewSellBasePreId fromDictionary:dict] doubleValue];
            self.command = [self objectOrNilForKey:kJCModel_NewSellBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPre] forKey:kJCModel_NewSellBaseIsPre];
    [mutableDict setValue:self.current forKey:kJCModel_NewSellBaseCurrent];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_NewSellBaseOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preId] forKey:kJCModel_NewSellBasePreId];
    [mutableDict setValue:self.command forKey:kJCModel_NewSellBaseCommand];

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

    self.isPre = [aDecoder decodeBoolForKey:kJCModel_NewSellBaseIsPre];
    self.current = [aDecoder decodeObjectForKey:kJCModel_NewSellBaseCurrent];
    self.order = [aDecoder decodeObjectForKey:kJCModel_NewSellBaseOrder];
    self.preId = [aDecoder decodeDoubleForKey:kJCModel_NewSellBasePreId];
    self.command = [aDecoder decodeObjectForKey:kJCModel_NewSellBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_isPre forKey:kJCModel_NewSellBaseIsPre];
    [aCoder encodeObject:_current forKey:kJCModel_NewSellBaseCurrent];
    [aCoder encodeObject:_order forKey:kJCModel_NewSellBaseOrder];
    [aCoder encodeDouble:_preId forKey:kJCModel_NewSellBasePreId];
    [aCoder encodeObject:_command forKey:kJCModel_NewSellBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewSellBase *copy = [[JCModel_NewSellBase alloc] init];
    
    
    
    if (copy) {

        copy.isPre = self.isPre;
        copy.current = [self.current copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.preId = self.preId;
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
