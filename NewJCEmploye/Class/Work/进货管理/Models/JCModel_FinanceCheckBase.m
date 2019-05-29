//
//  JCModel_FinanceCheckBase.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_FinanceCheckBase.h"
#import "JCModel_FinanceCheckPurchaserOrder.h"


NSString *const kJCModel_FinanceCheckBaseCurrent = @"current";
NSString *const kJCModel_FinanceCheckBasePurchaserOrder = @"purchaserOrder";
NSString *const kJCModel_FinanceCheckBaseCommand = @"command";
NSString *const kJCModel_FinanceCheckBaseFinanceCheck = @"financeCheck";


@interface JCModel_FinanceCheckBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_FinanceCheckBase

@synthesize current = _current;
@synthesize purchaserOrder = _purchaserOrder;
@synthesize command = _command;
@synthesize financeCheck = _financeCheck;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.current = [self objectOrNilForKey:kJCModel_FinanceCheckBaseCurrent fromDictionary:dict];
            self.purchaserOrder = [JCModel_FinanceCheckPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_FinanceCheckBasePurchaserOrder]];
            self.command = [self objectOrNilForKey:kJCModel_FinanceCheckBaseCommand fromDictionary:dict];
            self.financeCheck = [self objectOrNilForKey:kJCModel_FinanceCheckBaseFinanceCheck fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.current forKey:kJCModel_FinanceCheckBaseCurrent];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_FinanceCheckBasePurchaserOrder];
    [mutableDict setValue:self.command forKey:kJCModel_FinanceCheckBaseCommand];
    [mutableDict setValue:self.financeCheck forKey:kJCModel_FinanceCheckBaseFinanceCheck];

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

    self.current = [aDecoder decodeObjectForKey:kJCModel_FinanceCheckBaseCurrent];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_FinanceCheckBasePurchaserOrder];
    self.command = [aDecoder decodeObjectForKey:kJCModel_FinanceCheckBaseCommand];
    self.financeCheck = [aDecoder decodeObjectForKey:kJCModel_FinanceCheckBaseFinanceCheck];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_current forKey:kJCModel_FinanceCheckBaseCurrent];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_FinanceCheckBasePurchaserOrder];
    [aCoder encodeObject:_command forKey:kJCModel_FinanceCheckBaseCommand];
    [aCoder encodeObject:_financeCheck forKey:kJCModel_FinanceCheckBaseFinanceCheck];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_FinanceCheckBase *copy = [[JCModel_FinanceCheckBase alloc] init];
    
    
    
    if (copy) {

        copy.current = [self.current copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
        copy.command = [self.command copyWithZone:zone];
        copy.financeCheck = [self.financeCheck copyWithZone:zone];
    }
    
    return copy;
}


@end
