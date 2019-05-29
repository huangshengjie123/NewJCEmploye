//
//  JCModel_dealFranchiserOrder1FranchiserOrder.m
//
//  Created by   on 2018/9/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserOrder1FranchiserOrder.h"


NSString *const kJCModel_dealFranchiserOrder1FranchiserOrderFranchiser = @"franchiser";


@interface JCModel_dealFranchiserOrder1FranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserOrder1FranchiserOrder

@synthesize franchiser = _franchiser;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.franchiser = [self objectOrNilForKey:kJCModel_dealFranchiserOrder1FranchiserOrderFranchiser fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiser forKey:kJCModel_dealFranchiserOrder1FranchiserOrderFranchiser];

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

    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserOrder1FranchiserOrderFranchiser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiser forKey:kJCModel_dealFranchiserOrder1FranchiserOrderFranchiser];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserOrder1FranchiserOrder *copy = [[JCModel_dealFranchiserOrder1FranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiser = [self.franchiser copyWithZone:zone];
    }
    
    return copy;
}


@end
