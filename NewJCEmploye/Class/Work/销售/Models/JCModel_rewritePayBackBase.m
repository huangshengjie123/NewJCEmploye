//
//  JCModel_rewritePayBackBase.m
//
//  Created by   on 2018/6/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_rewritePayBackBase.h"
#import "JCModel_rewritePayBackOrder.h"


NSString *const kJCModel_rewritePayBackBaseCommand = @"command";
NSString *const kJCModel_rewritePayBackBaseCurrent = @"current";
NSString *const kJCModel_rewritePayBackBaseOrder = @"order";


@interface JCModel_rewritePayBackBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_rewritePayBackBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize order = _order;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_rewritePayBackBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_rewritePayBackBaseCurrent fromDictionary:dict];
            self.order = [JCModel_rewritePayBackOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_rewritePayBackBaseOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_rewritePayBackBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_rewritePayBackBaseCurrent];
    [mutableDict setValue:[self.order dictionaryRepresentation] forKey:kJCModel_rewritePayBackBaseOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_rewritePayBackBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_rewritePayBackBaseCurrent];
    self.order = [aDecoder decodeObjectForKey:kJCModel_rewritePayBackBaseOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_rewritePayBackBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_rewritePayBackBaseCurrent];
    [aCoder encodeObject:_order forKey:kJCModel_rewritePayBackBaseOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_rewritePayBackBase *copy = [[JCModel_rewritePayBackBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.order = [self.order copyWithZone:zone];
    }
    
    return copy;
}


@end
