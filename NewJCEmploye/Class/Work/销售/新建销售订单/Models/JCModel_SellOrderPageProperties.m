//
//  JCModel_SellOrderPageProperties.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_SellOrderPageProperties.h"


NSString *const kJCModel_SellOrderPagePropertiesSize = @"size";
NSString *const kJCModel_SellOrderPagePropertiesStart = @"start";
NSString *const kJCModel_SellOrderPagePropertiesEnd = @"end";
NSString *const kJCModel_SellOrderPagePropertiesCount = @"count";
NSString *const kJCModel_SellOrderPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_SellOrderPagePropertiesPageNum = @"pageNum";


@interface JCModel_SellOrderPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_SellOrderPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_SellOrderPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_SellOrderPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_SellOrderPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_SellOrderPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_SellOrderPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_SellOrderPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_SellOrderPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_SellOrderPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_SellOrderPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_SellOrderPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_SellOrderPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_SellOrderPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_SellOrderPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_SellOrderPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_SellOrderPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_SellOrderPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_SellOrderPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_SellOrderPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_SellOrderPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_SellOrderPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_SellOrderPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_SellOrderPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_SellOrderPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_SellOrderPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_SellOrderPageProperties *copy = [[JCModel_SellOrderPageProperties alloc] init];
    
    
    
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
