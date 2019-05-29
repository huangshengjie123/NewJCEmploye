//
//  JCModel_PayBackUpBase.m
//
//  Created by   on 2018/6/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PayBackUpBase.h"
#import "JCModel_PayBackUpOrder.h"


NSString *const kJCModel_PayBackUpBaseCurrent = @"current";
NSString *const kJCModel_PayBackUpBaseOrder = @"order";
NSString *const kJCModel_PayBackUpBaseCommand = @"command";
NSString *const kJCModel_PayBackUpBaseIsFinanceCheck = @"isFinanceCheck";


@interface JCModel_PayBackUpBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PayBackUpBase

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
            self.current = [self objectOrNilForKey:kJCModel_PayBackUpBaseCurrent fromDictionary:dict];
            self.order = [JCModel_PayBackUpOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_PayBackUpBaseOrder]];
            self.command = [self objectOrNilForKey:kJCModel_PayBackUpBaseCommand fromDictionary:dict];
            self.isFinanceCheck = [[self objectOrNilForKey:kJCModel_PayBackUpBaseIsFinanceCheck fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_PayBackUpBaseCurrent];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_PayBackUpBaseOrder];
    [mutableDict setValue:self.command forKey:kJCModel_PayBackUpBaseCommand];
    [mutableDict setValue:[NSNumber numberWithBool:self.isFinanceCheck] forKey:kJCModel_PayBackUpBaseIsFinanceCheck];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_PayBackUpBaseCurrent];
    self.order = [aDecoder decodeObjectForKey:kJCModel_PayBackUpBaseOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_PayBackUpBaseCommand];
    self.isFinanceCheck = [aDecoder decodeBoolForKey:kJCModel_PayBackUpBaseIsFinanceCheck];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_PayBackUpBaseCurrent];
    [aCoder encodeObject:_order forKey:kJCModel_PayBackUpBaseOrder];
    [aCoder encodeObject:_command forKey:kJCModel_PayBackUpBaseCommand];
    [aCoder encodeBool:_isFinanceCheck forKey:kJCModel_PayBackUpBaseIsFinanceCheck];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PayBackUpBase *copy = [[JCModel_PayBackUpBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.isFinanceCheck = self.isFinanceCheck;
    }
    
    return copy;
}


@end
