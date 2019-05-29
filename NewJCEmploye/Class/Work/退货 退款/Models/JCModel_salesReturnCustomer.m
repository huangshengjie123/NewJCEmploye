//
//  JCModel_salesReturnCustomer.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnCustomer.h"


NSString *const kJCModel_salesReturnCustomerAccount = @"account";
NSString *const kJCModel_salesReturnCustomerName = @"name";


@interface JCModel_salesReturnCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnCustomer

@synthesize account = _account;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.account = [self objectOrNilForKey:kJCModel_salesReturnCustomerAccount fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_salesReturnCustomerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_salesReturnCustomerAccount];
    [mutableDict setValue:self.name forKey:kJCModel_salesReturnCustomerName];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_salesReturnCustomerAccount];
    self.name = [aDecoder decodeObjectForKey:kJCModel_salesReturnCustomerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_salesReturnCustomerAccount];
    [aCoder encodeObject:_name forKey:kJCModel_salesReturnCustomerName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnCustomer *copy = [[JCModel_salesReturnCustomer alloc] init];
    
    
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
