//
//  JCModel_NewDistributionCarDetailsCustomer.m
//
//  Created by   on 2018/10/25
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewDistributionCarDetailsCustomer.h"
#import "JCModel_NewDistributionCarDetailsCustomerAddressList.h"
#import "JCModel_NewDistributionCarDetailsCustomerDetail.h"


NSString *const kJCModel_NewDistributionCarDetailsCustomerAccount = @"account";
NSString *const kJCModel_NewDistributionCarDetailsCustomerCurCom = @"curCom";
NSString *const kJCModel_NewDistributionCarDetailsCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_NewDistributionCarDetailsCustomerId = @"id";
NSString *const kJCModel_NewDistributionCarDetailsCustomerWxopenid = @"wxopenid";
NSString *const kJCModel_NewDistributionCarDetailsCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_NewDistributionCarDetailsCustomerGuide = @"guide";
NSString *const kJCModel_NewDistributionCarDetailsCustomerTag = @"tag";
NSString *const kJCModel_NewDistributionCarDetailsCustomerType = @"type";
NSString *const kJCModel_NewDistributionCarDetailsCustomerName = @"name";
NSString *const kJCModel_NewDistributionCarDetailsCustomerCreateTime = @"createTime";


@interface JCModel_NewDistributionCarDetailsCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewDistributionCarDetailsCustomer

@synthesize account = _account;
@synthesize curCom = _curCom;
@synthesize customerAddressList = _customerAddressList;
@synthesize customerIdentifier = _customerIdentifier;
@synthesize wxopenid = _wxopenid;
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
            self.account = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerAccount fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerCurCom fromDictionary:dict];
    NSObject *receivedJCModel_NewDistributionCarDetailsCustomerAddressList = [dict objectForKey:kJCModel_NewDistributionCarDetailsCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_NewDistributionCarDetailsCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_NewDistributionCarDetailsCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_NewDistributionCarDetailsCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_NewDistributionCarDetailsCustomerAddressList addObject:[JCModel_NewDistributionCarDetailsCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_NewDistributionCarDetailsCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_NewDistributionCarDetailsCustomerAddressList addObject:[JCModel_NewDistributionCarDetailsCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_NewDistributionCarDetailsCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_NewDistributionCarDetailsCustomerAddressList];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerId fromDictionary:dict] doubleValue];
            self.wxopenid = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerWxopenid fromDictionary:dict];
            self.customerDetail = [JCModel_NewDistributionCarDetailsCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_NewDistributionCarDetailsCustomerCustomerDetail]];
            self.guide = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerGuide fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerTag fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_NewDistributionCarDetailsCustomerCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_NewDistributionCarDetailsCustomerAccount];
    [mutableDict setValue:self.curCom forKey:kJCModel_NewDistributionCarDetailsCustomerCurCom];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_NewDistributionCarDetailsCustomerCustomerAddressList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_NewDistributionCarDetailsCustomerId];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_NewDistributionCarDetailsCustomerWxopenid];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_NewDistributionCarDetailsCustomerCustomerDetail];
    [mutableDict setValue:self.guide forKey:kJCModel_NewDistributionCarDetailsCustomerGuide];
    [mutableDict setValue:self.tag forKey:kJCModel_NewDistributionCarDetailsCustomerTag];
    [mutableDict setValue:self.type forKey:kJCModel_NewDistributionCarDetailsCustomerType];
    [mutableDict setValue:self.name forKey:kJCModel_NewDistributionCarDetailsCustomerName];
    [mutableDict setValue:self.createTime forKey:kJCModel_NewDistributionCarDetailsCustomerCreateTime];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerAccount];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerCurCom];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerCustomerAddressList];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_NewDistributionCarDetailsCustomerId];
    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerWxopenid];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerCustomerDetail];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerGuide];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerTag];
    self.type = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_NewDistributionCarDetailsCustomerCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_NewDistributionCarDetailsCustomerAccount];
    [aCoder encodeObject:_curCom forKey:kJCModel_NewDistributionCarDetailsCustomerCurCom];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_NewDistributionCarDetailsCustomerCustomerAddressList];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_NewDistributionCarDetailsCustomerId];
    [aCoder encodeObject:_wxopenid forKey:kJCModel_NewDistributionCarDetailsCustomerWxopenid];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_NewDistributionCarDetailsCustomerCustomerDetail];
    [aCoder encodeObject:_guide forKey:kJCModel_NewDistributionCarDetailsCustomerGuide];
    [aCoder encodeObject:_tag forKey:kJCModel_NewDistributionCarDetailsCustomerTag];
    [aCoder encodeObject:_type forKey:kJCModel_NewDistributionCarDetailsCustomerType];
    [aCoder encodeObject:_name forKey:kJCModel_NewDistributionCarDetailsCustomerName];
    [aCoder encodeObject:_createTime forKey:kJCModel_NewDistributionCarDetailsCustomerCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewDistributionCarDetailsCustomer *copy = [[JCModel_NewDistributionCarDetailsCustomer alloc] init];
    
    
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.curCom = [self.curCom copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.customerIdentifier = self.customerIdentifier;
        copy.wxopenid = [self.wxopenid copyWithZone:zone];
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
