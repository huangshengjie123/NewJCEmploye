//
//  JCModel_reimbursementCreateReimbursementItems.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementCreateReimbursementItems.h"


NSString *const kJCModel_reimbursementCreateReimbursementItemsType = @"type";
NSString *const kJCModel_reimbursementCreateReimbursementItemsAmount = @"amount";


@interface JCModel_reimbursementCreateReimbursementItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementCreateReimbursementItems

@synthesize type = _type;
@synthesize amount = _amount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.type = [self objectOrNilForKey:kJCModel_reimbursementCreateReimbursementItemsType fromDictionary:dict];
            self.amount = [[self objectOrNilForKey:kJCModel_reimbursementCreateReimbursementItemsAmount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kJCModel_reimbursementCreateReimbursementItemsType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_reimbursementCreateReimbursementItemsAmount];

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

    self.type = [aDecoder decodeObjectForKey:kJCModel_reimbursementCreateReimbursementItemsType];
    self.amount = [aDecoder decodeDoubleForKey:kJCModel_reimbursementCreateReimbursementItemsAmount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kJCModel_reimbursementCreateReimbursementItemsType];
    [aCoder encodeDouble:_amount forKey:kJCModel_reimbursementCreateReimbursementItemsAmount];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementCreateReimbursementItems *copy = [[JCModel_reimbursementCreateReimbursementItems alloc] init];
    
    
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.amount = self.amount;
    }
    
    return copy;
}


@end
