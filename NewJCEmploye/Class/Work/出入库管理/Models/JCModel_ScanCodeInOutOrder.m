//
//  JCModel_ScanCodeInOutOrder.m
//
//  Created by   on 2018/6/1
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ScanCodeInOutOrder.h"


NSString *const kJCModel_ScanCodeInOutOrderId = @"id";


@interface JCModel_ScanCodeInOutOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ScanCodeInOutOrder

@synthesize inOutOrderIdentifier = _inOutOrderIdentifier;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.inOutOrderIdentifier = [self objectOrNilForKey:kJCModel_ScanCodeInOutOrderId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.inOutOrderIdentifier forKey:kJCModel_ScanCodeInOutOrderId];

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

    self.inOutOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_ScanCodeInOutOrderId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_inOutOrderIdentifier forKey:kJCModel_ScanCodeInOutOrderId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ScanCodeInOutOrder *copy = [[JCModel_ScanCodeInOutOrder alloc] init];
    
    
    
    if (copy) {

        copy.inOutOrderIdentifier = [self.inOutOrderIdentifier copyWithZone:zone];
    }
    
    return copy;
}


@end
