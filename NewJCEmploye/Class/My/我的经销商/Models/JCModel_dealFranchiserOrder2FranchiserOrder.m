//
//  JCModel_dealFranchiserOrder2FranchiserOrder.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserOrder2FranchiserOrder.h"


NSString *const kJCModel_dealFranchiserOrder2FranchiserOrderFranchiser = @"franchiser";
NSString *const kJCModel_dealFranchiserOrder2FranchiserOrderCustomerId = @"customerId";


@interface JCModel_dealFranchiserOrder2FranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserOrder2FranchiserOrder

@synthesize franchiser = _franchiser;
@synthesize customerId = _customerId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiser = [self objectOrNilForKey:kJCModel_dealFranchiserOrder2FranchiserOrderFranchiser fromDictionary:dict];
            self.customerId = [[self objectOrNilForKey:kJCModel_dealFranchiserOrder2FranchiserOrderCustomerId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiser forKey:kJCModel_dealFranchiserOrder2FranchiserOrderFranchiser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_dealFranchiserOrder2FranchiserOrderCustomerId];

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

    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder2FranchiserOrderFranchiser];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_dealFranchiserOrder2FranchiserOrderCustomerId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiser forKey:kJCModel_dealFranchiserOrder2FranchiserOrderFranchiser];
    [aCoder encodeDouble:_customerId forKey:kJCModel_dealFranchiserOrder2FranchiserOrderCustomerId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserOrder2FranchiserOrder *copy = [[JCModel_dealFranchiserOrder2FranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.customerId = self.customerId;
    }
    
    return copy;
}


@end
