//
//  JCModel_CrateCusApplicationSuppportFranchiserOrder.m
//
//  Created by   on 2018/12/22
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CrateCusApplicationSuppportFranchiserOrder.h"


NSString *const kJCModel_CrateCusApplicationSuppportFranchiserOrderCustomerId = @"customerId";
NSString *const kJCModel_CrateCusApplicationSuppportFranchiserOrderComments = @"comments";


@interface JCModel_CrateCusApplicationSuppportFranchiserOrder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CrateCusApplicationSuppportFranchiserOrder

@synthesize customerId = _customerId;
@synthesize comments = _comments;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.customerId = [[self objectOrNilForKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderCustomerId fromDictionary:dict] doubleValue];
            self.comments = [self objectOrNilForKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderComments fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerId] forKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderCustomerId];
    [mutableDict setValue:self.comments forKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderComments];

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

    self.customerId = [aDecoder decodeDoubleForKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderCustomerId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderComments];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerId forKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderCustomerId];
    [aCoder encodeObject:_comments forKey:kJCModel_CrateCusApplicationSuppportFranchiserOrderComments];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CrateCusApplicationSuppportFranchiserOrder *copy = [[JCModel_CrateCusApplicationSuppportFranchiserOrder alloc] init];
    
    
    
    if (copy) {

        copy.customerId = self.customerId;
        copy.comments = [self.comments copyWithZone:zone];
    }
    
    return copy;
}


@end
