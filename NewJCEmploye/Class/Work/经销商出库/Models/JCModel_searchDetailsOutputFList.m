//
//  JCModel_searchDetailsOutputFList.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFList.h"
#import "JCModel_searchDetailsOutputFItems.h"
#import "JCModel_searchDetailsOutputFApplicantInfo.h"
#import "JCModel_searchDetailsOutputFStoreHouseInfo.h"


NSString *const kJCModel_searchDetailsOutputFListId = @"id";
NSString *const kJCModel_searchDetailsOutputFListComments = @"comments";
NSString *const kJCModel_searchDetailsOutputFListCheckCode = @"checkCode";
NSString *const kJCModel_searchDetailsOutputFListProcessId = @"processId";
NSString *const kJCModel_searchDetailsOutputFListOutTime = @"outTime";
NSString *const kJCModel_searchDetailsOutputFListType = @"type";
NSString *const kJCModel_searchDetailsOutputFListFaOrderId = @"faOrderId";
NSString *const kJCModel_searchDetailsOutputFListChecker = @"checker";
NSString *const kJCModel_searchDetailsOutputFListCreateTime = @"createTime";
NSString *const kJCModel_searchDetailsOutputFListFranchiser = @"franchiser";
NSString *const kJCModel_searchDetailsOutputFListApplicant = @"applicant";
NSString *const kJCModel_searchDetailsOutputFListStoreHouse = @"storeHouse";
NSString *const kJCModel_searchDetailsOutputFListReason = @"reason";
NSString *const kJCModel_searchDetailsOutputFListItems = @"items";
NSString *const kJCModel_searchDetailsOutputFListApplicantInfo = @"applicantInfo";
NSString *const kJCModel_searchDetailsOutputFListStatus = @"status";
NSString *const kJCModel_searchDetailsOutputFListStoreHouseInfo = @"storeHouseInfo";


