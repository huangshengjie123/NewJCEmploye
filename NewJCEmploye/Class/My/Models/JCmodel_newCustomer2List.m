//
//  JCmodel_newCustomer2List.m
//
//  Created by   on 2019/3/30
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_newCustomer2List.h"
#import "JCmodel_newCustomer2CustomerAddressList.h"
#import "JCmodel_newCustomer2CustomerDetail.h"


NSString *const kJCmodel_newCustomer2ListId = @"id";
NSString *const kJCmodel_newCustomer2ListGuide = @"guide";
NSString *const kJCmodel_newCustomer2ListIntroducer = @"introducer";
NSString *const kJCmodel_newCustomer2ListCurCom = @"curCom";
NSString *const kJCmodel_newCustomer2ListCustomerAddressList = @"customerAddressList";
NSString *const kJCmodel_newCustomer2ListStaffMbPhone = @"staffMbPhone";
NSString *const kJCmodel_newCustomer2ListIntroducerName = @"introducerName";
NSString *const kJCmodel_newCustomer2ListType = @"type";
NSString *const kJCmodel_newCustomer2ListTag = @"tag";
NSString *const kJCmodel_newCustomer2ListCreateTime = @"createTime";
NSString *const kJCmodel_newCustomer2ListWxopenid = @"wxopenid";
NSString *const kJCmodel_newCustomer2ListStaffName = @"staffName";
NSString *const kJCmodel_newCustomer2ListCardId = @"cardId";
NSString *const kJCmodel_newCustomer2ListAccount = @"account";
NSString *const kJCmodel_newCustomer2ListCustomerDetail = @"customerDetail";
NSString *const kJCmodel_newCustomer2ListName = @"name";
NSString *const kJCmodel_newCustomer2ListIntroduceMbPhone = @"introduceMbPhone";


@interface JCmodel_newCustomer2List ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_newCustomer2List

