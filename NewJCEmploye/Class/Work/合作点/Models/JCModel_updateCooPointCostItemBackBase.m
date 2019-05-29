//
//  JCModel_updateCooPointCostItemBackBase.m
//
//  Created by   on 2019/1/17
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateCooPointCostItemBackBase.h"
#import "JCModel_updateCooPointCostItemBackItemXNums.h"


NSString *const kJCModel_updateCooPointCostItemBackBaseId = @"id";
NSString *const kJCModel_updateCooPointCostItemBackBaseItemXNums = @"itemXNums";


@interface JCModel_updateCooPointCostItemBackBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateCooPointCostItemBackBase

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize itemXNums = _itemXNums;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kJCModel_updateCooPointCostItemBackBaseId fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_updateCooPointCostItemBackItemXNums = [dict objectForKey:kJCModel_updateCooPointCostItemBackBaseItemXNums];
    NSMutableArray *parsedJCModel_updateCooPointCostItemBackItemXNums = [NSMutableArray array];
    
    if ([receivedJCModel_updateCooPointCostItemBackItemXNums isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_updateCooPointCostItemBackItemXNums) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_updateCooPointCostItemBackItemXNums addObject:[JCModel_updateCooPointCostItemBackItemXNums modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_updateCooPointCostItemBackItemXNums isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_updateCooPointCostItemBackItemXNums addObject:[JCModel_updateCooPointCostItemBackItemXNums modelObjectWithDictionary:(NSDictionary *)receivedJCModel_updateCooPointCostItemBackItemXNums]];
    }

    self.itemXNums = [NSArray arrayWithArray:parsedJCModel_updateCooPointCostItemBackItemXNums];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kJCModel_updateCooPointCostItemBackBaseId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemXNums] forKey:kJCModel_updateCooPointCostItemBackBaseItemXNums];

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

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kJCModel_updateCooPointCostItemBackBaseId];
    self.itemXNums = [aDecoder decodeObjectForKey:kJCModel_updateCooPointCostItemBackBaseItemXNums];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kJCModel_updateCooPointCostItemBackBaseId];
    [aCoder encodeObject:_itemXNums forKey:kJCModel_updateCooPointCostItemBackBaseItemXNums];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateCooPointCostItemBackBase *copy = [[JCModel_updateCooPointCostItemBackBase alloc] init];
    
    
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.itemXNums = [self.itemXNums copyWithZone:zone];
    }
    
    return copy;
}


@end
