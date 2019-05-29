//
//  JCModel_ShowReturnVisitCustomer.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ShowReturnVisitCustomer.h"
#import "JCModel_ShowReturnVisitCustomerAddressList.h"
#import "JCModel_ShowReturnVisitCustomerDetail.h"


NSString *const kJCModel_ShowReturnVisitCustomerAccount = @"account";
NSString *const kJCModel_ShowReturnVisitCustomerCurCom = @"curCom";
NSString *const kJCModel_ShowReturnVisitCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_ShowReturnVisitCustomerId = @"id";
NSString *const kJCModel_ShowReturnVisitCustomerWxopenid = @"wxopenid";
NSString *const kJCModel_ShowReturnVisitCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_ShowReturnVisitCustomerGuide = @"guide";
NSString *const kJCModel_ShowReturnVisitCustomerTag = @"tag";
NSString *const kJCModel_ShowReturnVisitCustomerType = @"type";
NSString *const kJCModel_ShowReturnVisitCustomerName = @"name";
NSString *const kJCModel_ShowReturnVisitCustomerCreateTime = @"createTime";


@interface JCModel_ShowReturnVisitCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ShowReturnVisitCustomer

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
            self.account = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerAccount fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerCurCom fromDictionary:dict];
    NSObject *receivedJCModel_ShowReturnVisitCustomerAddressList = [dict objectForKey:kJCModel_ShowReturnVisitCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_ShowReturnVisitCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_ShowReturnVisitCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ShowReturnVisitCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ShowReturnVisitCustomerAddressList addObject:[JCModel_ShowReturnVisitCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ShowReturnVisitCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ShowReturnVisitCustomerAddressList addObject:[JCModel_ShowReturnVisitCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ShowReturnVisitCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_ShowReturnVisitCustomerAddressList];
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerId fromDictionary:dict] doubleValue];
            self.wxopenid = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerWxopenid fromDictionary:dict];
            self.customerDetail = [JCModel_ShowReturnVisitCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_ShowReturnVisitCustomerCustomerDetail]];
            self.guide = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerGuide fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerTag fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerType fromDictionary:dict];
            self.name = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerName fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_ShowReturnVisitCustomerCreateTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kJCModel_ShowReturnVisitCustomerAccount];
    [mutableDict setValue:self.curCom forKey:kJCModel_ShowReturnVisitCustomerCurCom];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_ShowReturnVisitCustomerCustomerAddressList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_ShowReturnVisitCustomerId];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_ShowReturnVisitCustomerWxopenid];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_ShowReturnVisitCustomerCustomerDetail];
    [mutableDict setValue:self.guide forKey:kJCModel_ShowReturnVisitCustomerGuide];
    [mutableDict setValue:self.tag forKey:kJCModel_ShowReturnVisitCustomerTag];
    [mutableDict setValue:self.type forKey:kJCModel_ShowReturnVisitCustomerType];
    [mutableDict setValue:self.name forKey:kJCModel_ShowReturnVisitCustomerName];
    [mutableDict setValue:self.createTime forKey:kJCModel_ShowReturnVisitCustomerCreateTime];

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

    self.account = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerAccount];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerCurCom];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerCustomerAddressList];
    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ShowReturnVisitCustomerId];
    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerWxopenid];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerCustomerDetail];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerGuide];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerTag];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerType];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerName];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ShowReturnVisitCustomerCreateTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kJCModel_ShowReturnVisitCustomerAccount];
    [aCoder encodeObject:_curCom forKey:kJCModel_ShowReturnVisitCustomerCurCom];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_ShowReturnVisitCustomerCustomerAddressList];
    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_ShowReturnVisitCustomerId];
    [aCoder encodeObject:_wxopenid forKey:kJCModel_ShowReturnVisitCustomerWxopenid];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_ShowReturnVisitCustomerCustomerDetail];
    [aCoder encodeObject:_guide forKey:kJCModel_ShowReturnVisitCustomerGuide];
    [aCoder encodeObject:_tag forKey:kJCModel_ShowReturnVisitCustomerTag];
    [aCoder encodeObject:_type forKey:kJCModel_ShowReturnVisitCustomerType];
    [aCoder encodeObject:_name forKey:kJCModel_ShowReturnVisitCustomerName];
    [aCoder encodeObject:_createTime forKey:kJCModel_ShowReturnVisitCustomerCreateTime];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ShowReturnVisitCustomer *copy = [[JCModel_ShowReturnVisitCustomer alloc] init];
    
    
    
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
