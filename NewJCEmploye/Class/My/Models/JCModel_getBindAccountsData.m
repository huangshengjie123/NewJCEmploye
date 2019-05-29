//
//  JCModel_getBindAccountsData.m
//
//  Created by   on 2018/12/14
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getBindAccountsData.h"


NSString *const kJCModel_getBindAccountsDataAccount = @"account";
NSString *const kJCModel_getBindAccountsDataXpath = @"xpath";


@interface JCModel_getBindAccountsData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getBindAccountsData

@synthesize account = _account;
@synthesize xpath = _xpath;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.account = [self objectOrNilForKey:kJCModel_getBindAccountsDataAccount fromDictionary:dict];
            self.xpath = [self objectOrNilForKey:kJCModel_getBindAccountsDataXpath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_getBindAccountsDataAccount];
    [mutableDict setValue:self.xpath forKey:kJCModel_getBindAccountsDataXpath];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsDataAccount];
    self.xpath = [aDecoder decodeObjectForKey:kJCModel_getBindAccountsDataXpath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_getBindAccountsDataAccount];
    [aCoder encodeObject:_xpath forKey:kJCModel_getBindAccountsDataXpath];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getBindAccountsData *copy = [[JCModel_getBindAccountsData alloc] init];
    
    
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.xpath = [self.xpath copyWithZone:zone];
    }
    
    return copy;
}


@end
