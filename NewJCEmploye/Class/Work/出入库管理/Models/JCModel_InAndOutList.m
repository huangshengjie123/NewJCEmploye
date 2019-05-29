//
//  JCModel_InAndOutList.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutList.h"
#import "JCModel_InAndOutItems.h"
#import "JCModel_InAndOutApplicantInfo.h"
#import "JCModel_InAndOutStoreHouseInfo.h"


NSString *const kJCModel_InAndOutListId = @"id";
NSString *const kJCModel_InAndOutListComments = @"comments";
NSString *const kJCModel_InAndOutListProcessId = @"processId";
NSString *const kJCModel_InAndOutListCheckName = @"checkName";
NSString *const kJCModel_InAndOutListType = @"type";
NSString *const kJCModel_InAndOutListFaOrderId = @"faOrderId";
NSString *const kJCModel_InAndOutListChecker = @"checker";
NSString *const kJCModel_InAndOutListCreateTime = @"createTime";
NSString *const kJCModel_InAndOutListEndTime = @"endTime";
NSString *const kJCModel_InAndOutListReason = @"reason";
NSString *const kJCModel_InAndOutListApplicant = @"applicant";
NSString *const kJCModel_InAndOutListStoreHouse = @"storeHouse";
NSString *const kJCModel_InAndOutListItems = @"items";
NSString *const kJCModel_InAndOutListApplicantInfo = @"applicantInfo";
NSString *const kJCModel_InAndOutListStatus = @"status";
NSString *const kJCModel_InAndOutListStoreHouseInfo = @"storeHouseInfo";


