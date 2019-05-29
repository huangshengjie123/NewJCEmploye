//
//  JCModel_probationOrderList.m
//
//  Created by   on 2018/10/8
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_probationOrderList.h"
#import "JCModel_probationOrderProbationCosts.h"
#import "JCModel_probationOrderGuider.h"
#import "JCModel_probationOrderCustomer.h"


NSString *const kJCModel_probationOrderListId = @"id";
NSString *const kJCModel_probationOrderListComments = @"comments";
NSString *const kJCModel_probationOrderListStart = @"start";
NSString *const kJCModel_probationOrderListProcessId = @"processId";
NSString *const kJCModel_probationOrderListGuide = @"guide";
NSString *const kJCModel_probationOrderListHasOut = @"hasOut";
NSString *const kJCModel_probationOrderListProbationCosts = @"probationCosts";
NSString *const kJCModel_probationOrderListGuider = @"guider";
NSString *const kJCModel_probationOrderListCom = @"com";
NSString *const kJCModel_probationOrderListCustomer = @"customer";
NSString *const kJCModel_probationOrderListIsDeal = @"isDeal";
NSString *const kJCModel_probationOrderListPreid = @"preid";
NSString *const kJCModel_probationOrderListEnd = @"end";
NSString *const kJCModel_probationOrderListStatus = @"status";
NSString *const kJCModel_probationOrderListCust = @"cust";


@interface JCModel_probationOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_probationOrderList

