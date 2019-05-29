//
//  JCModel_deletetuihuoBase.m
//
//  Created by   on 2019/3/28
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_deletetuihuoBase.h"
#import "JCModel_deletetuihuoRefundment.h"


NSString *const kJCModel_deletetuihuoBaseCommand = @"command";
NSString *const kJCModel_deletetuihuoBaseCurrent = @"current";
NSString *const kJCModel_deletetuihuoBaseRefundment = @"refundment";


@interface JCModel_deletetuihuoBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_deletetuihuoBase

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
            self.command = [self objectOrNilForKey:kJCModel_deletetuihuoBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_deletetuihuoBaseCurrent fromDictionary:dict];
            self.refundment = [JCModel_deletetuihuoRefundment modelObjectWithDictionary:[dict objectForKey:kJCModel_deletetuihuoBaseRefundment]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_deletetuihuoBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_deletetuihuoBaseCurrent];
    [mutableDict setValue:[self.refundment dictionaryRepresentation] forKey:kJCModel_deletetuihuoBaseRefundment];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_deletetuihuoBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_deletetuihuoBaseCurrent];
    self.refundment = [aDecoder decodeObjectForKey:kJCModel_deletetuihuoBaseRefundment];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_deletetuihuoBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_deletetuihuoBaseCurrent];
    [aCoder encodeObject:_refundment forKey:kJCModel_deletetuihuoBaseRefundment];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_deletetuihuoBase *copy = [[JCModel_deletetuihuoBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.refundment = [self.refundment copyWithZone:zone];
    }
    
    return copy;
}


@end
