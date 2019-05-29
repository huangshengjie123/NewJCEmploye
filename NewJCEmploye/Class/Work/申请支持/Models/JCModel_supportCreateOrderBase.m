//
//  JCModel_supportCreateOrderBase.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_supportCreateOrderBase.h"
#import "JCModel_supportCreateOrderFranchiserOrder.h"


NSString *const kJCModel_supportCreateOrderBaseCurrent = @"current";
NSString *const kJCModel_supportCreateOrderBaseStoreHourse = @"storeHourse";
NSString *const kJCModel_supportCreateOrderBaseFranchiserOrder = @"franchiserOrder";
NSString *const kJCModel_supportCreateOrderBaseCommand = @"command";


@interface JCModel_supportCreateOrderBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_supportCreateOrderBase

@synthesize current = _current;
@synthesize storeHourse = _storeHourse;
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
            self.current = [self objectOrNilForKey:kJCModel_supportCreateOrderBaseCurrent fromDictionary:dict];
            self.storeHourse = [self objectOrNilForKey:kJCModel_supportCreateOrderBaseStoreHourse fromDictionary:dict];
            self.franchiserOrder = [JCModel_supportCreateOrderFranchiserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_supportCreateOrderBaseFranchiserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_supportCreateOrderBaseCommand fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_supportCreateOrderBaseCurrent];
    [mutableDict setValue:self.storeHourse forKey:kJCModel_supportCreateOrderBaseStoreHourse];
    [mutableDict setValue:[self.franchiserOrder dictionaryRepresentation] forKey:kJCModel_supportCreateOrderBaseFranchiserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_supportCreateOrderBaseCommand];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderBaseCurrent];
    self.storeHourse = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderBaseStoreHourse];
    self.franchiserOrder = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderBaseFranchiserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_supportCreateOrderBaseCommand];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_supportCreateOrderBaseCurrent];
    [aCoder encodeObject:_storeHourse forKey:kJCModel_supportCreateOrderBaseStoreHourse];
    [aCoder encodeObject:_franchiserOrder forKey:kJCModel_supportCreateOrderBaseFranchiserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_supportCreateOrderBaseCommand];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_supportCreateOrderBase *copy = [[JCModel_supportCreateOrderBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.storeHourse = [self.storeHourse copyWithZone:zone];
        copy.franchiserOrder = [self.franchiserOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
    }
    
    return copy;
}


@end
