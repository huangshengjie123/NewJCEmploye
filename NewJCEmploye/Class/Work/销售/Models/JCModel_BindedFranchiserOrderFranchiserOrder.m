//
//  JCModel_BindedFranchiserOrderFranchiserOrder.m
//
//  Created by   on 2018/9/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BindedFranchiserOrderFranchiserOrder.h"


NSString *const kJCModel_BindedFranchiserOrderFranchiserOrderId = @"id";
NSString *const kJCModel_BindedFranchiserOrderFranchiserOrderGetamount = @"getamount";
NSString *const kJCModel_BindedFranchiserOrderFranchiserOrderType = @"type";


@interface JCModel_BindedFranchiserOrderFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BindedFranchiserOrderFranchiserOrder

@synthesize franchiserOrderIdentifier = _franchiserOrderIdentifier;
@synthesize getamount = _getamount;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiserOrderIdentifier = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderFranchiserOrderId fromDictionary:dict];
            self.getamount = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderFranchiserOrderGetamount fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderFranchiserOrderType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiserOrderIdentifier forKey:kJCModel_BindedFranchiserOrderFranchiserOrderId];
    [mutableDict setValue:self.getamount forKey:kJCModel_BindedFranchiserOrderFranchiserOrderGetamount];
    [mutableDict setValue:self.type forKey:kJCModel_BindedFranchiserOrderFranchiserOrderType];

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

    self.franchiserOrderIdentifier = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderFranchiserOrderId];
    self.getamount = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderFranchiserOrderGetamount];
    self.type = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderFranchiserOrderType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiserOrderIdentifier forKey:kJCModel_BindedFranchiserOrderFranchiserOrderId];
    [aCoder encodeObject:_getamount forKey:kJCModel_BindedFranchiserOrderFranchiserOrderGetamount];
    [aCoder encodeObject:_type forKey:kJCModel_BindedFranchiserOrderFranchiserOrderType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BindedFranchiserOrderFranchiserOrder *copy = [[JCModel_BindedFranchiserOrderFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiserOrderIdentifier = [self.franchiserOrderIdentifier copyWithZone:zone];
        copy.getamount = [self.getamount copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
