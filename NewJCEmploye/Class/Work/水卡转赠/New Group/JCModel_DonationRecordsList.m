//
//  JCModel_DonationRecordsList.m
//
//  Created by   on 2018/12/21
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_DonationRecordsList.h"
#import "JCModel_DonationRecordsDonationRecordCosts.h"


NSString *const kJCModel_DonationRecordsListId = @"id";
NSString *const kJCModel_DonationRecordsListComments = @"comments";
NSString *const kJCModel_DonationRecordsListToCardId = @"toCardId";
NSString *const kJCModel_DonationRecordsListToCusName = @"toCusName";
NSString *const kJCModel_DonationRecordsListFromCusName = @"fromCusName";
NSString *const kJCModel_DonationRecordsListCom = @"com";
NSString *const kJCModel_DonationRecordsListUserName = @"userName";
NSString *const kJCModel_DonationRecordsListDonationRecordCosts = @"donationRecordCosts";
NSString *const kJCModel_DonationRecordsListToCusId = @"toCusId";
NSString *const kJCModel_DonationRecordsListCreateTime = @"createTime";
NSString *const kJCModel_DonationRecordsListUpdater = @"updater";
NSString *const kJCModel_DonationRecordsListFromCardId = @"fromCardId";
NSString *const kJCModel_DonationRecordsListFromCusId = @"fromCusId";


