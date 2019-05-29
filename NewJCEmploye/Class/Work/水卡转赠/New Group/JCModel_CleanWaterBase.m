//
//  JCModel_CleanWaterBase.m
//
//  Created by   on 2018/12/20
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CleanWaterBase.h"
#import "JCModel_CleanWaterItemXNums.h"


NSString *const kJCModel_CleanWaterBaseToCardId = @"toCardId";
NSString *const kJCModel_CleanWaterBaseToCusId = @"toCusId";
NSString *const kJCModel_CleanWaterBaseNeedBind = @"needBind";
NSString *const kJCModel_CleanWaterBaseItemXNums = @"itemXNums";
NSString *const kJCModel_CleanWaterBaseFromCardId = @"fromCardId";


@interface JCModel_CleanWaterBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CleanWaterBase

@synthesize toCardId = _toCardId;
@synthesize toCusId = _toCusId;
@synthesize needBind = _needBind;
@synthesize itemXNums = _itemXNums;
@synthesize fromCardId = _fromCardId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.toCardId = [self objectOrNilForKey:kJCModel_CleanWaterBaseToCardId fromDictionary:dict];
            self.toCusId = [[self objectOrNilForKey:kJCModel_CleanWaterBaseToCusId fromDictionary:dict] doubleValue];
            self.needBind = [[self objectOrNilForKey:kJCModel_CleanWaterBaseNeedBind fromDictionary:dict] boolValue];
    NSObject *receivedJCModel_CleanWaterItemXNums = [dict objectForKey:kJCModel_CleanWaterBaseItemXNums];
    NSMutableArray *parsedJCModel_CleanWaterItemXNums = [NSMutableArray array];
    
    if ([receivedJCModel_CleanWaterItemXNums isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_CleanWaterItemXNums) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_CleanWaterItemXNums addObject:[JCModel_CleanWaterItemXNums modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_CleanWaterItemXNums isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_CleanWaterItemXNums addObject:[JCModel_CleanWaterItemXNums modelObjectWithDictionary:(NSDictionary *)receivedJCModel_CleanWaterItemXNums]];
    }

    self.itemXNums = [NSArray arrayWithArray:parsedJCModel_CleanWaterItemXNums];
            self.fromCardId = [self objectOrNilForKey:kJCModel_CleanWaterBaseFromCardId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.toCardId forKey:kJCModel_CleanWaterBaseToCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.toCusId] forKey:kJCModel_CleanWaterBaseToCusId];
    [mutableDict setValue:[NSNumber numberWithBool:self.needBind] forKey:kJCModel_CleanWaterBaseNeedBind];
    NSMutableArray *tempArrayForItemXNums = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.itemXNums) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemXNums addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemXNums addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemXNums] forKey:kJCModel_CleanWaterBaseItemXNums];
    [mutableDict setValue:self.fromCardId forKey:kJCModel_CleanWaterBaseFromCardId];

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

    self.toCardId = [aDecoder decodeObjectForKey:kJCModel_CleanWaterBaseToCardId];
    self.toCusId = [aDecoder decodeDoubleForKey:kJCModel_CleanWaterBaseToCusId];
    self.needBind = [aDecoder decodeBoolForKey:kJCModel_CleanWaterBaseNeedBind];
    self.itemXNums = [aDecoder decodeObjectForKey:kJCModel_CleanWaterBaseItemXNums];
    self.fromCardId = [aDecoder decodeObjectForKey:kJCModel_CleanWaterBaseFromCardId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_toCardId forKey:kJCModel_CleanWaterBaseToCardId];
    [aCoder encodeDouble:_toCusId forKey:kJCModel_CleanWaterBaseToCusId];
    [aCoder encodeBool:_needBind forKey:kJCModel_CleanWaterBaseNeedBind];
    [aCoder encodeObject:_itemXNums forKey:kJCModel_CleanWaterBaseItemXNums];
    [aCoder encodeObject:_fromCardId forKey:kJCModel_CleanWaterBaseFromCardId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CleanWaterBase *copy = [[JCModel_CleanWaterBase alloc] init];
    
    
    
    if (copy) {

        copy.toCardId = [self.toCardId copyWithZone:zone];
        copy.toCusId = self.toCusId;
        copy.needBind = self.needBind;
        copy.itemXNums = [self.itemXNums copyWithZone:zone];
        copy.fromCardId = [self.fromCardId copyWithZone:zone];
    }
    
    return copy;
}


@end
