//
//  JCModel_cancelDealFranchiserGrantOrderBase.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_cancelDealFranchiserGrantOrderBase.h"
#import "JCModel_cancelDealFranchiserGrantOrderFranchiserOrder.h"


NSString *const kJCModel_cancelDealFranchiserGrantOrderBaseCommand = @"command";
NSString *const kJCModel_cancelDealFranchiserGrantOrderBaseCurrent = @"current";
NSString *const kJCModel_cancelDealFranchiserGrantOrderBaseFranchiserOrder = @"franchiserOrder";


@interface JCModel_cancelDealFranchiserGrantOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_cancelDealFranchiserGrantOrderBase

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
            self.command = [self objectOrNilForKey:kJCModel_cancelDealFranchiserGrantOrderBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_cancelDealFranchiserGrantOrderBaseCurrent fromDictionary:dict];
            self.franchiserOrder = [JCModel_cancelDealFranchiserGrantOrderFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_cancelDealFranchiserGrantOrderBaseFranchiserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_cancelDealFranchiserGrantOrderBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_cancelDealFranchiserGrantOrderBaseCurrent];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_cancelDealFranchiserGrantOrderBaseFranchiserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_cancelDealFranchiserGrantOrderBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_cancelDealFranchiserGrantOrderBaseCurrent];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_cancelDealFranchiserGrantOrderBaseFranchiserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_cancelDealFranchiserGrantOrderBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_cancelDealFranchiserGrantOrderBaseCurrent];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_cancelDealFranchiserGrantOrderBaseFranchiserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_cancelDealFranchiserGrantOrderBase *copy = [[JCModel_cancelDealFranchiserGrantOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