@synthesize listIdentifier = _listIdentifier;
@synthesize guide = _guide;
@synthesize introducer = _introducer;
@synthesize curCom = _curCom;
@synthesize customerAddressList = _customerAddressList;
@synthesize staffMbPhone = _staffMbPhone;
@synthesize introducerName = _introducerName;
@synthesize type = _type;
@synthesize tag = _tag;
@synthesize createTime = _createTime;
@synthesize wxopenid = _wxopenid;
@synthesize staffName = _staffName;
@synthesize cardId = _cardId;
@synthesize account = _account;
@synthesize customerDetail = _customerDetail;
@synthesize name = _name;
@synthesize introduceMbPhone = _introduceMbPhone;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [[self objectOrNilForKey:kJCmodel_newCustomer2ListId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCmodel_newCustomer2ListGuide fromDictionary:dict] doubleValue];
            self.introducer = [self objectOrNilForKey:kJCmodel_newCustomer2ListIntroducer fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCmodel_newCustomer2ListCurCom fromDictionary:dict];
    NSObject *receivedJCmodel_newCustomer2CustomerAddressList = [dict objectForKey:kJCmodel_newCustomer2ListCustomerAddressList];
    NSMutableArray *parsedJCmodel_newCustomer2CustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCmodel_newCustomer2CustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCmodel_newCustomer2CustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCmodel_newCustomer2CustomerAddressList addObject:[JCmodel_newCustomer2CustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCmodel_newCustomer2CustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCmodel_newCustomer2CustomerAddressList addObject:[JCmodel_newCustomer2CustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCmodel_newCustomer2CustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCmodel_newCustomer2CustomerAddressList];
            self.staffMbPhone = [self objectOrNilForKey:kJCmodel_newCustomer2ListStaffMbPhone fromDictionary:dict];
            self.introducerName = [self objectOrNilForKey:kJCmodel_newCustomer2ListIntroducerName fromDictionary:dict];
            self.type = [self objectOrNilForKey:kJCmodel_newCustomer2ListType fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCmodel_newCustomer2ListTag fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCmodel_newCustomer2ListCreateTime fromDictionary:dict];
            self.wxopenid = [self objectOrNilForKey:kJCmodel_newCustomer2ListWxopenid fromDictionary:dict];
            self.staffName = [self objectOrNilForKey:kJCmodel_newCustomer2ListStaffName fromDictionary:dict];
            self.cardId = [self objectOrNilForKey:kJCmodel_newCustomer2ListCardId fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCmodel_newCustomer2ListAccount fromDictionary:dict];
            self.customerDetail = [JCmodel_newCustomer2CustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCmodel_newCustomer2ListCustomerDetail]];
            self.name = [self objectOrNilForKey:kJCmodel_newCustomer2ListName fromDictionary:dict];
            self.introduceMbPhone = [self objectOrNilForKey:kJCmodel_newCustomer2ListIntroduceMbPhone fromDictionary:dict];
           self.introducer = [self objectOrNilForKey:kJCmodel_newCustomer2ListIntroducer fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listIdentifier] forKey:kJCmodel_newCustomer2ListId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCmodel_newCustomer2ListGuide];
    [mutableDict setValue:self.introducer forKey:kJCmodel_newCustomer2ListIntroducer];
    [mutableDict setValue:self.curCom forKey:kJCmodel_newCustomer2ListCurCom];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCmodel_newCustomer2ListCustomerAddressList];
    [mutableDict setValue:self.staffMbPhone forKey:kJCmodel_newCustomer2ListStaffMbPhone];
    [mutableDict setValue:self.introducerName forKey:kJCmodel_newCustomer2ListIntroducerName];
    [mutableDict setValue:self.type forKey:kJCmodel_newCustomer2ListType];
    [mutableDict setValue:self.tag forKey:kJCmodel_newCustomer2ListTag];
    [mutableDict setValue:self.createTime forKey:kJCmodel_newCustomer2ListCreateTime];
    [mutableDict setValue:self.wxopenid forKey:kJCmodel_newCustomer2ListWxopenid];
    [mutableDict setValue:self.staffName forKey:kJCmodel_newCustomer2ListStaffName];
    [mutableDict setValue:self.cardId forKey:kJCmodel_newCustomer2ListCardId];
    [mutableDict setValue:self.account forKey:kJCmodel_newCustomer2ListAccount];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCmodel_newCustomer2ListCustomerDetail];
    [mutableDict setValue:self.name forKey:kJCmodel_newCustomer2ListName];
    [mutableDict setValue:self.introduceMbPhone forKey:kJCmodel_newCustomer2ListIntroduceMbPhone];
    [mutableDict setValue:self.introducer forKey:kJCmodel_newCustomer2ListIntroducer];

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

    self.listIdentifier = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2ListId];
    self.guide = [aDecoder decodeDoubleForKey:kJCmodel_newCustomer2ListGuide];
    self.introducer = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListIntroducer];
    self.curCom = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListCurCom];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListCustomerAddressList];
    self.staffMbPhone = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListStaffMbPhone];
    self.introducerName = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListIntroducerName];
    self.type = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListType];
    self.tag = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListTag];
    self.createTime = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListCreateTime];
    self.wxopenid = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListWxopenid];
    self.staffName = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListStaffName];
    self.cardId = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListCardId];
    self.account = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListAccount];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListCustomerDetail];
    self.name = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListName];
    self.introduceMbPhone = [aDecoder decodeObjectForKey:kJCmodel_newCustomer2ListIntroduceMbPhone];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_listIdentifier forKey:kJCmodel_newCustomer2ListId];
    [aCoder encodeDouble:_guide forKey:kJCmodel_newCustomer2ListGuide];
    [aCoder encodeObject:_introducer forKey:kJCmodel_newCustomer2ListIntroducer];
    [aCoder encodeObject:_curCom forKey:kJCmodel_newCustomer2ListCurCom];
    [aCoder encodeObject:_customerAddressList forKey:kJCmodel_newCustomer2ListCustomerAddressList];
    [aCoder encodeObject:_staffMbPhone forKey:kJCmodel_newCustomer2ListStaffMbPhone];
    [aCoder encodeObject:_introducerName forKey:kJCmodel_newCustomer2ListIntroducerName];
    [aCoder encodeObject:_type forKey:kJCmodel_newCustomer2ListType];
    [aCoder encodeObject:_tag forKey:kJCmodel_newCustomer2ListTag];
    [aCoder encodeObject:_createTime forKey:kJCmodel_newCustomer2ListCreateTime];
    [aCoder encodeObject:_wxopenid forKey:kJCmodel_newCustomer2ListWxopenid];
    [aCoder encodeObject:_staffName forKey:kJCmodel_newCustomer2ListStaffName];
    [aCoder encodeObject:_cardId forKey:kJCmodel_newCustomer2ListCardId];
    [aCoder encodeObject:_account forKey:kJCmodel_newCustomer2ListAccount];
    [aCoder encodeObject:_customerDetail forKey:kJCmodel_newCustomer2ListCustomerDetail];
    [aCoder encodeObject:_name forKey:kJCmodel_newCustomer2ListName];
    [aCoder encodeObject:_introduceMbPhone forKey:kJCmodel_newCustomer2ListIntroduceMbPhone];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_newCustomer2List *copy = [[JCmodel_newCustomer2List alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = self.listIdentifier;
        copy.guide = self.guide;
        copy.introducer = (id)[self.introducer copyWithZone:zone];
        copy.curCom = [self.curCom copyWithZone:zone];
        copy.customerAddressList = [self.customerAddressList copyWithZone:zone];
        copy.staffMbPhone = [self.staffMbPhone copyWithZone:zone];
        copy.introducerName = [self.introducerName copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.tag = (id)[self.tag copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.wxopenid = (id)[self.wxopenid copyWithZone:zone];
        copy.staffName = [self.staffName copyWithZone:zone];
        copy.cardId = [self.cardId copyWithZone:zone];
        copy.account = [self.account copyWithZone:zone];
        copy.customerDetail = [self.customerDetail copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.introduceMbPhone = [self.introduceMbPhone copyWithZone:zone];
    }
    
    return copy;
}


@end
