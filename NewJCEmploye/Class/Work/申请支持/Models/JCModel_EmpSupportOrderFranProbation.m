//
//  JCModel_EmpSupportOrderFranProbation.m
//
//  Created by   on 2018/12/27
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_EmpSupportOrderFranProbation.h"
#import "JCModel_EmpSupportOrderProbationCosts.h"
#import "JCModel_EmpSupportOrderCustomer.h"
#import "JCModel_EmpSupportOrderFranchiserDetail.h"


NSString *const kJCModel_EmpSupportOrderFranProbationId = @"id";
NSString *const kJCModel_EmpSupportOrderFranProbationComments = @"comments";
NSString *const kJCModel_EmpSupportOrderFranProbationStart = @"start";
NSString *const kJCModel_EmpSupportOrderFranProbationProcessId = @"processId";
NSString *const kJCModel_EmpSupportOrderFranProbationGuide = @"guide";
NSString *const kJCModel_EmpSupportOrderFranProbationHasOut = @"hasOut";
NSString *const kJCModel_EmpSupportOrderFranProbationProbationCosts = @"probationCosts";
NSString *const kJCModel_EmpSupportOrderFranProbationGuider = @"guider";
NSString *const kJCModel_EmpSupportOrderFranProbationUid = @"uid";
NSString *const kJCModel_EmpSupportOrderFranProbationCom = @"com";
NSString *const kJCModel_EmpSupportOrderFranProbationCustomer = @"customer";
NSString *const kJCModel_EmpSupportOrderFranProbationSoid = @"soid";
NSString *const kJCModel_EmpSupportOrderFranProbationFranchiserDetail = @"franchiserDetail";
NSString *const kJCModel_EmpSupportOrderFranProbationIsDeal = @"isDeal";
NSString *const kJCModel_EmpSupportOrderFranProbationFranchiser = @"franchiser";
NSString *const kJCModel_EmpSupportOrderFranProbationPreid = @"preid";
NSString *const kJCModel_EmpSupportOrderFranProbationEnd = @"end";
NSString *const kJCModel_EmpSupportOrderFranProbationStatus = @"status";
NSString *const kJCModel_EmpSupportOrderFranProbationCust = @"cust";


@interface JCModel_EmpSupportOrderFranProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_EmpSupportOrderFranProbation

