//
//  JCModel_NewWorkLogUPLogRows.m
//
//  Created by   on 2018/8/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewWorkLogUPLogRows.h"


NSString *const kJCModel_NewWorkLogUPLogRowsRow = @"row";
NSString *const kJCModel_NewWorkLogUPLogRowsTime = @"time";


@interface JCModel_NewWorkLogUPLogRows ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewWorkLogUPLogRows

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
            self.row = [self objectOrNilForKey:kJCModel_NewWorkLogUPLogRowsRow fromDictionary:dict];
            self.time = [self objectOrNilForKey:kJCModel_NewWorkLogUPLogRowsTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.row forKey:kJCModel_NewWorkLogUPLogRowsRow];
    [mutableDict setValue:self.time forKey:kJCModel_NewWorkLogUPLogRowsTime];

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

    self.row = [aDecoder decodeObjectForKey:kJCModel_NewWorkLogUPLogRowsRow];
    self.time = [aDecoder decodeObjectForKey:kJCModel_NewWorkLogUPLogRowsTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_row forKey:kJCModel_NewWorkLogUPLogRowsRow];
    [aCoder encodeObject:_time forKey:kJCModel_NewWorkLogUPLogRowsTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewWorkLogUPLogRows *copy = [[JCModel_NewWorkLogUPLogRows alloc] init];
    
    
    
    if (copy) {

        copy.row = [self.row copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
    }
    
    return copy;
}


@end
