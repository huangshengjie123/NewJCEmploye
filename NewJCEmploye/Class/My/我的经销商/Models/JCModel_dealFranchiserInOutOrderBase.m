//
//  JCModel_dealFranchiserInOutOrderBase.m
//
//  Created by   on 2018/9/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_dealFranchiserInOutOrderBase.h"
#import "JCModel_dealFranchiserInOutOrderFranchiserInOutOrder.h"


NSString *const kJCModel_dealFranchiserInOutOrderBaseCommand = @"command";
NSString *const kJCModel_dealFranchiserInOutOrderBaseFranchiserInOutOrder = @"franchiserInOutOrder";


@interface JCModel_dealFranchiserInOutOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_dealFranchiserInOutOrderBase

@synthesize command = _command;
@synthesize franchiserInOutOrder = _franchiserInOutOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_dealFranchiserInOutOrderBaseCommand fromDictionary:dict];
            self.franchiserInOutOrder = [JCModel_dealFranchiserInOutOrderFranchiserInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_dealFranchiserInOutOrderBaseFranchiserInOutOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_dealFranchiserInOutOrderBaseCommand];
    [mutableDict setValue:[self.franchiserInOutOrder dictionaryRepresentation] forKey:kJCModel_dealFranchiserInOutOrderBaseFranchiserInOutOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderBaseCommand];
    self.franchiserInOutOrder = [aDecoder decodeObjectForKey:kJCModel_dealFranchiserInOutOrderBaseFranchiserInOutOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_dealFranchiserInOutOrderBaseCommand];
    [aCoder encodeObject:_franchiserInOutOrder forKey:kJCModel_dealFranchiserInOutOrderBaseFranchiserInOutOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_dealFranchiserInOutOrderBase *copy = [[JCModel_dealFranchiserInOutOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.franchiserInOutOrder = [self.franchiserInOutOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
