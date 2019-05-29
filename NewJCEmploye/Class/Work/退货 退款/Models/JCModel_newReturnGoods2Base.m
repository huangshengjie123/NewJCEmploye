//
//  JCModel_newReturnGoods2Base.m
//
//  Created by   on 2019/1/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnGoods2Base.h"
#import "JCModel_newReturnGoods2Refundment.h"


NSString *const kJCModel_newReturnGoods2BaseCommand = @"command";
NSString *const kJCModel_newReturnGoods2BaseCurrent = @"current";
NSString *const kJCModel_newReturnGoods2BaseRefundment = @"refundment";


@interface JCModel_newReturnGoods2Base ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnGoods2Base

@synthesize command = _command;
@synthesize current = _current;
@synthesize refundment = _refundment;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_newReturnGoods2BaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_newReturnGoods2BaseCurrent fromDictionary:dict];
            self.refundment = [JCModel_newReturnGoods2Refundment modelObjectWithDictionary:[dict objectForKey:kJCModel_newReturnGoods2BaseRefundment]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_newReturnGoods2BaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_newReturnGoods2BaseCurrent];
    [mutableDict setValue:[self.refundment dictionaryRepresentation] forKey:kJCModel_newReturnGoods2BaseRefundment];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_newReturnGoods2BaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_newReturnGoods2BaseCurrent];
    self.refundment = [aDecoder decodeObjectForKey:kJCModel_newReturnGoods2BaseRefundment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_newReturnGoods2BaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_newReturnGoods2BaseCurrent];
    [aCoder encodeObject:_refundment forKey:kJCModel_newReturnGoods2BaseRefundment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnGoods2Base *copy = [[JCModel_newReturnGoods2Base alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.refundment = [self.refundment copyWithZone:zone];
    }
    
    return copy;
}


@end