@interface JCModel_InAndOutList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize processId = _processId;
@synthesize checkName = _checkName;
@synthesize type = _type;
@synthesize faOrderId = _faOrderId;
@synthesize checker = _checker;
@synthesize createTime = _createTime;
@synthesize endTime = _endTime;
@synthesize reason = _reason;
@synthesize applicant = _applicant;
@synthesize storeHouse = _storeHouse;
@synthesize items = _items;
@synthesize applicantInfo = _applicantInfo;
@synthesize status = _status;
@synthesize storeHouseInfo = _storeHouseInfo;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_InAndOutListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_InAndOutListComments fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_InAndOutListProcessId fromDictionary:dict];
            self.checkName = [self objectOrNilForKey:kJCModel_InAndOutListCheckName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_InAndOutListType fromDictionary:dict] doubleValue];
            self.faOrderId = [self objectOrNilForKey:kJCModel_InAndOutListFaOrderId fromDictionary:dict];
            self.checker = [self objectOrNilForKey:kJCModel_InAndOutListChecker fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:kJCModel_InAndOutListCreateTime fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kJCModel_InAndOutListEndTime fromDictionary:dict];
            self.reason = [self objectOrNilForKey:kJCModel_InAndOutListReason fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_InAndOutListApplicant fromDictionary:dict] doubleValue];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_InAndOutListStoreHouse fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_InAndOutItems = [dict objectForKey:kJCModel_InAndOutListItems];
    NSMutableArray *parsedJCModel_InAndOutItems = [NSMutableArray array];
    
    if ([receivedJCModel_InAndOutItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_InAndOutItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_InAndOutItems addObject:[JCModel_InAndOutItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_InAndOutItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_InAndOutItems addObject:[JCModel_InAndOutItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_InAndOutItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_InAndOutItems];
            self.applicantInfo = [JCModel_InAndOutApplicantInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_InAndOutListApplicantInfo]];
            self.status = [self objectOrNilForKey:kJCModel_InAndOutListStatus fromDictionary:dict];
            self.storeHouseInfo = [JCModel_InAndOutStoreHouseInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_InAndOutListStoreHouseInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_InAndOutListId];
    [mutableDict setValue:self.comments forKey:kJCModel_InAndOutListComments];
    [mutableDict setValue:self.processId forKey:kJCModel_InAndOutListProcessId];
    [mutableDict setValue:self.checkName forKey:kJCModel_InAndOutListCheckName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_InAndOutListType];
    [mutableDict setValue:self.faOrderId forKey:kJCModel_InAndOutListFaOrderId];
    [mutableDict setValue:self.checker forKey:kJCModel_InAndOutListChecker];
    [mutableDict setValue:self.createTime forKey:kJCModel_InAndOutListCreateTime];
    [mutableDict setValue:self.endTime forKey:kJCModel_InAndOutListEndTime];
    [mutableDict setValue:self.reason forKey:kJCModel_InAndOutListReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_InAndOutListApplicant];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_InAndOutListStoreHouse];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.items) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_InAndOutListItems];
    [mutableDict setValue:[self.applicantInfo dictionaryRepresentation] forKey:kJCModel_InAndOutListApplicantInfo];
    [mutableDict setValue:self.status forKey:kJCModel_InAndOutListStatus];
    [mutableDict setValue:[self.storeHouseInfo dictionaryRepresentation] forKey:kJCModel_InAndOutListStoreHouseInfo];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_InAndOutListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_InAndOutListComments];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_InAndOutListProcessId];
    self.checkName = [aDecoder decodeObjectForKey:kJCModel_InAndOutListCheckName];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_InAndOutListType];
    self.faOrderId = [aDecoder decodeObjectForKey:kJCModel_InAndOutListFaOrderId];
    self.checker = [aDecoder decodeObjectForKey:kJCModel_InAndOutListChecker];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_InAndOutListCreateTime];
    self.endTime = [aDecoder decodeObjectForKey:kJCModel_InAndOutListEndTime];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_InAndOutListReason];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_InAndOutListApplicant];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_InAndOutListStoreHouse];
    self.items = [aDecoder decodeObjectForKey:kJCModel_InAndOutListItems];
    self.applicantInfo = [aDecoder decodeObjectForKey:kJCModel_InAndOutListApplicantInfo];
    self.status = [aDecoder decodeObjectForKey:kJCModel_InAndOutListStatus];
    self.storeHouseInfo = [aDecoder decodeObjectForKey:kJCModel_InAndOutListStoreHouseInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_InAndOutListId];
    [aCoder encodeObject:_comments forKey:kJCModel_InAndOutListComments];
    [aCoder encodeObject:_processId forKey:kJCModel_InAndOutListProcessId];
    [aCoder encodeObject:_checkName forKey:kJCModel_InAndOutListCheckName];
    [aCoder encodeDouble:_type forKey:kJCModel_InAndOutListType];
    [aCoder encodeObject:_faOrderId forKey:kJCModel_InAndOutListFaOrderId];
    [aCoder encodeObject:_checker forKey:kJCModel_InAndOutListChecker];
    [aCoder encodeObject:_createTime forKey:kJCModel_InAndOutListCreateTime];
    [aCoder encodeObject:_endTime forKey:kJCModel_InAndOutListEndTime];
    [aCoder encodeObject:_reason forKey:kJCModel_InAndOutListReason];
    [aCoder encodeDouble:_applicant forKey:kJCModel_InAndOutListApplicant];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_InAndOutListStoreHouse];
    [aCoder encodeObject:_items forKey:kJCModel_InAndOutListItems];
    [aCoder encodeObject:_applicantInfo forKey:kJCModel_InAndOutListApplicantInfo];
    [aCoder encodeObject:_status forKey:kJCModel_InAndOutListStatus];
    [aCoder encodeObject:_storeHouseInfo forKey:kJCModel_InAndOutListStoreHouseInfo];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutList *copy = [[JCModel_InAndOutList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.checkName = [self.checkName copyWithZone:zone];
        copy.type = self.type;
        copy.faOrderId = [self.faOrderId copyWithZone:zone];
        copy.checker = [self.checker copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.reason = [self.reason copyWithZone:zone];
        copy.applicant = self.applicant;
        copy.storeHouse = self.storeHouse;
        copy.items = [self.items copyWithZone:zone];
        copy.applicantInfo = [self.applicantInfo copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.storeHouseInfo = [self.storeHouseInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
