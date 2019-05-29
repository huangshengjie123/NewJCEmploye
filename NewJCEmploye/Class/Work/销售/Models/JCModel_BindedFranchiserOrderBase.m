//
//  JCModel_BindedFranchiserOrderBase.m
//
//  Created by   on 2018/9/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BindedFranchiserOrderBase.h"
#import "JCModel_BindedFranchiserOrderFranchiserOrder.h"


NSString *const kJCModel_BindedFranchiserOrderBaseWaterCardId = @"waterCardId";
NSString *const kJCModel_BindedFranchiserOrderBaseCurrent = @"current";
NSString *const kJCModel_BindedFranchiserOrderBaseNeedBindCard = @"needBindCard";
NSString *const kJCModel_BindedFranchiserOrderBaseFranchiserOrder = @"franchiserOrder";
NSString *const kJCModel_BindedFranchiserOrderBaseCommand = @"command";


@interface JCModel_BindedFranchiserOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BindedFranchiserOrderBase

@synthesize waterCardId = _waterCardId;
@synthesize current = _current;
@synthesize needBindCard = _needBindCard;
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
            self.waterCardId = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderBaseWaterCardId fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderBaseCurrent fromDictionary:dict];
            self.needBindCard = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderBaseNeedBindCard fromDictionary:dict];
            self.franchiserOrder = [JCModel_BindedFranchiserOrderFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_BindedFranchiserOrderBaseFranchiserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_BindedFranchiserOrderBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.waterCardId forKey:kJCModel_BindedFranchiserOrderBaseWaterCardId];
    [mutableDict setValue:self.current forKey:kJCModel_BindedFranchiserOrderBaseCurrent];
    [mutableDict setValue:self.needBindCard forKey:kJCModel_BindedFranchiserOrderBaseNeedBindCard];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_BindedFranchiserOrderBaseFranchiserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_BindedFranchiserOrderBaseCommand];

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

    self.waterCardId = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderBaseWaterCardId];
    self.current = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderBaseCurrent];
    self.needBindCard = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderBaseNeedBindCard];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderBaseFranchiserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_BindedFranchiserOrderBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardId forKey:kJCModel_BindedFranchiserOrderBaseWaterCardId];
    [aCoder encodeObject:_current forKey:kJCModel_BindedFranchiserOrderBaseCurrent];
    [aCoder encodeObject:_needBindCard forKey:kJCModel_BindedFranchiserOrderBaseNeedBindCard];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_BindedFranchiserOrderBaseFranchiserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_BindedFranchiserOrderBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BindedFranchiserOrderBase *copy = [[JCModel_BindedFranchiserOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.waterCardId = [self.waterCardId copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.needBindCard = [self.needBindCard copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