@interface JCModel_DonationRecordsList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_DonationRecordsList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize toCardId = _toCardId;
@synthesize toCusName = _toCusName;
@synthesize fromCusName = _fromCusName;
@synthesize com = _com;
@synthesize userName = _userName;
@synthesize donationRecordCosts = _donationRecordCosts;
@synthesize toCusId = _toCusId;
@synthesize createTime = _createTime;
@synthesize updater = _updater;
@synthesize fromCardId = _fromCardId;
@synthesize fromCusId = _fromCusId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_DonationRecordsListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_DonationRecordsListComments fromDictionary:dict];
            self.toCardId = [self objectOrNilForKey:kJCModel_DonationRecordsListToCardId fromDictionary:dict];
            self.toCusName = [self objectOrNilForKey:kJCModel_DonationRecordsListToCusName fromDictionary:dict];
            self.fromCusName = [self objectOrNilForKey:kJCModel_DonationRecordsListFromCusName fromDictionary:dict];
            self.com = [self objectOrNilForKey:kJCModel_DonationRecordsListCom fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kJCModel_DonationRecordsListUserName fromDictionary:dict];
    NSObject *receivedJCModel_DonationRecordsDonationRecordCosts = [dict objectForKey:kJCModel_DonationRecordsListDonationRecordCosts];
    NSMutableArray *parsedJCModel_DonationRecordsDonationRecordCosts = [NSMutableArray array];
    
    if ([receivedJCModel_DonationRecordsDonationRecordCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_DonationRecordsDonationRecordCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_DonationRecordsDonationRecordCosts addObject:[JCModel_DonationRecordsDonationRecordCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_DonationRecordsDonationRecordCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_DonationRecordsDonationRecordCosts addObject:[JCModel_DonationRecordsDonationRecordCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_DonationRecordsDonationRecordCosts]];
    }

    self.donationRecordCosts = [NSArray arrayWithArray:parsedJCModel_DonationRecordsDonationRecordCosts];
            self.toCusId = [[self objectOrNilForKey:kJCModel_DonationRecordsListToCusId fromDictionary:dict] doubleValue];
            self.createTime = [self objectOrNilForKey:kJCModel_DonationRecordsListCreateTime fromDictionary:dict];
            self.updater = [[self objectOrNilForKey:kJCModel_DonationRecordsListUpdater fromDictionary:dict] doubleValue];
            self.fromCardId = [self objectOrNilForKey:kJCModel_DonationRecordsListFromCardId fromDictionary:dict];
            self.fromCusId = [[self objectOrNilForKey:kJCModel_DonationRecordsListFromCusId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_DonationRecordsListId];
    [mutableDict setValue:self.comments forKey:kJCModel_DonationRecordsListComments];
    [mutableDict setValue:self.toCardId forKey:kJCModel_DonationRecordsListToCardId];
    [mutableDict setValue:self.toCusName forKey:kJCModel_DonationRecordsListToCusName];
    [mutableDict setValue:self.fromCusName forKey:kJCModel_DonationRecordsListFromCusName];
    [mutableDict setValue:self.com forKey:kJCModel_DonationRecordsListCom];
    [mutableDict setValue:self.userName forKey:kJCModel_DonationRecordsListUserName];
    NSMutableArray *tempArrayForDonationRecordCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.donationRecordCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDonationRecordCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDonationRecordCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDonationRecordCosts] forKey:kJCModel_DonationRecordsListDonationRecordCosts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.toCusId] forKey:kJCModel_DonationRecordsListToCusId];
    [mutableDict setValue:self.createTime forKey:kJCModel_DonationRecordsListCreateTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updater] forKey:kJCModel_DonationRecordsListUpdater];
    [mutableDict setValue:self.fromCardId forKey:kJCModel_DonationRecordsListFromCardId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fromCusId] forKey:kJCModel_DonationRecordsListFromCusId];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListComments];
    self.toCardId = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListToCardId];
    self.toCusName = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListToCusName];
    self.fromCusName = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListFromCusName];
    self.com = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListCom];
    self.userName = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListUserName];
    self.donationRecordCosts = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListDonationRecordCosts];
    self.toCusId = [aDecoder decodeDoubleForKey:kJCModel_DonationRecordsListToCusId];
    self.createTime = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListCreateTime];
    self.updater = [aDecoder decodeDoubleForKey:kJCModel_DonationRecordsListUpdater];
    self.fromCardId = [aDecoder decodeObjectForKey:kJCModel_DonationRecordsListFromCardId];
    self.fromCusId = [aDecoder decodeDoubleForKey:kJCModel_DonationRecordsListFromCusId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_DonationRecordsListId];
    [aCoder encodeObject:_comments forKey:kJCModel_DonationRecordsListComments];
    [aCoder encodeObject:_toCardId forKey:kJCModel_DonationRecordsListToCardId];
    [aCoder encodeObject:_toCusName forKey:kJCModel_DonationRecordsListToCusName];
    [aCoder encodeObject:_fromCusName forKey:kJCModel_DonationRecordsListFromCusName];
    [aCoder encodeObject:_com forKey:kJCModel_DonationRecordsListCom];
    [aCoder encodeObject:_userName forKey:kJCModel_DonationRecordsListUserName];
    [aCoder encodeObject:_donationRecordCosts forKey:kJCModel_DonationRecordsListDonationRecordCosts];
    [aCoder encodeDouble:_toCusId forKey:kJCModel_DonationRecordsListToCusId];
    [aCoder encodeObject:_createTime forKey:kJCModel_DonationRecordsListCreateTime];
    [aCoder encodeDouble:_updater forKey:kJCModel_DonationRecordsListUpdater];
    [aCoder encodeObject:_fromCardId forKey:kJCModel_DonationRecordsListFromCardId];
    [aCoder encodeDouble:_fromCusId forKey:kJCModel_DonationRecordsListFromCusId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_DonationRecordsList *copy = [[JCModel_DonationRecordsList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.toCardId = [self.toCardId copyWithZone:zone];
        copy.toCusName = [self.toCusName copyWithZone:zone];
        copy.fromCusName = [self.fromCusName copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
        copy.donationRecordCosts = [self.donationRecordCosts copyWithZone:zone];
        copy.toCusId = self.toCusId;
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.updater = self.updater;
        copy.fromCardId = [self.fromCardId copyWithZone:zone];
        copy.fromCusId = self.fromCusId;
    }
    
    return copy;
}


@end
