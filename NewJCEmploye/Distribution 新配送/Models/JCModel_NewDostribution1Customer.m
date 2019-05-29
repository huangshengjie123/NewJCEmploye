//
//  JCModel_NewDostribution1Customer.m
//
//  Created by   on 2018/10/23
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDostribution1Customer.h"
#import "JCModel_NewDostribution1CustomerAddressList.h"
#import "JCModel_NewDostribution1CustomerDetail.h"


NSString *const kJCModel_NewDostribution1CustomerAccount = @"account";
NSString *const kJCModel_NewDostribution1CustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_NewDostribution1CustomerId = @"id";
NSString *const kJCModel_NewDostribution1CustomerWxopenid = @"wxopenid";
NSString *const kJCModel_NewDostribution1CustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_NewDostribution1CustomerTag = @"tag";
NSString *const kJCModel_NewDostribution1CustomerGuide = @"guide";
NSString *const kJCModel_NewDostribution1CustomerType = @"type";
NSString *const kJCModel_NewDostribution1CustomerName = @"name";
NSString *const kJCModel_NewDostribution1CustomerCreateTime = @"createTime";


@interface JCModel_NewDostribution1Customer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDostribution1Customer

@synthesize account = _account;
@synthesize customerAddressList = _customerAddressList;
@synthesize customerIdentifier = _customerIdentifier;
@synthesize wxopenid = _wxopenid;
@synthesize customerDetail = _customerDetail;
@synthesize tag = _tag;
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
            self.account = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerAccount fromDictionary:dict];
    NSObject *receivedJCModel_NewDostribution1CustomerAddressList = [dict objectForKey:kJCModel_NewDostribution1CustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_NewDostribution1CustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_NewDostribution1CustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDostribution1CustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDostribution1CustomerAddressList addObject:[JCModel_NewDostribution1CustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDostribution1CustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDostribution1CustomerAddressList addObject:[JCModel_NewDostribution1CustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDostribution1CustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_NewDostribution1CustomerAddressList];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_NewDostribution1CustomerId fromDictionary:dict] doubleValue];
            self.wxopenid = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerWxopenid fromDictionary:dict];
            self.customerDetail = [JCModel_NewDostribution1CustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDostribution1CustomerCustomerDetail]];
            self.tag = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerTag fromDictionary:dict];
            self.guide = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerGuide fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_NewDostribution1CustomerCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_NewDostribution1CustomerAccount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_NewDostribution1CustomerCustomerAddressList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_NewDostribution1CustomerId];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_NewDostribution1CustomerWxopenid];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_NewDostribution1CustomerCustomerDetail];
    [mutableDict setValue:self.tag forKey:kJCModel_NewDostribution1CustomerTag];
    [mutableDict setValue:self.guide forKey:kJCModel_NewDostribution1CustomerGuide];
    [mutableDict setValue:self.type forKey:kJCModel_NewDostribution1CustomerType];
    [mutableDict setValue:self.name forKey:kJCModel_NewDostribution1CustomerName];
    [mutableDict setValue:self.createTime forKey:kJCModel_NewDostribution1CustomerCreateTime];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerAccount];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerCustomerAddressList];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewDostribution1CustomerId];
    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerWxopenid];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerCustomerDetail];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerTag];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerGuide];
    self.type = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_NewDostribution1CustomerCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_NewDostribution1CustomerAccount];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_NewDostribution1CustomerCustomerAddressList];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_NewDostribution1CustomerId];
    [aCoder encodeObject:_wxopenid forKey:kJCModel_NewDostribution1CustomerWxopenid];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_NewDostribution1CustomerCustomerDetail];
    [aCoder encodeObject:_tag forKey:kJCModel_NewDostribution1CustomerTag];
    [aCoder encodeObject:_guide forKey:kJCModel_NewDostribution1CustomerGuide];
    [aCoder encodeObject:_type forKey:kJCModel_NewDostribution1CustomerType];
    [aCoder encodeObject:_name forKey:kJCModel_NewDostribution1CustomerName];
    [aCoder encodeObject:_createTime forKey:kJCModel_NewDostribution1CustomerCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDostribution1Customer *copy = [[JCModel_NewDostribution1Customer alloc] init];
    
    
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.customerIdentifier = self.customerIdentifier;
        copy.wxopenid = [self.wxopenid copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
    }
    
    return copy;
}


@end
