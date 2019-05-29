//
//  JCModel_newReturnVisitVisit.m
//
//  Created by   on 2018/11/9
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newReturnVisitVisit.h"
#import "JCModel_newReturnVisitItems.h"


NSString *const kJCModel_newReturnVisitVisitMyItem = @"myItem";
NSString *const kJCModel_newReturnVisitVisitGuide = @"guide";
NSString *const kJCModel_newReturnVisitVisitVtype = @"vtype";
NSString *const kJCModel_newReturnVisitVisitItems = @"items";
NSString *const kJCModel_newReturnVisitVisitComments = @"comments";
NSString *const kJCModel_newReturnVisitVisitCusId = @"cusId";


@interface JCModel_newReturnVisitVisit ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newReturnVisitVisit

@synthesize myItem = _myItem;
@synthesize guide = _guide;
@synthesize vtype = _vtype;
@synthesize items = _items;
@synthesize comments = _comments;
@synthesize cusId = _cusId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.myItem = [self objectOrNilForKey:kJCModel_newReturnVisitVisitMyItem fromDictionary:dict];
            self.guide = [[self objectOrNilForKey:kJCModel_newReturnVisitVisitGuide fromDictionary:dict] doubleValue];
            self.vtype = [[self objectOrNilForKey:kJCModel_newReturnVisitVisitVtype fromDictionary:dict] doubleValue];
    NSObject *receivedJCModel_newReturnVisitItems = [dict objectForKey:kJCModel_newReturnVisitVisitItems];
    NSMutableArray *parsedJCModel_newReturnVisitItems = [NSMutableArray array];
    
    if ([receivedJCModel_newReturnVisitItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedJCModel_newReturnVisitItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedJCModel_newReturnVisitItems addObject:[JCModel_newReturnVisitItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedJCModel_newReturnVisitItems isKindOfClass:[NSDictionary class]]) {
       [parsedJCModel_newReturnVisitItems addObject:[JCModel_newReturnVisitItems modelObjectWithDictionary:(NSDictionary *)receivedJCModel_newReturnVisitItems]];
    }

    self.items = [NSArray arrayWithArray:parsedJCModel_newReturnVisitItems];
            self.comments = [self objectOrNilForKey:kJCModel_newReturnVisitVisitComments fromDictionary:dict];
            self.cusId = [[self objectOrNilForKey:kJCModel_newReturnVisitVisitCusId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.myItem forKey:kJCModel_newReturnVisitVisitMyItem];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guide] forKey:kJCModel_newReturnVisitVisitGuide];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vtype] forKey:kJCModel_newReturnVisitVisitVtype];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kJCModel_newReturnVisitVisitItems];
    [mutableDict setValue:self.comments forKey:kJCModel_newReturnVisitVisitComments];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cusId] forKey:kJCModel_newReturnVisitVisitCusId];

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

    self.myItem = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitVisitMyItem];
    self.guide = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitVisitGuide];
    self.vtype = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitVisitVtype];
    self.items = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitVisitItems];
    self.comments = [aDecoder decodeObjectForKey:kJCModel_newReturnVisitVisitComments];
    self.cusId = [aDecoder decodeDoubleForKey:kJCModel_newReturnVisitVisitCusId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_myItem forKey:kJCModel_newReturnVisitVisitMyItem];
    [aCoder encodeDouble:_guide forKey:kJCModel_newReturnVisitVisitGuide];
    [aCoder encodeDouble:_vtype forKey:kJCModel_newReturnVisitVisitVtype];
    [aCoder encodeObject:_items forKey:kJCModel_newReturnVisitVisitItems];
    [aCoder encodeObject:_comments forKey:kJCModel_newReturnVisitVisitComments];
    [aCoder encodeDouble:_cusId forKey:kJCModel_newReturnVisitVisitCusId];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newReturnVisitVisit *copy = [[JCModel_newReturnVisitVisit alloc] init];
    
    
    
    if (copy) {

        copy.myItem = [self.myItem copyWithZone:zone];
        copy.guide = self.guide;
        copy.vtype = self.vtype;
        copy.items = [self.items copyWithZone:zone];
        copy.comments = [self.comments copyWithZone:zone];
        copy.cusId = self.cusId;
    }
    
    return copy;
}


@end
