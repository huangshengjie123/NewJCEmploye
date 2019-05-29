//
//  JCModel_reimbursementReimbursementItems.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementReimbursementItems.h"


NSString *const kJCModel_reimbursementReimbursementItemsAmount = @"amount";
NSString *const kJCModel_reimbursementReimbursementItemsId = @"id";
NSString *const kJCModel_reimbursementReimbursementItemsTypeName = @"typeName";
NSString *const kJCModel_reimbursementReimbursementItemsType = @"type";


@interface JCModel_reimbursementReimbursementItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementReimbursementItems

@synthesize amount = _amount;
@synthesize reimbursementItemsIdentifier = _reimbursementItemsIdentifier;
@synthesize typeName = _typeName;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.amount = [[self objectOrNilForKey:kJCModel_reimbursementReimbursementItemsAmount fromDictionary:dict] doubleValue];
            self.reimbursementItemsIdentifier = [self objectOrNilForKey:kJCModel_reimbursementReimbursementItemsId fromDictionary:dict];
            self.typeName = [self objectOrNilForKey:kJCModel_reimbursementReimbursementItemsTypeName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_reimbursementReimbursementItemsType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kJCModel_reimbursementReimbursementItemsAmount];
    [mutableDict setValue:self.reimbursementItemsIdentifier forKey:kJCModel_reimbursementReimbursementItemsId];
    [mutableDict setValue:self.typeName forKey:kJCModel_reimbursementReimbursementItemsTypeName];
    [mutableDict setValue:self.type forKey:kJCModel_reimbursementReimbursementItemsType];

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

    self.amount = [aDecoder decodeDoubleForKey:kJCModel_reimbursementReimbursementItemsAmount];
    self.reimbursementItemsIdentifier = [aDecoder decodeObjectForKey:kJCModel_reimbursementReimbursementItemsId];
    self.typeName = [aDecoder decodeObjectForKey:kJCModel_reimbursementReimbursementItemsTypeName];
    self.type = [aDecoder decodeObjectForKey:kJCModel_reimbursementReimbursementItemsType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amount forKey:kJCModel_reimbursementReimbursementItemsAmount];
    [aCoder encodeObject:_reimbursementItemsIdentifier forKey:kJCModel_reimbursementReimbursementItemsId];
    [aCoder encodeObject:_typeName forKey:kJCModel_reimbursementReimbursementItemsTypeName];
    [aCoder encodeObject:_type forKey:kJCModel_reimbursementReimbursementItemsType];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementReimbursementItems *copy = [[JCModel_reimbursementReimbursementItems alloc] init];
    
    
    
    if (copy) {

        copy.amount = self.amount;
        copy.reimbursementItemsIdentifier = [self.reimbursementItemsIdentifier copyWithZone:zone];
        copy.typeName = [self.typeName copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