@interface JCModel_searchDetailsOutputFList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize checkCode = _checkCode;
@synthesize processId = _processId;
@synthesize outTime = _outTime;
@synthesize type = _type;
@synthesize faOrderId = _faOrderId;
@synthesize checker = _checker;
@synthesize createTime = _createTime;
@synthesize franchiser = _franchiser;
@synthesize applicant = _applicant;
@synthesize storeHouse = _storeHouse;
@synthesize reason = _reason;
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
            self.listIdentifier = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListComments fromDictionary:dict];
            self.checkCode = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListCheckCode fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListProcessId fromDictionary:dict];
            self.outTime = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListOutTime fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFListType fromDictionary:dict] doubleValue];
            self.faOrderId = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListFaOrderId fromDictionary:dict];
            self.checker = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFListChecker fromDictionary:dict] doubleValue];
            self.createTime = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListCreateTime fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListFranchiser fromDictionary:dict];
            self.applicant = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFListApplicant fromDictionary:dict] doubleValue];
            self.storeHouse = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFListStoreHouse fromDictionary:dict] doubleValue];
            self.reason = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListReason fromDictionary:dict];
    NSObject *receivedJCModel_searchDetailsOutputFItems = [dict objectForKey:kJCModel_searchDetailsOutputFListItems];
    NSMutableArray *parsedJCModel_searchDetailsOutputFItems = [NSMutableArray array];
    
    if ([receivedJCModel_searchDetailsOutputFItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_searchDetailsOutputFItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_searchDetailsOutputFItems addObject:[JCModel_searchDetailsOutputFItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_searchDetailsOutputFItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_searchDetailsOutputFItems addObject:[JCModel_searchDetailsOutputFItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_searchDetailsOutputFItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_searchDetailsOutputFItems];
            self.applicantInfo = [JCModel_searchDetailsOutputFApplicantInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_searchDetailsOutputFListApplicantInfo]];
            self.status = [self objectOrNilForKey:kJCModel_searchDetailsOutputFListStatus fromDictionary:dict];
            self.storeHouseInfo = [JCModel_searchDetailsOutputFStoreHouseInfo modelObjectWithDictionary:[dict objectForKey:kJCModel_searchDetailsOutputFListStoreHouseInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_searchDetailsOutputFListId];
    [mutableDict setValue:self.comments forKey:kJCModel_searchDetailsOutputFListComments];
    [mutableDict setValue:self.checkCode forKey:kJCModel_searchDetailsOutputFListCheckCode];
    [mutableDict setValue:self.processId forKey:kJCModel_searchDetailsOutputFListProcessId];
    [mutableDict setValue:self.outTime forKey:kJCModel_searchDetailsOutputFListOutTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kJCModel_searchDetailsOutputFListType];
    [mutableDict setValue:self.faOrderId forKey:kJCModel_searchDetailsOutputFListFaOrderId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checker] forKey:kJCModel_searchDetailsOutputFListChecker];
    [mutableDict setValue:self.createTime forKey:kJCModel_searchDetailsOutputFListCreateTime];
    [mutableDict setValue:self.franchiser forKey:kJCModel_searchDetailsOutputFListFranchiser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.applicant] forKey:kJCModel_searchDetailsOutputFListApplicant];
    [mutableDict setValue:[NSNumber numberWithDouble:self.storeHouse] forKey:kJCModel_searchDetailsOutputFListStoreHouse];
    [mutableDict setValue:self.reason forKey:kJCModel_searchDetailsOutputFListReason];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_searchDetailsOutputFListItems];
    [mutableDict setValue:[self.applicantInfo dictionaryRepresentation] forKey:kJCModel_searchDetailsOutputFListApplicantInfo];
    [mutableDict setValue:self.status forKey:kJCModel_searchDetailsOutputFListStatus];
    [mutableDict setValue:[self.storeHouseInfo dictionaryRepresentation] forKey:kJCModel_searchDetailsOutputFListStoreHouseInfo];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListComments];
    self.checkCode = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListCheckCode];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListProcessId];
    self.outTime = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListOutTime];
    self.type = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFListType];
    self.faOrderId = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListFaOrderId];
    self.checker = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFListChecker];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListCreateTime];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListFranchiser];
    self.applicant = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFListApplicant];
    self.storeHouse = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFListStoreHouse];
    self.reason = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListReason];
    self.items = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListItems];
    self.applicantInfo = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListApplicantInfo];
    self.status = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListStatus];
    self.storeHouseInfo = [aDecoder decodeObjectForKey:kJCModel_searchDetailsOutputFListStoreHouseInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_searchDetailsOutputFListId];
    [aCoder encodeObject:_comments forKey:kJCModel_searchDetailsOutputFListComments];
    [aCoder encodeObject:_checkCode forKey:kJCModel_searchDetailsOutputFListCheckCode];
    [aCoder encodeObject:_processId forKey:kJCModel_searchDetailsOutputFListProcessId];
    [aCoder encodeObject:_outTime forKey:kJCModel_searchDetailsOutputFListOutTime];
    [aCoder encodeDouble:_type forKey:kJCModel_searchDetailsOutputFListType];
    [aCoder encodeObject:_faOrderId forKey:kJCModel_searchDetailsOutputFListFaOrderId];
    [aCoder encodeDouble:_checker forKey:kJCModel_searchDetailsOutputFListChecker];
    [aCoder encodeObject:_createTime forKey:kJCModel_searchDetailsOutputFListCreateTime];
    [aCoder encodeObject:_franchiser forKey:kJCModel_searchDetailsOutputFListFranchiser];
    [aCoder encodeDouble:_applicant forKey:kJCModel_searchDetailsOutputFListApplicant];
    [aCoder encodeDouble:_storeHouse forKey:kJCModel_searchDetailsOutputFListStoreHouse];
    [aCoder encodeObject:_reason forKey:kJCModel_searchDetailsOutputFListReason];
    [aCoder encodeObject:_items forKey:kJCModel_searchDetailsOutputFListItems];
    [aCoder encodeObject:_applicantInfo forKey:kJCModel_searchDetailsOutputFListApplicantInfo];
    [aCoder encodeObject:_status forKey:kJCModel_searchDetailsOutputFListStatus];
    [aCoder encodeObject:_storeHouseInfo forKey:kJCModel_searchDetailsOutputFListStoreHouseInfo];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFList *copy = [[JCModel_searchDetailsOutputFList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.checkCode = [self.checkCode copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.outTime = [self.outTime copyWithZone:zone];
        copy.type = self.type;
        copy.faOrderId = [self.faOrderId copyWithZone:zone];
        copy.checker = self.checker;
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.applicant = self.applicant;
        copy.storeHouse = self.storeHouse;
        copy.reason = [self.reason copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
        copy.applicantInfo = [self.applicantInfo copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.storeHouseInfo = [self.storeHouseInfo copyWithZone:zone];
    }
    
    return copy;
}


@end
