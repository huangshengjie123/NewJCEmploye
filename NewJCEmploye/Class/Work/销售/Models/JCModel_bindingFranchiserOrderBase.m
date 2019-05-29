//
//  JCModel_bindingFranchiserOrderBase.m
//
//  Created by   on 2018/9/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_bindingFranchiserOrderBase.h"
#import "JCModel_bindingFranchiserOrderFranchiserOrder.h"


NSString *const kJCModel_bindingFranchiserOrderBaseWaterCardId = @"waterCardId";
NSString *const kJCModel_bindingFranchiserOrderBaseCurrent = @"current";
NSString *const kJCModel_bindingFranchiserOrderBaseNeedBindCard = @"needBindCard";
NSString *const kJCModel_bindingFranchiserOrderBaseFranchiserOrder = @"franchiserOrder";
NSString *const kJCModel_bindingFranchiserOrderBaseCommand = @"command";


@interface JCModel_bindingFranchiserOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_bindingFranchiserOrderBase

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
            self.waterCardId = [self objectOrNilForKey:kJCModel_bindingFranchiserOrderBaseWaterCardId fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_bindingFranchiserOrderBaseCurrent fromDictionary:dict];
            self.needBindCard = [self objectOrNilForKey:kJCModel_bindingFranchiserOrderBaseNeedBindCard fromDictionary:dict];
            self.franchiserOrder = [JCModel_bindingFranchiserOrderFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_bindingFranchiserOrderBaseFranchiserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_bindingFranchiserOrderBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.waterCardId forKey:kJCModel_bindingFranchiserOrderBaseWaterCardId];
    [mutableDict setValue:self.current forKey:kJCModel_bindingFranchiserOrderBaseCurrent];
    [mutableDict setValue:self.needBindCard forKey:kJCModel_bindingFranchiserOrderBaseNeedBindCard];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_bindingFranchiserOrderBaseFranchiserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_bindingFranchiserOrderBaseCommand];

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

    self.waterCardId = [aDecoder decodeObjectForKey:kJCModel_bindingFranchiserOrderBaseWaterCardId];
    self.current = [aDecoder decodeObjectForKey:kJCModel_bindingFranchiserOrderBaseCurrent];
    self.needBindCard = [aDecoder decodeObjectForKey:kJCModel_bindingFranchiserOrderBaseNeedBindCard];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_bindingFranchiserOrderBaseFranchiserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_bindingFranchiserOrderBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_waterCardId forKey:kJCModel_bindingFranchiserOrderBaseWaterCardId];
    [aCoder encodeObject:_current forKey:kJCModel_bindingFranchiserOrderBaseCurrent];
    [aCoder encodeObject:_needBindCard forKey:kJCModel_bindingFranchiserOrderBaseNeedBindCard];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_bindingFranchiserOrderBaseFranchiserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_bindingFranchiserOrderBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_bindingFranchiserOrderBase *copy = [[JCModel_bindingFranchiserOrderBase alloc] init];
    
    
    
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
