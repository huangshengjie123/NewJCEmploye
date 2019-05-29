//
//  JCModel_getStoreHouseFacPageProperties.m
//
//  Created by   on 2018/9/4
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_getStoreHouseFacPageProperties.h"


NSString *const kJCModel_getStoreHouseFacPagePropertiesSize = @"size";
NSString *const kJCModel_getStoreHouseFacPagePropertiesStart = @"start";
NSString *const kJCModel_getStoreHouseFacPagePropertiesEnd = @"end";
NSString *const kJCModel_getStoreHouseFacPagePropertiesCount = @"count";
NSString *const kJCModel_getStoreHouseFacPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_getStoreHouseFacPagePropertiesPageNum = @"pageNum";


@interface JCModel_getStoreHouseFacPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_getStoreHouseFacPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_getStoreHouseFacPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_getStoreHouseFacPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_getStoreHouseFacPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_getStoreHouseFacPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_getStoreHouseFacPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_getStoreHouseFacPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_getStoreHouseFacPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_getStoreHouseFacPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_getStoreHouseFacPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_getStoreHouseFacPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_getStoreHouseFacPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_getStoreHouseFacPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_getStoreHouseFacPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_getStoreHouseFacPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_getStoreHouseFacPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_getStoreHouseFacPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_getStoreHouseFacPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_getStoreHouseFacPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_getStoreHouseFacPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_getStoreHouseFacPageProperties *copy = [[JCModel_getStoreHouseFacPageProperties alloc] init];
    
    
    
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
