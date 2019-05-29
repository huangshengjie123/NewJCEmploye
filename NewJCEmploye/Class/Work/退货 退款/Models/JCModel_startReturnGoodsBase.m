//
//  JCModel_startReturnGoodsBase.m
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_startReturnGoodsBase.h"
#import "JCModel_startReturnGoodsRefundment.h"


NSString *const kJCModel_startReturnGoodsBaseCommand = @"command";
NSString *const kJCModel_startReturnGoodsBaseRefundment = @"refundment";


@interface JCModel_startReturnGoodsBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_startReturnGoodsBase

@synthesize command = _command;
@synthesize refundment = _refundment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_startReturnGoodsBaseCommand fromDictionary:dict];
            self.refundment = [JCModel_startReturnGoodsRefundment modelObjectWithDictionary:[dict objectForKey:kJCModel_startReturnGoodsBaseRefundment]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_startReturnGoodsBaseCommand];
    [mutableDict setValue:[self.refundment dictionaryRepresentation] forKey:kJCModel_startReturnGoodsBaseRefundment];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_startReturnGoodsBaseCommand];
    self.refundment = [aDecoder decodeObjectForKey:kJCModel_startReturnGoodsBaseRefundment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_startReturnGoodsBaseCommand];
    [aCoder encodeObject:_refundment forKey:kJCModel_startReturnGoodsBaseRefundment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_startReturnGoodsBase *copy = [[JCModel_startReturnGoodsBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.refundment = [self.refundment copyWithZone:zone];
    }
    
    return copy;
}


@end
