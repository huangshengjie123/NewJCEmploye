//
//  JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder.m
//
//  Created by   on 2019/4/3
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder.h"


NSString *const kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderFranchiser = @"franchiser";
NSString *const kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderCustomerId = @"customerId";


@interface JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder

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
            self.franchiser = [self objectOrNilForKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderFranchiser fromDictionary:dict];
            self.customerId = [[self objectOrNilForKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderCustomerId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franchiser forKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderFranchiser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderCustomerId];

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

    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderFranchiser];
    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderCustomerId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franchiser forKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderFranchiser];
    [aCoder encodeDouble:_customerId forKey:kJCModel_butianjingxiaoshangxiaoshoudanFranchiserOrderCustomerId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder *copy = [[JCModel_butianjingxiaoshangxiaoshoudanFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.customerId = self.customerId;
    }
    
    return copy;
}


@end
