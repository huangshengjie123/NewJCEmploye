//
//  JCModel_BranchApprovalBase.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BranchApprovalBase.h"
#import "JCModel_BranchApprovalPurchaserOrder.h"


NSString *const kJCModel_BranchApprovalBaseCommand = @"command";
NSString *const kJCModel_BranchApprovalBaseCurrent = @"current";
NSString *const kJCModel_BranchApprovalBasePurchaserOrder = @"purchaserOrder";


@interface JCModel_BranchApprovalBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BranchApprovalBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize purchaserOrder = _purchaserOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_BranchApprovalBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_BranchApprovalBaseCurrent fromDictionary:dict];
            self.purchaserOrder = [JCModel_BranchApprovalPurchaserOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_BranchApprovalBasePurchaserOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_BranchApprovalBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_BranchApprovalBaseCurrent];
    [mutableDict setValue:[self.purchaserOrder dictionaryRepresentation] forKey:kJCModel_BranchApprovalBasePurchaserOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_BranchApprovalBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_BranchApprovalBaseCurrent];
    self.purchaserOrder = [aDecoder decodeObjectForKey:kJCModel_BranchApprovalBasePurchaserOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_BranchApprovalBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_BranchApprovalBaseCurrent];
    [aCoder encodeObject:_purchaserOrder forKey:kJCModel_BranchApprovalBasePurchaserOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BranchApprovalBase *copy = [[JCModel_BranchApprovalBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.purchaserOrder = [self.purchaserOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
