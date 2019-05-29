//
//  JCModel_SellOrderCustomer.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderCustomer.h"
#import "JCModel_SellOrderCustomerAddressList.h"
#import "JCModel_SellOrderCustomerDetail.h"


NSString *const kJCModel_SellOrderCustomerAccount = @"account";
NSString *const kJCModel_SellOrderCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_SellOrderCustomerId = @"id";
NSString *const kJCModel_SellOrderCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_SellOrderCustomerGuide = @"guide";
NSString *const kJCModel_SellOrderCustomerTag = @"tag";
NSString *const kJCModel_SellOrderCustomerType = @"type";
NSString *const kJCModel_SellOrderCustomerName = @"name";
NSString *const kJCModel_SellOrderCustomerCreateTime = @"createTime";


@interface JCModel_SellOrderCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderCustomer

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
            self.account = [self objectOrNilForKey:kJCModel_SellOrderCustomerAccount fromDictionary:dict];
    NSObject *receivedJCModel_SellOrderCustomerAddressList = [dict objectForKey:kJCModel_SellOrderCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_SellOrderCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_SellOrderCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_SellOrderCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_SellOrderCustomerAddressList addObject:[JCModel_SellOrderCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_SellOrderCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_SellOrderCustomerAddressList addObject:[JCModel_SellOrderCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_SellOrderCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_SellOrderCustomerAddressList];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_SellOrderCustomerId fromDictionary:dict] doubleValue];
            self.customerDetail = [JCModel_SellOrderCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_SellOrderCustomerCustomerDetail]];
            self.guide = [self objectOrNilForKey:kJCModel_SellOrderCustomerGuide fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_SellOrderCustomerTag fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_SellOrderCustomerType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_SellOrderCustomerName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_SellOrderCustomerCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_SellOrderCustomerAccount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_SellOrderCustomerCustomerAddressList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_SellOrderCustomerId];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_SellOrderCustomerCustomerDetail];
    [mutableDict setValue:self.guide forKey:kJCModel_SellOrderCustomerGuide];
    [mutableDict setValue:self.tag forKey:kJCModel_SellOrderCustomerTag];
    [mutableDict setValue:self.type forKey:kJCModel_SellOrderCustomerType];
    [mutableDict setValue:self.name forKey:kJCModel_SellOrderCustomerName];
    [mutableDict setValue:self.createTime forKey:kJCModel_SellOrderCustomerCreateTime];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerAccount];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerCustomerAddressList];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_SellOrderCustomerId];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerCustomerDetail];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerGuide];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerTag];
    self.type = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_SellOrderCustomerCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_SellOrderCustomerAccount];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_SellOrderCustomerCustomerAddressList];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_SellOrderCustomerId];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_SellOrderCustomerCustomerDetail];
    [aCoder encodeObject:_guide forKey:kJCModel_SellOrderCustomerGuide];
    [aCoder encodeObject:_tag forKey:kJCModel_SellOrderCustomerTag];
    [aCoder encodeObject:_type forKey:kJCModel_SellOrderCustomerType];
    [aCoder encodeObject:_name forKey:kJCModel_SellOrderCustomerName];
    [aCoder encodeObject:_createTime forKey:kJCModel_SellOrderCustomerCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderCustomer *copy = [[JCModel_SellOrderCustomer alloc] init];
    
    
    
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
