//
//  JCModel_supportProbationOrderBase.m
//
//  Created by   on 2018/12/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportProbationOrderBase.h"
#import "JCModel_supportProbationOrderFranchiserOrder.h"


NSString *const kJCModel_supportProbationOrderBaseCommand = @"command";
NSString *const kJCModel_supportProbationOrderBaseCurrent = @"current";
NSString *const kJCModel_supportProbationOrderBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_supportProbationOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportProbationOrderBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize franchiserOrder = _franchiserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_supportProbationOrderBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_supportProbationOrderBaseCurrent fromDictionary:dict];
            self.franchiserOrder = [JCModel_supportProbationOrderFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_supportProbationOrderBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_supportProbationOrderBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_supportProbationOrderBaseCurrent];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_supportProbationOrderBaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_supportProbationOrderBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_supportProbationOrderBaseCurrent];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_supportProbationOrderBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_supportProbationOrderBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_supportProbationOrderBaseCurrent];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_supportProbationOrderBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportProbationOrderBase *copy = [[JCModel_supportProbationOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
