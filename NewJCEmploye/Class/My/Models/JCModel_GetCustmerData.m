//
//  JCModel_GetCustmerData.m
//
//  Created by   on 2019/2/25
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_GetCustmerData.h"
#import "JCModel_GetCustmerCustomerAddressList.h"
#import "JCModel_GetCustmerCustomerDetail.h"


NSString *const kJCModel_GetCustmerDataId = @"id";
NSString *const kJCModel_GetCustmerDataGuide = @"guide";
NSString *const kJCModel_GetCustmerDataIntroducer = @"introducer";
NSString *const kJCModel_GetCustmerDataCurCom = @"curCom";
NSString *const kJCModel_GetCustmerDataCustomerAddressList = @"customerAddressList";
NSString *const kJCModel_GetCustmerDataType = @"type";
NSString *const kJCModel_GetCustmerDataTag = @"tag";
NSString *const kJCModel_GetCustmerDataCreateTime = @"createTime";
NSString *const kJCModel_GetCustmerDataWxopenid = @"wxopenid";
NSString *const kJCModel_GetCustmerDataStaffName = @"staffName";
NSString *const kJCModel_GetCustmerDataAccount = @"account";
NSString *const kJCModel_GetCustmerDataCustomerDetail = @"customerDetail";
NSString *const kJCModel_GetCustmerDataName = @"name";


@interface JCModel_GetCustmerData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_GetCustmerData

@synthesize dataIdentifier = _dataIdentifier;
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
            self.dataIdentifier = [[self objectOrNilForKey:kJCModel_GetCustmerDataId fromDictionary:dict] doubleValue];
            self.guide = [[self objectOrNilForKey:kJCModel_GetCustmerDataGuide fromDictionary:dict] doubleValue];
            self.introducer = [self objectOrNilForKey:kJCModel_GetCustmerDataIntroducer fromDictionary:dict];
            self.curCom = [self objectOrNilForKey:kJCModel_GetCustmerDataCurCom fromDictionary:dict];
    NSObject *receivedJCModel_GetCustmerCustomerAddressList = [dict objectForKey:kJCModel_GetCustmerDataCustomerAddressList];
    NSMutableArray *parsedJCModel_GetCustmerCustomerAddressList = [NSMutableArray array];
    
    if ([receivedJCModel_GetCustmerCustomerAddressList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_GetCustmerCustomerAddressList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_GetCustmerCustomerAddressList addObject:[JCModel_GetCustmerCustomerAddressList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_GetCustmerCustomerAddressList isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_GetCustmerCustomerAddressList addObject:[JCModel_GetCustmerCustomerAddressList modelObjectWithDictionary:(NSDictionary *)receivedJCModel_GetCustmerCustomerAddressList]];
    }

    self.customerAddressList = [NSArray arrayWithArray:parsedJCModel_GetCustmerCustomerAddressList];
            self.type = [self objectOrNilForKey:kJCModel_GetCustmerDataType fromDictionary:dict];
            self.tag = [self objectOrNilForKey:kJCModel_GetCustmerDataTag fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_GetCustmerDataCreateTime fromDictionary:dict];
            self.wxopenid = [self objectOrNilForKey:kJCModel_GetCustmerDataWxopenid fromDictionary:dict];
            self.staffName = [self objectOrNilForKey:kJCModel_GetCustmerDataStaffName fromDictionary:dict];
            self.account = [self objectOrNilForKey:kJCModel_GetCustmerDataAccount fromDictionary:dict];
            self.customerDetail = [JCModel_GetCustmerCustomerDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_GetCustmerDataCustomerDetail]];
            self.name = [self objectOrNilForKey:kJCModel_GetCustmerDataName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dataIdentifier] forKey:kJCModel_GetCustmerDataId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_GetCustmerDataGuide];
    [mutableDict setValue:self.introducer forKey:kJCModel_GetCustmerDataIntroducer];
    [mutableDict setValue:self.curCom forKey:kJCModel_GetCustmerDataCurCom];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCustomerAddressList] forKey:kJCModel_GetCustmerDataCustomerAddressList];
    [mutableDict setValue:self.type forKey:kJCModel_GetCustmerDataType];
    [mutableDict setValue:self.tag forKey:kJCModel_GetCustmerDataTag];
    [mutableDict setValue:self.createTime forKey:kJCModel_GetCustmerDataCreateTime];
    [mutableDict setValue:self.wxopenid forKey:kJCModel_GetCustmerDataWxopenid];
    [mutableDict setValue:self.staffName forKey:kJCModel_GetCustmerDataStaffName];
    [mutableDict setValue:self.account forKey:kJCModel_GetCustmerDataAccount];
    [mutableDict setValue:[self.customerDetail dictionaryRepresentation] forKey:kJCModel_GetCustmerDataCustomerDetail];
    [mutableDict setValue:self.name forKey:kJCModel_GetCustmerDataName];

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

    self.dataIdentifier = [aDecoder decodeDoubleForKey:kJCModel_GetCustmerDataId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_GetCustmerDataGuide];
    self.introducer = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataIntroducer];
    self.curCom = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataCurCom];
    self.customerAddressList = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataCustomerAddressList];
    self.type = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataType];
    self.tag = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataTag];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataCreateTime];
    self.wxopenid = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataWxopenid];
    self.staffName = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataStaffName];
    self.account = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataAccount];
    self.customerDetail = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataCustomerDetail];
    self.name = [aDecoder decodeObjectForKey:kJCModel_GetCustmerDataName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dataIdentifier forKey:kJCModel_GetCustmerDataId];
    [aCoder encodeDouble:_guide forKey:kJCModel_GetCustmerDataGuide];
    [aCoder encodeObject:_introducer forKey:kJCModel_GetCustmerDataIntroducer];
    [aCoder encodeObject:_curCom forKey:kJCModel_GetCustmerDataCurCom];
    [aCoder encodeObject:_customerAddressList forKey:kJCModel_GetCustmerDataCustomerAddressList];
    [aCoder encodeObject:_type forKey:kJCModel_GetCustmerDataType];
    [aCoder encodeObject:_tag forKey:kJCModel_GetCustmerDataTag];
    [aCoder encodeObject:_createTime forKey:kJCModel_GetCustmerDataCreateTime];
    [aCoder encodeObject:_wxopenid forKey:kJCModel_GetCustmerDataWxopenid];
    [aCoder encodeObject:_staffName forKey:kJCModel_GetCustmerDataStaffName];
    [aCoder encodeObject:_account forKey:kJCModel_GetCustmerDataAccount];
    [aCoder encodeObject:_customerDetail forKey:kJCModel_GetCustmerDataCustomerDetail];
    [aCoder encodeObject:_name forKey:kJCModel_GetCustmerDataName];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_GetCustmerData *copy = [[JCModel_GetCustmerData alloc] init];
    
    
    
    if (copy) {

        copy.dataIdentifier = self.dataIdentifier;
        copy.guide = self.guide;
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
