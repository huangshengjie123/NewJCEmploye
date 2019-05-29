//
//  JCModel_NewPayBackUpBase.m
//
//  Created by   on 2019/1/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewPayBackUpBase.h"
#import "JCModel_NewPayBackUpOrder.h"


NSString *const kJCModel_NewPayBackUpBaseCurrent = @"current";
NSString *const kJCModel_NewPayBackUpBaseOrder = @"order";
NSString *const kJCModel_NewPayBackUpBaseCommand = @"command";
NSString *const kJCModel_NewPayBackUpBaseIsFinanceCheck = @"isFinanceCheck";


@interface JCModel_NewPayBackUpBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewPayBackUpBase

@synthesize current = _current;
@synthesize order = _order;
@synthesize command = _command;
@synthesize isFinanceCheck = _isFinanceCheck;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_NewPayBackUpBaseCurrent fromDictionary:dict];
            self.order = [JCModel_NewPayBackUpOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_NewPayBackUpBaseOrder]];
            self.command = [self objectOrNilForKey:kJCModel_NewPayBackUpBaseCommand fromDictionary:dict];
            self.isFinanceCheck = [[self objectOrNilForKey:kJCModel_NewPayBackUpBaseIsFinanceCheck fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_NewPayBackUpBaseCurrent];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_NewPayBackUpBaseOrder];
    [mutableDict setValue:self.command forKey:kJCModel_NewPayBackUpBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFinanceCheck] forKey:kJCModel_NewPayBackUpBaseIsFinanceCheck];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_NewPayBackUpBaseCurrent];
    self.order = [aDecoder decodeObjectForKey:kJCModel_NewPayBackUpBaseOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_NewPayBackUpBaseCommand];
    self.isFinanceCheck = [aDecoder decodeBoolForKey:kJCModel_NewPayBackUpBaseIsFinanceCheck];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_NewPayBackUpBaseCurrent];
    [aCoder encodeObject:_order forKey:kJCModel_NewPayBackUpBaseOrder];
    [aCoder encodeObject:_command forKey:kJCModel_NewPayBackUpBaseCommand];
    [aCoder encodeBool:_isFinanceCheck forKey:kJCModel_NewPayBackUpBaseIsFinanceCheck];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewPayBackUpBase *copy = [[JCModel_NewPayBackUpBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.isFinanceCheck = self.isFinanceCheck;
    }
    
    return copy;
}


@end
