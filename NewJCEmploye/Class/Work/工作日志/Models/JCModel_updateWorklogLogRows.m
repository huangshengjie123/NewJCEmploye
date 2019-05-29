//
//  JCModel_updateWorklogLogRows.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_updateWorklogLogRows.h"


NSString *const kJCModel_updateWorklogLogRowsRow = @"row";
NSString *const kJCModel_updateWorklogLogRowsTime = @"time";


@interface JCModel_updateWorklogLogRows ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_updateWorklogLogRows

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
            self.row = [self objectOrNilForKey:kJCModel_updateWorklogLogRowsRow fromDictionary:dict];
            self.time = [self objectOrNilForKey:kJCModel_updateWorklogLogRowsTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.row forKey:kJCModel_updateWorklogLogRowsRow];
    [mutableDict setValue:self.time forKey:kJCModel_updateWorklogLogRowsTime];

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

    self.row = [aDecoder decodeObjectForKey:kJCModel_updateWorklogLogRowsRow];
    self.time = [aDecoder decodeObjectForKey:kJCModel_updateWorklogLogRowsTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_row forKey:kJCModel_updateWorklogLogRowsRow];
    [aCoder encodeObject:_time forKey:kJCModel_updateWorklogLogRowsTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_updateWorklogLogRows *copy = [[JCModel_updateWorklogLogRows alloc] init];
    
    
    
    if (copy) {

        copy.row = [self.row copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
    }
    
    return copy;
}


@end