@synthesize franProbationIdentifier = _franProbationIdentifier;
@synthesize comments = _comments;
@synthesize start = _start;
@synthesize processId = _processId;
@synthesize guide = _guide;
@synthesize hasOut = _hasOut;
@synthesize probationCosts = _probationCosts;
@synthesize guider = _guider;
@synthesize uid = _uid;
@synthesize com = _com;
@synthesize customer = _customer;
@synthesize soid = _soid;
@synthesize franchiserDetail = _franchiserDetail;
@synthesize isDeal = _isDeal;
@synthesize franchiser = _franchiser;
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
            self.franProbationIdentifier = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationComments fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationStart fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationProcessId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationGuide fromDictionary:dict] doubleValue];
            self.hasOut = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationHasOut fromDictionary:dict];
    NSObject *receivedJCModel_EmpSupportOrderProbationCosts = [dict objectForKey:kJCModel_EmpSupportOrderFranProbationProbationCosts];
    NSMutableArray *parsedJCModel_EmpSupportOrderProbationCosts = [NSMutableArray array];
    
    if ([receivedJCModel_EmpSupportOrderProbationCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_EmpSupportOrderProbationCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_EmpSupportOrderProbationCosts addObject:[JCModel_EmpSupportOrderProbationCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_EmpSupportOrderProbationCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_EmpSupportOrderProbationCosts addObject:[JCModel_EmpSupportOrderProbationCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_EmpSupportOrderProbationCosts]];
    }

    self.probationCosts = [NSArray arrayWithArray:parsedJCModel_EmpSupportOrderProbationCosts];
            self.guider = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationGuider fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationUid fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationCom fromDictionary:dict];
            self.customer = [JCModel_EmpSupportOrderCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderFranProbationCustomer]];
            self.soid = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationSoid fromDictionary:dict];
            self.franchiserDetail = [JCModel_EmpSupportOrderFranchiserDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_EmpSupportOrderFranProbationFranchiserDetail]];
            self.isDeal = [[self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationIsDeal fromDictionary:dict] boolValue];
            self.franchiser = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationFranchiser fromDictionary:dict];
            self.preid = [[self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationPreid fromDictionary:dict] doubleValue];
            self.endProperty = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationEnd fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationStatus fromDictionary:dict];
            self.cust = [self objectOrNilForKey:kJCModel_EmpSupportOrderFranProbationCust fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franProbationIdentifier forKey:kJCModel_EmpSupportOrderFranProbationId];
    [mutableDict setValue:self.comments forKey:kJCModel_EmpSupportOrderFranProbationComments];
    [mutableDict setValue:self.start forKey:kJCModel_EmpSupportOrderFranProbationStart];
    [mutableDict setValue:self.processId forKey:kJCModel_EmpSupportOrderFranProbationProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_EmpSupportOrderFranProbationGuide];
    [mutableDict setValue:self.hasOut forKey:kJCModel_EmpSupportOrderFranProbationHasOut];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProbationCosts] forKey:kJCModel_EmpSupportOrderFranProbationProbationCosts];
    [mutableDict setValue:self.guider forKey:kJCModel_EmpSupportOrderFranProbationGuider];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_EmpSupportOrderFranProbationUid];
    [mutableDict setValue:self.com forKey:kJCModel_EmpSupportOrderFranProbationCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderFranProbationCustomer];
    [mutableDict setValue:self.soid forKey:kJCModel_EmpSupportOrderFranProbationSoid];
    [mutableDict setValue:[self.franchiserDetail dictionaryRepresentation] forKey:kJCModel_EmpSupportOrderFranProbationFranchiserDetail];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDeal] forKey:kJCModel_EmpSupportOrderFranProbationIsDeal];
    [mutableDict setValue:self.franchiser forKey:kJCModel_EmpSupportOrderFranProbationFranchiser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preid] forKey:kJCModel_EmpSupportOrderFranProbationPreid];
    [mutableDict setValue:self.endProperty forKey:kJCModel_EmpSupportOrderFranProbationEnd];
    [mutableDict setValue:self.status forKey:kJCModel_EmpSupportOrderFranProbationStatus];
    [mutableDict setValue:self.cust forKey:kJCModel_EmpSupportOrderFranProbationCust];

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

    self.franProbationIdentifier = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationComments];
    self.start = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationStart];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationProcessId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderFranProbationGuide];
    self.hasOut = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationHasOut];
    self.probationCosts = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationProbationCosts];
    self.guider = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationGuider];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderFranProbationUid];
    self.com = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationCustomer];
    self.soid = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationSoid];
    self.franchiserDetail = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationFranchiserDetail];
    self.isDeal = [aDecoder decodeBoolForKey:kJCModel_EmpSupportOrderFranProbationIsDeal];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationFranchiser];
    self.preid = [aDecoder decodeDoubleForKey:kJCModel_EmpSupportOrderFranProbationPreid];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationEnd];
    self.status = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationStatus];
    self.cust = [aDecoder decodeObjectForKey:kJCModel_EmpSupportOrderFranProbationCust];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franProbationIdentifier forKey:kJCModel_EmpSupportOrderFranProbationId];
    [aCoder encodeObject:_comments forKey:kJCModel_EmpSupportOrderFranProbationComments];
    [aCoder encodeObject:_start forKey:kJCModel_EmpSupportOrderFranProbationStart];
    [aCoder encodeObject:_processId forKey:kJCModel_EmpSupportOrderFranProbationProcessId];
    [aCoder encodeDouble:_guide forKey:kJCModel_EmpSupportOrderFranProbationGuide];
    [aCoder encodeObject:_hasOut forKey:kJCModel_EmpSupportOrderFranProbationHasOut];
    [aCoder encodeObject:_probationCosts forKey:kJCModel_EmpSupportOrderFranProbationProbationCosts];
    [aCoder encodeObject:_guider forKey:kJCModel_EmpSupportOrderFranProbationGuider];
    [aCoder encodeDouble:_uid forKey:kJCModel_EmpSupportOrderFranProbationUid];
    [aCoder encodeObject:_com forKey:kJCModel_EmpSupportOrderFranProbationCom];
    [aCoder encodeObject:_customer forKey:kJCModel_EmpSupportOrderFranProbationCustomer];
    [aCoder encodeObject:_soid forKey:kJCModel_EmpSupportOrderFranProbationSoid];
    [aCoder encodeObject:_franchiserDetail forKey:kJCModel_EmpSupportOrderFranProbationFranchiserDetail];
    [aCoder encodeBool:_isDeal forKey:kJCModel_EmpSupportOrderFranProbationIsDeal];
    [aCoder encodeObject:_franchiser forKey:kJCModel_EmpSupportOrderFranProbationFranchiser];
    [aCoder encodeDouble:_preid forKey:kJCModel_EmpSupportOrderFranProbationPreid];
    [aCoder encodeObject:_endProperty forKey:kJCModel_EmpSupportOrderFranProbationEnd];
    [aCoder encodeObject:_status forKey:kJCModel_EmpSupportOrderFranProbationStatus];
    [aCoder encodeObject:_cust forKey:kJCModel_EmpSupportOrderFranProbationCust];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_EmpSupportOrderFranProbation *copy = [[JCModel_EmpSupportOrderFranProbation alloc] init];
    
    
    
    if (copy) {

        copy.franProbationIdentifier = [self.franProbationIdentifier copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.start = [self.start copyWithZone:zone];
        copy.processId = [self.processId copyWithZone:zone];
        copy.guide = self.guide;
        copy.hasOut = [self.hasOut copyWithZone:zone];
        copy.probationCosts = [self.probationCosts copyWithZone:zone];
        copy.guider = [self.guider copyWithZone:zone];
        copy.uid = self.uid;
        copy.com = [self.com copyWithZone:zone];
        copy.customer = [self.customer copyWithZone:zone];
        copy.soid = [self.soid copyWithZone:zone];
        copy.franchiserDetail = [self.franchiserDetail copyWithZone:zone];
        copy.isDeal = self.isDeal;
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.preid = self.preid;
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.cust = [self.cust copyWithZone:zone];
    }
    
    return copy;
}


@end
