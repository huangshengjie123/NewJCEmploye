//
//  JCModel_suprrotDealFranchiserGrantOrderBase.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_suprrotDealFranchiserGrantOrderBase.h"
#import "JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder.h"


NSString *const kJCModel_suprrotDealFranchiserGrantOrderBaseWaterCardId = @"waterCardId";
NSString *const kJCModel_suprrotDealFranchiserGrantOrderBaseCurrent = @"current";
NSString *const kJCModel_suprrotDealFranchiserGrantOrderBaseFranchiserOrder = @"franchiserOrder";
NSString *const kJCModel_suprrotDealFranchiserGrantOrderBaseCommand = @"command";


@interface JCModel_suprrotDealFranchiserGrantOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_suprrotDealFranchiserGrantOrderBase

@synthesize waterCardId = _waterCardId;
@synthesize current = _current;
@synthesize franchiserOrder = _franchiserOrder;
@synthesize command = _command;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.waterCardId = [self objectOrNilForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseWaterCardId fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCurrent fromDictionary:dict];
            self.franchiserOrder = [JCModel_suprrotDealFranchiserGrantOrderFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseFranchiserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.waterCardId forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseWaterCardId];
    [mutableDict setValue:self.current forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCurrent];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseFranchiserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCommand];

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

    self.waterCardId = [aDecoder decodeObjectForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseWaterCardId];
    self.current = [aDecoder decodeObjectForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCurrent];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseFranchiserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardId forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseWaterCardId];
    [aCoder encodeObject:_current forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCurrent];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseFranchiserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_suprrotDealFranchiserGrantOrderBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_suprrotDealFranchiserGrantOrderBase *copy = [[JCModel_suprrotDealFranchiserGrantOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.waterCardId = [self.waterCardId copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
