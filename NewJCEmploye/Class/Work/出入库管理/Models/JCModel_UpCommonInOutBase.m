//
//  JCModel_UpCommonInOutBase.m
//
//  Created by   on 2018/7/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_UpCommonInOutBase.h"
#import "JCModel_UpCommonInOutInOutOrder.h"


NSString *const kJCModel_UpCommonInOutBaseCommand = @"command";
NSString *const kJCModel_UpCommonInOutBaseCurrent = @"current";
NSString *const kJCModel_UpCommonInOutBaseInOutOrder = @"inOutOrder";


@interface JCModel_UpCommonInOutBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_UpCommonInOutBase

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
            self.command = [self objectOrNilForKey:kJCModel_UpCommonInOutBaseCommand fromDictionary:dict];
            self.current = [self objectOrNilForKey:kJCModel_UpCommonInOutBaseCurrent fromDictionary:dict];
            self.inOutOrder = [JCModel_UpCommonInOutInOutOrder modelObjectWithDictionary:[dict objectForKey:kJCModel_UpCommonInOutBaseInOutOrder]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.command forKey:kJCModel_UpCommonInOutBaseCommand];
    [mutableDict setValue:self.current forKey:kJCModel_UpCommonInOutBaseCurrent];
    [mutableDict setValue:[self.inOutOrder dictionaryRepresentation] forKey:kJCModel_UpCommonInOutBaseInOutOrder];

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

    self.command = [aDecoder decodeObjectForKey:kJCModel_UpCommonInOutBaseCommand];
    self.current = [aDecoder decodeObjectForKey:kJCModel_UpCommonInOutBaseCurrent];
    self.inOutOrder = [aDecoder decodeObjectForKey:kJCModel_UpCommonInOutBaseInOutOrder];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_command forKey:kJCModel_UpCommonInOutBaseCommand];
    [aCoder encodeObject:_current forKey:kJCModel_UpCommonInOutBaseCurrent];
    [aCoder encodeObject:_inOutOrder forKey:kJCModel_UpCommonInOutBaseInOutOrder];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_UpCommonInOutBase *copy = [[JCModel_UpCommonInOutBase alloc] init];
    
    
    
    if (copy) {

        copy.command = [self.command copyWithZone:zone];
        copy.current = [self.current copyWithZone:zone];
        copy.inOutOrder = [self.inOutOrder copyWithZone:zone];
    }
    
    return copy;
}


@end
