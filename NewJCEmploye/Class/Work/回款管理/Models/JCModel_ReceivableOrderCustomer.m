//
//  JCModel_ReceivableOrderCustomer.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderCustomer.h"
#import "JCModel_ReceivableOrderCustomerAddressList.h"
#import "JCModel_ReceivableOrderCustomerDetail.h"


NSString *const kJCModel_ReceivableOrderCustomerAccount = @"account";
NSString *const kJCModel_ReceivableOrderCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_ReceivableOrderCustomerId = @"id";
NSString *const kJCModel_ReceivableOrderCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_ReceivableOrderCustomerGuide = @"guide";
NSString *const kJCModel_ReceivableOrderCustomerTag = @"tag";
NSString *const kJCModel_ReceivableOrderCustomerType = @"type";
NSString *const kJCModel_ReceivableOrderCustomerName = @"name";
NSString *const kJCModel_ReceivableOrderCustomerCreateTime = @"createTime";


@interface JCModel_ReceivableOrderCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderCustomer

@synthesize account = _account;
@synthesize customerAddressList = _customerAddressList;
@synthesize customerIdentifier = _customerIdentifier;
@synthesize customerDetail = _customerDetail;
@synthesize guide = _guide;
@synthesize tag = _tag;
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
            self.account = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerAccount fromDictionary:dict];
    NSObject *receivedJCModel_ReceivableOrderCustomerAddressList = [dict objectForKey:kJCModel_ReceivableOrderCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_ReceivableOrderCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_ReceivableOrderCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReceivableOrderCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReceivableOrderCustomerAddressList addObject:[JCModel_ReceivableOrderCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReceivableOrderCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReceivableOrderCustomerAddressList addObject:[JCModel_ReceivableOrderCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReceivableOrderCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_ReceivableOrderCustomerAddressList];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_ReceivableOrderCustomerId fromDictionary:dict] doubleValue];
            self.customerDetail = [JCModel_ReceivableOrderCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_ReceivableOrderCustomerCustomerDetail]];
            self.guide = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerGuide fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerTag fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_ReceivableOrderCustomerCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_ReceivableOrderCustomerAccount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_ReceivableOrderCustomerCustomerAddressList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_ReceivableOrderCustomerId];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_ReceivableOrderCustomerCustomerDetail];
    [mutableDict setValue:self.guide forKey:kJCModel_ReceivableOrderCustomerGuide];
    [mutableDict setValue:self.tag forKey:kJCModel_ReceivableOrderCustomerTag];
    [mutableDict setValue:self.type forKey:kJCModel_ReceivableOrderCustomerType];
    [mutableDict setValue:self.name forKey:kJCModel_ReceivableOrderCustomerName];
    [mutableDict setValue:self.createTime forKey:kJCModel_ReceivableOrderCustomerCreateTime];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerAccount];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerCustomerAddressList];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderCustomerId];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerCustomerDetail];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerGuide];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerTag];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ReceivableOrderCustomerCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_ReceivableOrderCustomerAccount];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_ReceivableOrderCustomerCustomerAddressList];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_ReceivableOrderCustomerId];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_ReceivableOrderCustomerCustomerDetail];
    [aCoder encodeObject:_guide forKey:kJCModel_ReceivableOrderCustomerGuide];
    [aCoder encodeObject:_tag forKey:kJCModel_ReceivableOrderCustomerTag];
    [aCoder encodeObject:_type forKey:kJCModel_ReceivableOrderCustomerType];
    [aCoder encodeObject:_name forKey:kJCModel_ReceivableOrderCustomerName];
    [aCoder encodeObject:_createTime forKey:kJCModel_ReceivableOrderCustomerCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderCustomer *copy = [[JCModel_ReceivableOrderCustomer alloc] init];
    
    
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.customerIdentifier = self.customerIdentifier;
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
        copy.guide = [self.guide copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
    }
    
    return copy;
}


@end
