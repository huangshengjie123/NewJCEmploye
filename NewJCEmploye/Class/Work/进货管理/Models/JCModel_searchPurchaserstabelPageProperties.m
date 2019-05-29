//
//  JCModel_searchPurchaserstabelPageProperties.m
//
//  Created by   on 2018/8/30
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchPurchaserstabelPageProperties.h"


NSString *const kJCModel_searchPurchaserstabelPagePropertiesSize = @"size";
NSString *const kJCModel_searchPurchaserstabelPagePropertiesStart = @"start";
NSString *const kJCModel_searchPurchaserstabelPagePropertiesEnd = @"end";
NSString *const kJCModel_searchPurchaserstabelPagePropertiesCount = @"count";
NSString *const kJCModel_searchPurchaserstabelPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_searchPurchaserstabelPagePropertiesPageNum = @"pageNum";


@interface JCModel_searchPurchaserstabelPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchPurchaserstabelPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_searchPurchaserstabelPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_searchPurchaserstabelPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_searchPurchaserstabelPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_searchPurchaserstabelPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_searchPurchaserstabelPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_searchPurchaserstabelPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_searchPurchaserstabelPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_searchPurchaserstabelPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_searchPurchaserstabelPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_searchPurchaserstabelPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_searchPurchaserstabelPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_searchPurchaserstabelPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_searchPurchaserstabelPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_searchPurchaserstabelPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchPurchaserstabelPageProperties *copy = [[JCModel_searchPurchaserstabelPageProperties alloc] init];
    
    
    
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
