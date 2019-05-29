//
//  JCModel_WorkLogLogRows.m
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkLogLogRows.h"


NSString *const kJCModel_WorkLogLogRowsRow = @"row";
NSString *const kJCModel_WorkLogLogRowsTime = @"time";


@interface JCModel_WorkLogLogRows ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkLogLogRows

@synthesize row = _row;
@synthesize time = _time;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.row = [self objectOrNilForKey:kJCModel_WorkLogLogRowsRow fromDictionary:dict];
            self.time = [self objectOrNilForKey:kJCModel_WorkLogLogRowsTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.row forKey:kJCModel_WorkLogLogRowsRow];
    [mutableDict setValue:self.time forKey:kJCModel_WorkLogLogRowsTime];

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

    self.row = [aDecoder decodeObjectForKey:kJCModel_WorkLogLogRowsRow];
    self.time = [aDecoder decodeObjectForKey:kJCModel_WorkLogLogRowsTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_row forKey:kJCModel_WorkLogLogRowsRow];
    [aCoder encodeObject:_time forKey:kJCModel_WorkLogLogRowsTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkLogLogRows *copy = [[JCModel_WorkLogLogRows alloc] init];
    
    
    
    if (copy) {

        copy.row = [self.row copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
    }
    
    return copy;
}


@end
