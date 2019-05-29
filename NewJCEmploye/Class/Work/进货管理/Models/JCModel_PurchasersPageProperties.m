//
//  JCModel_PurchasersPageProperties.m
//
//  Created by   on 2018/8/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_PurchasersPageProperties.h"


NSString *const kJCModel_PurchasersPagePropertiesSize = @"size";
NSString *const kJCModel_PurchasersPagePropertiesStart = @"start";
NSString *const kJCModel_PurchasersPagePropertiesEnd = @"end";
NSString *const kJCModel_PurchasersPagePropertiesCount = @"count";
NSString *const kJCModel_PurchasersPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_PurchasersPagePropertiesPageNum = @"pageNum";


@interface JCModel_PurchasersPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_PurchasersPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_PurchasersPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_PurchasersPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_PurchasersPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_PurchasersPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_PurchasersPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_PurchasersPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_PurchasersPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_PurchasersPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_PurchasersPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_PurchasersPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_PurchasersPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_PurchasersPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_PurchasersPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_PurchasersPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_PurchasersPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_PurchasersPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_PurchasersPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_PurchasersPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_PurchasersPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_PurchasersPageProperties *copy = [[JCModel_PurchasersPageProperties alloc] init];
    
    
    
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
