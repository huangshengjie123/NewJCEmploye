//
//  JCModel_salesReturnStaff.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnStaff.h"


NSString *const kJCModel_salesReturnStaffId = @"id";
NSString *const kJCModel_salesReturnStaffName = @"name";
NSString *const kJCModel_salesReturnStaffMbPhone = @"mbPhone";


@interface JCModel_salesReturnStaff ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnStaff

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
            self.staffIdentifier = [[self objectOrNilForKey:kJCModel_salesReturnStaffId fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kJCModel_salesReturnStaffName fromDictionary:dict];
            self.mbPhone = [self objectOrNilForKey:kJCModel_salesReturnStaffMbPhone fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.staffIdentifier] forKey:kJCModel_salesReturnStaffId];
    [mutableDict setValue:self.name forKey:kJCModel_salesReturnStaffName];
    [mutableDict setValue:self.mbPhone forKey:kJCModel_salesReturnStaffMbPhone];

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

    self.staffIdentifier = [aDecoder decodeDoubleForKey:kJCModel_salesReturnStaffId];
    self.name = [aDecoder decodeObjectForKey:kJCModel_salesReturnStaffName];
    self.mbPhone = [aDecoder decodeObjectForKey:kJCModel_salesReturnStaffMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_staffIdentifier forKey:kJCModel_salesReturnStaffId];
    [aCoder encodeObject:_name forKey:kJCModel_salesReturnStaffName];
    [aCoder encodeObject:_mbPhone forKey:kJCModel_salesReturnStaffMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnStaff *copy = [[JCModel_salesReturnStaff alloc] init];
    
    
    
    if (copy) {

        copy.staffIdentifier = self.staffIdentifier;
        copy.name = [self.name copyWithZone:zone];
        copy.mbPhone = [self.mbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
