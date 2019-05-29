//
//  JCModel_refundData3Staff.m
//
//  Created by   on 2019/1/31
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_refundData3Staff.h"


NSString *const kJCModel_refundData3StaffId = @"id";
NSString *const kJCModel_refundData3StaffName = @"name";
NSString *const kJCModel_refundData3StaffMbPhone = @"mbPhone";


@interface JCModel_refundData3Staff ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_refundData3Staff

@synthesize staffIdentifier = _staffIdentifier;
@synthesize name = _name;
@synthesize mbPhone = _mbPhone;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.staffIdentifier = [[self objectOrNilForKey:kJCModel_refundData3StaffId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_refundData3StaffName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_refundData3StaffMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.staffIdentifier] forKey:kJCModel_refundData3StaffId];
    [mutableDict setValue:self.name forKey:kJCModel_refundData3StaffName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_refundData3StaffMbPhone];

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

    self.staffIdentifier = [aDecoder decodeDoubleForKey:kJCModel_refundData3StaffId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_refundData3StaffName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_refundData3StaffMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_staffIdentifier forKey:kJCModel_refundData3StaffId];
    [aCoder encodeObject:_name forKey:kJCModel_refundData3StaffName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_refundData3StaffMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_refundData3Staff *copy = [[JCModel_refundData3Staff alloc] init];
    
    
    
    if (copy) {

        copy.staffIdentifier = self.staffIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
