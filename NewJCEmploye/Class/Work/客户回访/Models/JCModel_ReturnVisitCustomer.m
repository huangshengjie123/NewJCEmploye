//
//  JCModel_ReturnVisitCustomer.m
//
//  Created by   on 2019/2/27
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReturnVisitCustomer.h"
#import "JCModel_ReturnVisitCustomerAddressList.h"
#import "JCModel_ReturnVisitCustomerDetail.h"


NSString *const kJCModel_ReturnVisitCustomerId = @"id";
NSString *const kJCModel_ReturnVisitCustomerGuide = @"guide";
NSString *const kJCModel_ReturnVisitCustomerIntroducer = @"introducer";
NSString *const kJCModel_ReturnVisitCustomerCurCom = @"curCom";
NSString *const kJCModel_ReturnVisitCustomerCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_ReturnVisitCustomerType = @"type";
NSString *const kJCModel_ReturnVisitCustomerTag = @"tag";
NSString *const kJCModel_ReturnVisitCustomerCreateTime = @"createTime";
NSString *const kJCModel_ReturnVisitCustomerWxopenid = @"wxopenid";
NSString *const kJCModel_ReturnVisitCustomerStaffName = @"staffName";
NSString *const kJCModel_ReturnVisitCustomerAccount = @"account";
NSString *const kJCModel_ReturnVisitCustomerCustomerDetail = @"customerDetail";
NSString *const kJCModel_ReturnVisitCustomerName = @"name";


@interface JCModel_ReturnVisitCustomer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReturnVisitCustomer

@synthesize customerIdentifier = _customerIdentifier;
@synthesize guide = _guide;
@synthesize introducer = _introducer;
@synthesize curCom = _curCom;
@synthesize customerAddressList = _customerAddressList;
@synthesize type = _type;
@synthesize tag = _tag;
@synthesize createTime = _createTime;
@synthesize wxopenid = _wxopenid;
@synthesize staffName = _staffName;
@synthesize account = _account;
@synthesize customerDetail = _customerDetail;
@synthesize name = _name;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.customerIdentifier = [[self objectOrNilForKey:kJCModel_ReturnVisitCustomerId fromDictionary:dict] doubleValue];
            self.guide = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerGuide fromDictionary:dict];
            self.introducer = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerIntroducer fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerCurCom fromDictionary:dict];
    NSObject *receivedJCModel_ReturnVisitCustomerAddressList = [dict objectForKey:kJCModel_ReturnVisitCustomerCustomerAddressList];
    NSMutableArray *parsedJCModel_ReturnVisitCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_ReturnVisitCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_ReturnVisitCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_ReturnVisitCustomerAddressList addObject:[JCModel_ReturnVisitCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_ReturnVisitCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_ReturnVisitCustomerAddressList addObject:[JCModel_ReturnVisitCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_ReturnVisitCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_ReturnVisitCustomerAddressList];
            self.type = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerType fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerTag fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerCreateTime fromDictionary:dict];
            self.wxopenid = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerWxopenid fromDictionary:dict];
            self.staffName = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerStaffName fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerAccount fromDictionary:dict];
            self.customerDetail = [JCModel_ReturnVisitCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_ReturnVisitCustomerCustomerDetail]];
            self.name = [self objectOrNilForKey:kJCModel_ReturnVisitCustomerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.customerIdentifier] forKey:kJCModel_ReturnVisitCustomerId];
    [mutableDict setValue:self.guide forKey:kJCModel_ReturnVisitCustomerGuide];
    [mutableDict setValue:self.introducer forKey:kJCModel_ReturnVisitCustomerIntroducer];
    [mutableDict setValue:self.curCom forKey:kJCModel_ReturnVisitCustomerCurCom];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_ReturnVisitCustomerCustomerAddressList];
    [mutableDict setValue:self.type forKey:kJCModel_ReturnVisitCustomerType];
    [mutableDict setValue:self.tag forKey:kJCModel_ReturnVisitCustomerTag];
    [mutableDict setValue:self.createTime forKey:kJCModel_ReturnVisitCustomerCreateTime];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_ReturnVisitCustomerWxopenid];
    [mutableDict setValue:self.staffName forKey:kJCModel_ReturnVisitCustomerStaffName];
    [mutableDict setValue:self.account forKey:kJCModel_ReturnVisitCustomerAccount];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_ReturnVisitCustomerCustomerDetail];
    [mutableDict setValue:self.name forKey:kJCModel_ReturnVisitCustomerName];

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

    self.customerIdentifier = [aDecoder decodeDoubleForKey:kJCModel_ReturnVisitCustomerId];
    self.guide = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerGuide];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerIntroducer];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerCurCom];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerCustomerAddressList];
    self.type = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerType];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerTag];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerCreateTime];
    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerWxopenid];
    self.staffName = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerStaffName];
    self.account = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerAccount];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerCustomerDetail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_ReturnVisitCustomerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_customerIdentifier forKey:kJCModel_ReturnVisitCustomerId];
    [aCoder encodeObject:_guide forKey:kJCModel_ReturnVisitCustomerGuide];
    [aCoder encodeObject:_introducer forKey:kJCModel_ReturnVisitCustomerIntroducer];
    [aCoder encodeObject:_curCom forKey:kJCModel_ReturnVisitCustomerCurCom];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_ReturnVisitCustomerCustomerAddressList];
    [aCoder encodeObject:_type forKey:kJCModel_ReturnVisitCustomerType];
    [aCoder encodeObject:_tag forKey:kJCModel_ReturnVisitCustomerTag];
    [aCoder encodeObject:_createTime forKey:kJCModel_ReturnVisitCustomerCreateTime];
    [aCoder encodeObject:_wxopenid forKey:kJCModel_ReturnVisitCustomerWxopenid];
    [aCoder encodeObject:_staffName forKey:kJCModel_ReturnVisitCustomerStaffName];
    [aCoder encodeObject:_account forKey:kJCModel_ReturnVisitCustomerAccount];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_ReturnVisitCustomerCustomerDetail];
    [aCoder encodeObject:_name forKey:kJCModel_ReturnVisitCustomerName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReturnVisitCustomer *copy = [[JCModel_ReturnVisitCustomer alloc] init];
    
    
    
    if (copy) {

        copy.customerIdentifier = self.customerIdentifier;
        copy.guide = [self.guide copyWithZone:zone];
        copy.introducer = [self.introducer copyWithZone:zone];
        copy.curCom = [self.curCom copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.tag = [self.tag copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.wxopenid = [self.wxopenid copyWithZone:zone];
        copy.staffName = [self.staffName copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
