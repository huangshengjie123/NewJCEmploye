//
//  JCModel_getStoreHouseComStoreHouseStaffList.m
//
//  Created by   on 2018/8/31
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseComStoreHouseStaffList.h"


NSString *const kJCModel_getStoreHouseComStoreHouseStaffListId = @"id";
NSString *const kJCModel_getStoreHouseComStoreHouseStaffListNumber = @"number";
NSString *const kJCModel_getStoreHouseComStoreHouseStaffListStaff = @"staff";


@interface JCModel_getStoreHouseComStoreHouseStaffList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseComStoreHouseStaffList

@synthesize storeHouseStaffListIdentifier = _storeHouseStaffListIdentifier;
@synthesize number = _number;
@synthesize staff = _staff;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.storeHouseStaffListIdentifier = [[self objectOrNilForKey:kJCModel_getStoreHouseComStoreHouseStaffListId fromDictionary:dict] doubleValue];
            self.number = [[self objectOrNilForKey:kJCModel_getStoreHouseComStoreHouseStaffListNumber fromDictionary:dict] doubleValue];
            self.staff = [[self objectOrNilForKey:kJCModel_getStoreHouseComStoreHouseStaffListStaff fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouseStaffListIdentifier] forKey:kJCModel_getStoreHouseComStoreHouseStaffListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kJCModel_getStoreHouseComStoreHouseStaffListNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.staff] forKey:kJCModel_getStoreHouseComStoreHouseStaffListStaff];

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

    self.storeHouseStaffListIdentifier = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseComStoreHouseStaffListId];
    self.number = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseComStoreHouseStaffListNumber];
    self.staff = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseComStoreHouseStaffListStaff];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_storeHouseStaffListIdentifier forKey:kJCModel_getStoreHouseComStoreHouseStaffListId];
    [aCoder encodeDouble:_number forKey:kJCModel_getStoreHouseComStoreHouseStaffListNumber];
    [aCoder encodeDouble:_staff forKey:kJCModel_getStoreHouseComStoreHouseStaffListStaff];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseComStoreHouseStaffList *copy = [[JCModel_getStoreHouseComStoreHouseStaffList alloc] init];
    
    
    
    if (copy) {

        copy.storeHouseStaffListIdentifier = self.storeHouseStaffListIdentifier;
        copy.number = self.number;
        copy.staff = self.staff;
    }
    
    return copy;
}


@end
