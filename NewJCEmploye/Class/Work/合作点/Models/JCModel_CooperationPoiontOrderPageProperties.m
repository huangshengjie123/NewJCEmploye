//
//  JCModel_CooperationPoiontOrderPageProperties.m
//
//  Created by   on 2018/11/28
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_CooperationPoiontOrderPageProperties.h"


NSString *const kJCModel_CooperationPoiontOrderPagePropertiesSize = @"size";
NSString *const kJCModel_CooperationPoiontOrderPagePropertiesStart = @"start";
NSString *const kJCModel_CooperationPoiontOrderPagePropertiesEnd = @"end";
NSString *const kJCModel_CooperationPoiontOrderPagePropertiesCount = @"count";
NSString *const kJCModel_CooperationPoiontOrderPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_CooperationPoiontOrderPagePropertiesPageNum = @"pageNum";


@interface JCModel_CooperationPoiontOrderPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_CooperationPoiontOrderPageProperties

@synthesize size = _size;
@synthesize start = _start;
@synthesize endProperty = _endProperty;
@synthesize count = _count;
@synthesize totalPage = _totalPage;
@synthesize pageNum = _pageNum;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.size = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_CooperationPoiontOrderPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_CooperationPoiontOrderPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_CooperationPoiontOrderPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_CooperationPoiontOrderPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_CooperationPoiontOrderPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_CooperationPoiontOrderPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_CooperationPoiontOrderPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_CooperationPoiontOrderPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_CooperationPoiontOrderPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_CooperationPoiontOrderPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_CooperationPoiontOrderPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_CooperationPoiontOrderPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_CooperationPoiontOrderPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_CooperationPoiontOrderPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_CooperationPoiontOrderPageProperties *copy = [[JCModel_CooperationPoiontOrderPageProperties alloc] init];
    
    
    
    if (copy) {

        copy.size = self.size;
        copy.start = self.start;
        copy.endProperty = self.endProperty;
        copy.count = self.count;
        copy.totalPage = self.totalPage;
        copy.pageNum = self.pageNum;
    }
    
    return copy;
}


@end
