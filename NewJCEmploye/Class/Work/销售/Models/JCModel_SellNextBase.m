//
//  JCModel_SellNextBase.m
//
//  Created by   on 2018/6/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellNextBase.h"
#import "JCModel_SellNextOrder.h"


NSString *const kJCModel_SellNextBaseWaterCardId = @"waterCardId";
NSString *const kJCModel_SellNextBaseCurrent = @"current";
NSString *const kJCModel_SellNextBaseNeedBindCard = @"needBindCard";
NSString *const kJCModel_SellNextBaseOrder = @"order";
NSString *const kJCModel_SellNextBaseCommand = @"command";


@interface JCModel_SellNextBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellNextBase

@synthesize waterCardId = _waterCardId;
@synthesize current = _current;
@synthesize needBindCard = _needBindCard;
@synthesize order = _order;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.waterCardId = [self objectOrNilForKey:kJCModel_SellNextBaseWaterCardId fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_SellNextBaseCurrent fromDictionary:dict];
            self.needBindCard = [[self objectOrNilForKey:kJCModel_SellNextBaseNeedBindCard fromDictionary:dict] boolValue];
            self.order = [JCModel_SellNextOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_SellNextBaseOrder]];
            self.command = [self objectOrNilForKey:kJCModel_SellNextBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.waterCardId forKey:kJCModel_SellNextBaseWaterCardId];
    [mutableDict setValue:self.current forKey:kJCModel_SellNextBaseCurrent];
    [mutableDict setValue:[NSNumber numberWithBool:self.needBindCard] forKey:kJCModel_SellNextBaseNeedBindCard];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_SellNextBaseOrder];
    [mutableDict setValue:self.command forKey:kJCModel_SellNextBaseCommand];

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

    self.waterCardId = [aDecoder decodeObjectForKey:kJCModel_SellNextBaseWaterCardId];
    self.current = [aDecoder decodeObjectForKey:kJCModel_SellNextBaseCurrent];
    self.needBindCard = [aDecoder decodeBoolForKey:kJCModel_SellNextBaseNeedBindCard];
    self.order = [aDecoder decodeObjectForKey:kJCModel_SellNextBaseOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_SellNextBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardId forKey:kJCModel_SellNextBaseWaterCardId];
    [aCoder encodeObject:_current forKey:kJCModel_SellNextBaseCurrent];
    [aCoder encodeBool:_needBindCard forKey:kJCModel_SellNextBaseNeedBindCard];
    [aCoder encodeObject:_order forKey:kJCModel_SellNextBaseOrder];
    [aCoder encodeObject:_command forKey:kJCModel_SellNextBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellNextBase *copy = [[JCModel_SellNextBase alloc] init];
    
    
    
    if (copy) {

        copy.waterCardId = [self.waterCardId copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.needBindCard = self.needBindCard;
        copy.order = [self.order copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
