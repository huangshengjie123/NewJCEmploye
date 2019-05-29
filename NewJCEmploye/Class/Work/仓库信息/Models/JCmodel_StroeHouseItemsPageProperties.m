//
//  JCmodel_StroeHouseItemsPageProperties.m
//
//  Created by   on 2018/5/15
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCmodel_StroeHouseItemsPageProperties.h"


NSString *const kJCmodel_StroeHouseItemsPagePropertiesSize = @"size";
NSString *const kJCmodel_StroeHouseItemsPagePropertiesStart = @"start";
NSString *const kJCmodel_StroeHouseItemsPagePropertiesEnd = @"end";
NSString *const kJCmodel_StroeHouseItemsPagePropertiesCount = @"count";
NSString *const kJCmodel_StroeHouseItemsPagePropertiesTotalPage = @"totalPage";
NSString *const kJCmodel_StroeHouseItemsPagePropertiesPageNum = @"pageNum";


@interface JCmodel_StroeHouseItemsPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCmodel_StroeHouseItemsPageProperties

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
            self.size = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCmodel_StroeHouseItemsPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCmodel_StroeHouseItemsPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCmodel_StroeHouseItemsPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCmodel_StroeHouseItemsPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCmodel_StroeHouseItemsPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCmodel_StroeHouseItemsPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCmodel_StroeHouseItemsPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCmodel_StroeHouseItemsPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCmodel_StroeHouseItemsPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCmodel_StroeHouseItemsPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCmodel_StroeHouseItemsPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCmodel_StroeHouseItemsPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCmodel_StroeHouseItemsPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCmodel_StroeHouseItemsPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCmodel_StroeHouseItemsPageProperties *copy = [[JCmodel_StroeHouseItemsPageProperties alloc] init];
    
    
    
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