@synthesize listIdentifier = _listIdentifier;
@synthesize comments = _comments;
@synthesize start = _start;
@synthesize processId = _processId;
@synthesize guide = _guide;
@synthesize hasOut = _hasOut;
@synthesize probationCosts = _probationCosts;
@synthesize guider = _guider;
@synthesize com = _com;
@synthesize customer = _customer;
@synthesize isDeal = _isDeal;
@synthesize preid = _preid;
@synthesize endProperty = _endProperty;
@synthesize status = _status;
@synthesize cust = _cust;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.listIdentifier = [self objectOrNilForKey:kJCModel_probationOrderListId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_probationOrderListComments fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_probationOrderListStart fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_probationOrderListProcessId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_probationOrderListGuide fromDictionary:dict] doubleValue];
            self.hasOut = [self objectOrNilForKey:kJCModel_probationOrderListHasOut fromDictionary:dict];
    NSObject *receivedJCModel_probationOrderProbationCosts = [dict objectForKey:kJCModel_probationOrderListProbationCosts];
    NSMutableArray *parsedJCModel_probationOrderProbationCosts = [NSMutableArray array];
    
    if ([receivedJCModel_probationOrderProbationCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_probationOrderProbationCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_probationOrderProbationCosts addObject:[JCModel_probationOrderProbationCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_probationOrderProbationCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_probationOrderProbationCosts addObject:[JCModel_probationOrderProbationCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_probationOrderProbationCosts]];
    }

    self.probationCosts = [NSArray arrayWithArray:parsedJCModel_probationOrderProbationCosts];
            self.guider = [JCModel_probationOrderGuider modelObjectWithDictionary:[dict objectForKey:kJCModel_probationOrderListGuider]];
            self.com = [self objectOrNilForKey:kJCModel_probationOrderListCom fromDictionary:dict];
            self.customer = [JCModel_probationOrderCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_probationOrderListCustomer]];
            self.isDeal = [[self objectOrNilForKey:kJCModel_probationOrderListIsDeal fromDictionary:dict] boolValue];
            self.preid = [[self objectOrNilForKey:kJCModel_probationOrderListPreid fromDictionary:dict] doubleValue];
            self.endProperty = [self objectOrNilForKey:kJCModel_probationOrderListEnd fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_probationOrderListStatus fromDictionary:dict];
            self.cust = [self objectOrNilForKey:kJCModel_probationOrderListCust fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.listIdentifier forKey:kJCModel_probationOrderListId];
    [mutableDict setValue:self.comments forKey:kJCModel_probationOrderListComments];
    [mutableDict setValue:self.start forKey:kJCModel_probationOrderListStart];
    [mutableDict setValue:self.processId forKey:kJCModel_probationOrderListProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_probationOrderListGuide];
    [mutableDict setValue:self.hasOut forKey:kJCModel_probationOrderListHasOut];
    NSMutableArray *tempArrayForProbationCosts = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.probationCosts) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForProbationCosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForProbationCosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProbationCosts] forKey:kJCModel_probationOrderListProbationCosts];
    [mutableDict setValue:[self.guider dictionaryRepresentation] forKey:kJCModel_probationOrderListGuider];
    [mutableDict setValue:self.com forKey:kJCModel_probationOrderListCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_probationOrderListCustomer];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDeal] forKey:kJCModel_probationOrderListIsDeal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preid] forKey:kJCModel_probationOrderListPreid];
    [mutableDict setValue:self.endProperty forKey:kJCModel_probationOrderListEnd];
    [mutableDict setValue:self.status forKey:kJCModel_probationOrderListStatus];
    [mutableDict setValue:self.cust forKey:kJCModel_probationOrderListCust];

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

    self.listIdentifier = [aDecoder decodeObjectForKey:kJCModel_probationOrderListId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_probationOrderListComments];
    self.start = [aDecoder decodeObjectForKey:kJCModel_probationOrderListStart];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_probationOrderListProcessId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_probationOrderListGuide];
    self.hasOut = [aDecoder decodeObjectForKey:kJCModel_probationOrderListHasOut];
    self.probationCosts = [aDecoder decodeObjectForKey:kJCModel_probationOrderListProbationCosts];
    self.guider = [aDecoder decodeObjectForKey:kJCModel_probationOrderListGuider];
    self.com = [aDecoder decodeObjectForKey:kJCModel_probationOrderListCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_probationOrderListCustomer];
    self.isDeal = [aDecoder decodeBoolForKey:kJCModel_probationOrderListIsDeal];
    self.preid = [aDecoder decodeDoubleForKey:kJCModel_probationOrderListPreid];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_probationOrderListEnd];
    self.status = [aDecoder decodeObjectForKey:kJCModel_probationOrderListStatus];
    self.cust = [aDecoder decodeObjectForKey:kJCModel_probationOrderListCust];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listIdentifier forKey:kJCModel_probationOrderListId];
    [aCoder encodeObject:_comments forKey:kJCModel_probationOrderListComments];
    [aCoder encodeObject:_start forKey:kJCModel_probationOrderListStart];
    [aCoder encodeObject:_processId forKey:kJCModel_probationOrderListProcessId];
    [aCoder encodeDouble:_guide forKey:kJCModel_probationOrderListGuide];
    [aCoder encodeObject:_hasOut forKey:kJCModel_probationOrderListHasOut];
    [aCoder encodeObject:_probationCosts forKey:kJCModel_probationOrderListProbationCosts];
    [aCoder encodeObject:_guider forKey:kJCModel_probationOrderListGuider];
    [aCoder encodeObject:_com forKey:kJCModel_probationOrderListCom];
    [aCoder encodeObject:_customer forKey:kJCModel_probationOrderListCustomer];
    [aCoder encodeBool:_isDeal forKey:kJCModel_probationOrderListIsDeal];
    [aCoder encodeDouble:_preid forKey:kJCModel_probationOrderListPreid];
    [aCoder encodeObject:_endProperty forKey:kJCModel_probationOrderListEnd];
    [aCoder encodeObject:_status forKey:kJCModel_probationOrderListStatus];
    [aCoder encodeObject:_cust forKey:kJCModel_probationOrderListCust];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_probationOrderList *copy = [[JCModel_probationOrderList alloc] init];
    
    
    
    if (copy) {

        copy.listIdentifier = [self.listIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.guide = self.guide;
        copy.hasOut = [self.hasOut copyWithZone:zone];
        copy.probationCosts = [self.probationCosts copyWithZone:zone];
        copy.guider = [self.guider copyWithZone:zone];
        copy.com = [self.com copyWithZone:zone];
        copy.customer = [self.customer copyWithZone:zone];
        copy.isDeal = self.isDeal;
        copy.preid = self.preid;
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.cust = [self.cust copyWithZone:zone];
    }
    
    return copy;
}


@end
