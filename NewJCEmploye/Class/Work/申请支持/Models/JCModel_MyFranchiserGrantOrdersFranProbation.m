//
//  JCModel_MyFranchiserGrantOrdersFranProbation.m
//
//  Created by   on 2018/12/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_MyFranchiserGrantOrdersFranProbation.h"
#import "JCModel_MyFranchiserGrantOrdersProbationCosts.h"
#import "JCModel_MyFranchiserGrantOrdersCustomer.h"
#import "JCModel_MyFranchiserGrantOrdersFranchiserDetail.h"


NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationId = @"id";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationComments = @"comments";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationStart = @"start";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationProcessId = @"processId";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationGuide = @"guide";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationHasOut = @"hasOut";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationProbationCosts = @"probationCosts";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationGuider = @"guider";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationUid = @"uid";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationCom = @"com";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationCustomer = @"customer";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationSoid = @"soid";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationFranchiserDetail = @"franchiserDetail";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationIsDeal = @"isDeal";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationFranchiser = @"franchiser";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationPreid = @"preid";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationEnd = @"end";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationStatus = @"status";
NSString *const kJCModel_MyFranchiserGrantOrdersFranProbationCust = @"cust";


@interface JCModel_MyFranchiserGrantOrdersFranProbation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_MyFranchiserGrantOrdersFranProbation

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
            self.franProbationIdentifier = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationId fromDictionary:dict];
            self.comments = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationComments fromDictionary:dict];
            self.start = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationStart fromDictionary:dict];
            self.processId = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationProcessId fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuide fromDictionary:dict] doubleValue];
            self.hasOut = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationHasOut fromDictionary:dict];
    NSObject *receivedJCModel_MyFranchiserGrantOrdersProbationCosts = [dict objectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationProbationCosts];
    NSMutableArray *parsedJCModel_MyFranchiserGrantOrdersProbationCosts = [NSMutableArray array];
    
    if ([receivedJCModel_MyFranchiserGrantOrdersProbationCosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_MyFranchiserGrantOrdersProbationCosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_MyFranchiserGrantOrdersProbationCosts addObject:[JCModel_MyFranchiserGrantOrdersProbationCosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_MyFranchiserGrantOrdersProbationCosts isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_MyFranchiserGrantOrdersProbationCosts addObject:[JCModel_MyFranchiserGrantOrdersProbationCosts modelObjectWithDictionary:(NSDictionary *)receivedJCModel_MyFranchiserGrantOrdersProbationCosts]];
    }

    self.probationCosts = [NSArray arrayWithArray:parsedJCModel_MyFranchiserGrantOrdersProbationCosts];
            self.guider = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuider fromDictionary:dict];
            self.uid = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationUid fromDictionary:dict] doubleValue];
            self.com = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationCom fromDictionary:dict];
            self.customer = [JCModel_MyFranchiserGrantOrdersCustomer modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationCustomer]];
            self.soid = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationSoid fromDictionary:dict];
            self.franchiserDetail = [JCModel_MyFranchiserGrantOrdersFranchiserDetail modelObjectWithDictionary:[dict objectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiserDetail]];
            self.isDeal = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationIsDeal fromDictionary:dict];
            self.franchiser = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiser fromDictionary:dict];
            self.preid = [[self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationPreid fromDictionary:dict] doubleValue];
            self.endProperty = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationEnd fromDictionary:dict];
            self.status = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationStatus fromDictionary:dict];
            self.cust = [self objectOrNilForKey:kJCModel_MyFranchiserGrantOrdersFranProbationCust fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.franProbationIdentifier forKey:kJCModel_MyFranchiserGrantOrdersFranProbationId];
    [mutableDict setValue:self.comments forKey:kJCModel_MyFranchiserGrantOrdersFranProbationComments];
    [mutableDict setValue:self.start forKey:kJCModel_MyFranchiserGrantOrdersFranProbationStart];
    [mutableDict setValue:self.processId forKey:kJCModel_MyFranchiserGrantOrdersFranProbationProcessId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuide];
    [mutableDict setValue:self.hasOut forKey:kJCModel_MyFranchiserGrantOrdersFranProbationHasOut];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForProbationCosts] forKey:kJCModel_MyFranchiserGrantOrdersFranProbationProbationCosts];
    [mutableDict setValue:self.guider forKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuider];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uid] forKey:kJCModel_MyFranchiserGrantOrdersFranProbationUid];
    [mutableDict setValue:self.com forKey:kJCModel_MyFranchiserGrantOrdersFranProbationCom];
    [mutableDict setValue:[self.customer dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersFranProbationCustomer];
    [mutableDict setValue:self.soid forKey:kJCModel_MyFranchiserGrantOrdersFranProbationSoid];
    [mutableDict setValue:[self.franchiserDetail dictionaryRepresentation] forKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiserDetail];
    [mutableDict setValue:self.isDeal forKey:kJCModel_MyFranchiserGrantOrdersFranProbationIsDeal];
    [mutableDict setValue:self.franchiser forKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiser];
    [mutableDict setValue:[NSNumber numberWithDouble:self.preid] forKey:kJCModel_MyFranchiserGrantOrdersFranProbationPreid];
    [mutableDict setValue:self.endProperty forKey:kJCModel_MyFranchiserGrantOrdersFranProbationEnd];
    [mutableDict setValue:self.status forKey:kJCModel_MyFranchiserGrantOrdersFranProbationStatus];
    [mutableDict setValue:self.cust forKey:kJCModel_MyFranchiserGrantOrdersFranProbationCust];

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

    self.franProbationIdentifier = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationId];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationComments];
    self.start = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationStart];
    self.processId = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationProcessId];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuide];
    self.hasOut = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationHasOut];
    self.probationCosts = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationProbationCosts];
    self.guider = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuider];
    self.uid = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersFranProbationUid];
    self.com = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationCom];
    self.customer = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationCustomer];
    self.soid = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationSoid];
    self.franchiserDetail = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiserDetail];
    self.isDeal = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationIsDeal];
    self.franchiser = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiser];
    self.preid = [aDecoder decodeDoubleForKey:kJCModel_MyFranchiserGrantOrdersFranProbationPreid];
    self.endProperty = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationEnd];
    self.status = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationStatus];
    self.cust = [aDecoder decodeObjectForKey:kJCModel_MyFranchiserGrantOrdersFranProbationCust];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_franProbationIdentifier forKey:kJCModel_MyFranchiserGrantOrdersFranProbationId];
    [aCoder encodeObject:_comments forKey:kJCModel_MyFranchiserGrantOrdersFranProbationComments];
    [aCoder encodeObject:_start forKey:kJCModel_MyFranchiserGrantOrdersFranProbationStart];
    [aCoder encodeObject:_processId forKey:kJCModel_MyFranchiserGrantOrdersFranProbationProcessId];
    [aCoder encodeDouble:_guide forKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuide];
    [aCoder encodeObject:_hasOut forKey:kJCModel_MyFranchiserGrantOrdersFranProbationHasOut];
    [aCoder encodeObject:_probationCosts forKey:kJCModel_MyFranchiserGrantOrdersFranProbationProbationCosts];
    [aCoder encodeObject:_guider forKey:kJCModel_MyFranchiserGrantOrdersFranProbationGuider];
    [aCoder encodeDouble:_uid forKey:kJCModel_MyFranchiserGrantOrdersFranProbationUid];
    [aCoder encodeObject:_com forKey:kJCModel_MyFranchiserGrantOrdersFranProbationCom];
    [aCoder encodeObject:_customer forKey:kJCModel_MyFranchiserGrantOrdersFranProbationCustomer];
    [aCoder encodeObject:_soid forKey:kJCModel_MyFranchiserGrantOrdersFranProbationSoid];
    [aCoder encodeObject:_franchiserDetail forKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiserDetail];
    [aCoder encodeObject:_isDeal forKey:kJCModel_MyFranchiserGrantOrdersFranProbationIsDeal];
    [aCoder encodeObject:_franchiser forKey:kJCModel_MyFranchiserGrantOrdersFranProbationFranchiser];
    [aCoder encodeDouble:_preid forKey:kJCModel_MyFranchiserGrantOrdersFranProbationPreid];
    [aCoder encodeObject:_endProperty forKey:kJCModel_MyFranchiserGrantOrdersFranProbationEnd];
    [aCoder encodeObject:_status forKey:kJCModel_MyFranchiserGrantOrdersFranProbationStatus];
    [aCoder encodeObject:_cust forKey:kJCModel_MyFranchiserGrantOrdersFranProbationCust];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_MyFranchiserGrantOrdersFranProbation *copy = [[JCModel_MyFranchiserGrantOrdersFranProbation alloc] init];
    
    
    
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
        copy.isDeal = [self.isDeal copyWithZone:zone];
        copy.franchiser = [self.franchiser copyWithZone:zone];
        copy.preid = self.preid;
        copy.endProperty = [self.endProperty copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.cust = [self.cust copyWithZone:zone];
    }
    
    return copy;
}


@end
