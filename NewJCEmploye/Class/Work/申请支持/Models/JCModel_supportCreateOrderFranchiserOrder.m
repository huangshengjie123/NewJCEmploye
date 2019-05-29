//
//  JCModel_supportCreateOrderFranchiserOrder.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportCreateOrderFranchiserOrder.h"
#import "JCModel_supportCreateOrderOrderCosts.h"
#import "JCModel_supportCreateOrderOrderPresents.h"


NSString *const kJCModel_supportCreateOrderFranchiserOrderId = @"id";
NSString *const kJCModel_supportCreateOrderFranchiserOrderGetamount = @"getamount";
NSString *const kJCModel_supportCreateOrderFranchiserOrderOrderCosts = @"orderCosts";
NSString *const kJCModel_supportCreateOrderFranchiserOrderOrderPresents = @"orderPresents";


@interface JCModel_supportCreateOrderFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportCreateOrderFranchiserOrder

@synthesize franchiserOrderIdentifier = _franchiserOrderIdentifier;
@synthesize getamount = _getamount;
@synthesize orderCosts = _orderCosts;
@synthesize orderPresents = _orderPresents;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserOrderIdentifier = [self objectOrNilForKey:kJCModel_supportCreateOrderFranchiserOrderId fromDictionary:dict];
            self.getamount = [[self objectOrNilForKey:kJCModel_supportCreateOrderFranchiserOrderGetamount fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_supportCreateOrderOrderCosts = [dict objectForKey:kJCModel_supportCreateOrderFranchiserOrderOrderCosts];
    NSMutableArray *parsedJCModel_supportCreateOrderOrderCosts = [NSMutableArray array];
    
    if ([receivedJCModel_supportCreateOrderOrderCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_supportCreateOrderOrderCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_supportCreateOrderOrderCosts addObject:[JCModel_supportCreateOrderOrderCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_supportCreateOrderOrderCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_supportCreateOrderOrderCosts addObject:[JCModel_supportCreateOrderOrderCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_supportCreateOrderOrderCosts]];
    }

    self.orderCosts = [NSArray arrayWithArray:parsedJCModel_supportCreateOrderOrderCosts];
    NSObject *receivedJCModel_supportCreateOrderOrderPresents = [dict objectForKey:kJCModel_supportCreateOrderFranchiserOrderOrderPresents];
    NSMutableArray *parsedJCModel_supportCreateOrderOrderPresents = [NSMutableArray array];
    
    if ([receivedJCModel_supportCreateOrderOrderPresents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_supportCreateOrderOrderPresents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_supportCreateOrderOrderPresents addObject:[JCModel_supportCreateOrderOrderPresents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_supportCreateOrderOrderPresents isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_supportCreateOrderOrderPresents addObject:[JCModel_supportCreateOrderOrderPresents modelObjectWithDictionary:(NSDictionary *)receivedJCModel_supportCreateOrderOrderPresents]];
    }

    self.orderPresents = [NSArray arrayWithArray:parsedJCModel_supportCreateOrderOrderPresents];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserOrderIdentifier forKey:kJCModel_supportCreateOrderFranchiserOrderId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.getamount] forKey:kJCModel_supportCreateOrderFranchiserOrderGetamount];
    NSMutableArray *tempArrayForOrderCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.orderCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOrderCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOrderCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderCosts] forKey:kJCModel_supportCreateOrderFranchiserOrderOrderCosts];
    NSMutableArray *tempArrayForOrderPresents = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.orderPresents) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOrderPresents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOrderPresents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderPresents] forKey:kJCModel_supportCreateOrderFranchiserOrderOrderPresents];

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

    self.franchiserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderFranchiserOrderId];
    self.getamount = [aDecoder decodeDoubleForKey:kJCModel_supportCreateOrderFranchiserOrderGetamount];
    self.orderCosts = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderFranchiserOrderOrderCosts];
    self.orderPresents = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderFranchiserOrderOrderPresents];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserOrderIdentifier forKey:kJCModel_supportCreateOrderFranchiserOrderId];
    [aCoder encodeDouble:_getamount forKey:kJCModel_supportCreateOrderFranchiserOrderGetamount];
    [aCoder encodeObject:_orderCosts forKey:kJCModel_supportCreateOrderFranchiserOrderOrderCosts];
    [aCoder encodeObject:_orderPresents forKey:kJCModel_supportCreateOrderFranchiserOrderOrderPresents];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportCreateOrderFranchiserOrder *copy = [[JCModel_supportCreateOrderFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserOrderIdentifier = [self.franchiserOrderIdentifier copyWithZone:zone];
        copy.getamount = self.getamount;
        copy.orderCosts = [self.orderCosts copyWithZone:zone];
        copy.orderPresents = [self.orderPresents copyWithZone:zone];
    }
    
    return copy;
}


@end
