//
//  JCModel_newbusinesstripBase.m
//
//  Created by   on 2019/3/20
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newbusinesstripBase.h"


NSString *const kJCModel_newbusinesstripBaseFrom = @"from";
NSString *const kJCModel_newbusinesstripBaseEnd = @"end";
NSString *const kJCModel_newbusinesstripBaseTo = @"to";
NSString *const kJCModel_newbusinesstripBaseType = @"type";
NSString *const kJCModel_newbusinesstripBaseComment = @"comment";
NSString *const kJCModel_newbusinesstripBaseStart = @"start";


@interface JCModel_newbusinesstripBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newbusinesstripBase

@synthesize from = _from;
@synthesize endProperty = _endProperty;
@synthesize to = _to;
@synthesize type = _type;
@synthesize comment = _comment;
@synthesize start = _start;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.from = [self objectOrNilForKey:kJCModel_newbusinesstripBaseFrom fromDictionary:dict];
            self.endProperty = [self objectOrNilForKey:kJCModel_newbusinesstripBaseEnd fromDictionary:dict];
            self.to = [self objectOrNilForKey:kJCModel_newbusinesstripBaseTo fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_newbusinesstripBaseType fromDictionary:dict];
            self.comment = [self objectOrNilForKey:kJCModel_newbusinesstripBaseComment fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_newbusinesstripBaseStart fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.from forKey:kJCModel_newbusinesstripBaseFrom];
    [mutableDict setValue:self.endProperty forKey:kJCModel_newbusinesstripBaseEnd];
    [mutableDict setValue:self.to forKey:kJCModel_newbusinesstripBaseTo];
    [mutableDict setValue:self.type forKey:kJCModel_newbusinesstripBaseType];
    [mutableDict setValue:self.comment forKey:kJCModel_newbusinesstripBaseComment];
    [mutableDict setValue:self.start forKey:kJCModel_newbusinesstripBaseStart];

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

    self.from = [aDecoder decodeObjectForKey:kJCModel_newbusinesstripBaseFrom];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_newbusinesstripBaseEnd];
    self.to = [aDecoder decodeObjectForKey:kJCModel_newbusinesstripBaseTo];
    self.type = [aDecoder decodeObjectForKey:kJCModel_newbusinesstripBaseType];
    self.comment = [aDecoder decodeObjectForKey:kJCModel_newbusinesstripBaseComment];
    self.start = [aDecoder decodeObjectForKey:kJCModel_newbusinesstripBaseStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_from forKey:kJCModel_newbusinesstripBaseFrom];
    [aCoder encodeObject:_endProperty forKey:kJCModel_newbusinesstripBaseEnd];
    [aCoder encodeObject:_to forKey:kJCModel_newbusinesstripBaseTo];
    [aCoder encodeObject:_type forKey:kJCModel_newbusinesstripBaseType];
    [aCoder encodeObject:_comment forKey:kJCModel_newbusinesstripBaseComment];
    [aCoder encodeObject:_start forKey:kJCModel_newbusinesstripBaseStart];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newbusinesstripBase *copy = [[JCModel_newbusinesstripBase alloc] init];
    
    
    
    if (copy) {

        copy.from = [self.from copyWithZone:zone];
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.to = [self.to copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.comment = [self.comment copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
    }
    
    return copy;
}


@end
