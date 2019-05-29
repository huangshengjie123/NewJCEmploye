//
//  JCModel_inOutRewriteBase.m
//
//  Created by   on 2018/6/5
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_inOutRewriteBase.h"
#import "JCModel_inOutRewriteInOutOrder.h"


NSString *const kJCModel_inOutRewriteBaseCommand = @"command";
NSString *const kJCModel_inOutRewriteBaseCurrent = @"current";
NSString *const kJCModel_inOutRewriteBaseInOutOrder = @"inOutOrder";


@interface JCModel_inOutRewriteBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_inOutRewriteBase

@synthesize command = _command;
@synthesize current = _current;
@synthesize inOutOrder = _inOutOrder;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.command = [self objectOrNilForKey:kJCModel_inOutRewriteBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_inOutRewriteBaseCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_inOutRewriteInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_inOutRewriteBaseInOutOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_inOutRewriteBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_inOutRewriteBaseCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_inOutRewriteBaseInOutOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_inOutRewriteBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_inOutRewriteBaseCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_inOutRewriteBaseInOutOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_inOutRewriteBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_inOutRewriteBaseCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_inOutRewriteBaseInOutOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_inOutRewriteBase *copy = [[JCModel_inOutRewriteBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
