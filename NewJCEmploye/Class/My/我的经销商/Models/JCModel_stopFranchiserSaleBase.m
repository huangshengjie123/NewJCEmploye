//
//  JCModel_stopFranchiserSaleBase.m
//
//  Created by   on 2019/4/23
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_stopFranchiserSaleBase.h"
#import "JCModel_stopFranchiserSaleFranchiserInOutOrder.h"


NSString *const kJCModel_stopFranchiserSaleBaseCommand = @"command";
NSString *const kJCModel_stopFranchiserSaleBaseFranchiserInOutOrder = @"franchiserInOutOrder";


@interface JCModel_stopFranchiserSaleBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_stopFranchiserSaleBase

@synthesize command = _command;
@synthesize franchiserInOutOrder = _franchiserInOutOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_stopFranchiserSaleBaseCommand fromDictionary:dict];
            self.franchiserInOutOrder = [JCModel_stopFranchiserSaleFranchiserInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_stopFranchiserSaleBaseFranchiserInOutOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_stopFranchiserSaleBaseCommand];
    [mutableDict setValue:[self.franchiserInOutOrder dictionaryRepresentation] forKey:kJCModel_stopFranchiserSaleBaseFranchiserInOutOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_stopFranchiserSaleBaseCommand];
    self.franchiserInOutOrder = [aDecoder decodeObjectForKey:kJCModel_stopFranchiserSaleBaseFranchiserInOutOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_stopFranchiserSaleBaseCommand];
    [aCoder encodeObject:_franchiserInOutOrder forKey:kJCModel_stopFranchiserSaleBaseFranchiserInOutOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_stopFranchiserSaleBase *copy = [[JCModel_stopFranchiserSaleBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.franchiserInOutOrder = [self.franchiserInOutOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
