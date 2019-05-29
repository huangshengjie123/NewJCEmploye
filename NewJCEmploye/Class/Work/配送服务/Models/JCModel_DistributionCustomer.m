//
//  JCModel_DistributionCustomer.m
//
//  Created by   on 2018/7/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DistributionCustomer.h"
#import "JCModel_DistributionCustomerAddressList.h"
#import "JCModel_DistributionCustomerDetail.h"


NSString *const kJCModel_DistributionCustomerAccount = @"account";
NSString *const kJCModel_DistributionCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_DistributionCustomerId = @"id";
NSString *const kJCModel_DistributionCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_DistributionCustomerGuide = @"guide";
NSString *const kJCModel_DistributionCustomerType = @"type";
NSString *const kJCModel_DistributionCustomerName = @"name";
NSString *const kJCModel_DistributionCustomerCreateTime = @"createTime";


@interface JCModel_DistributionCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DistributionCustomer

@synthesize account = _account;
@synthesize customerAddressList = _customerAddressList;
@synthesize customerIdentifier = _customerIdentifier;
@synthesize customerDetail = _customerDetail;
@synthesize guide = _guide;
@synthesize type = _type;
@synthesize name = _name;
@synthesize createTime = _createTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.account = [self objectOrNilForKey:kJCModel_DistributionCustomerAccount fromDictionary:dict];
    NSObject *receivedJCModel_DistributionCustomerAddressList = [dict objectForKey:kJCModel_DistributionCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_DistributionCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_DistributionCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DistributionCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DistributionCustomerAddressList addObject:[JCModel_DistributionCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DistributionCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DistributionCustomerAddressList addObject:[JCModel_DistributionCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DistributionCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_DistributionCustomerAddressList];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_DistributionCustomerId fromDictionary:dict] doubleValue];
            self.customerDetail = [JCModel_DistributionCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_DistributionCustomerCustomerDetail]];
            self.guide = [self objectOrNilForKey:kJCModel_DistributionCustomerGuide fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_DistributionCustomerType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_DistributionCustomerName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_DistributionCustomerCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_DistributionCustomerAccount];
    NSMutableArray *tempArrayForCustomerAddressList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.customerAddressList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCustomerAddressList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCustomerAddressList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_DistributionCustomerCustomerAddressList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_DistributionCustomerId];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_DistributionCustomerCustomerDetail];
    [mutableDict setValue:self.guide forKey:kJCModel_DistributionCustomerGuide];
    [mutableDict setValue:self.type forKey:kJCModel_DistributionCustomerType];
    [mutableDict setValue:self.name forKey:kJCModel_DistributionCustomerName];
    [mutableDict setValue:self.createTime forKey:kJCModel_DistributionCustomerCreateTime];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerAccount];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerCustomerAddressList];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_DistributionCustomerId];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerCustomerDetail];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerGuide];
    self.type = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_DistributionCustomerCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_DistributionCustomerAccount];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_DistributionCustomerCustomerAddressList];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_DistributionCustomerId];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_DistributionCustomerCustomerDetail];
    [aCoder encodeObject:_guide forKey:kJCModel_DistributionCustomerGuide];
    [aCoder encodeObject:_type forKey:kJCModel_DistributionCustomerType];
    [aCoder encodeObject:_name forKey:kJCModel_DistributionCustomerName];
    [aCoder encodeObject:_createTime forKey:kJCModel_DistributionCustomerCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DistributionCustomer *copy = [[JCModel_DistributionCustomer alloc] init];
    
    
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.customerIdentifier = self.customerIdentifier;
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
    }
    
    return copy;
}


@end
