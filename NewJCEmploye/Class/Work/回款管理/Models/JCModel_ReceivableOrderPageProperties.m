//
//  JCModel_ReceivableOrderPageProperties.m
//
//  Created by   on 2018/8/10
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReceivableOrderPageProperties.h"


NSString *const kJCModel_ReceivableOrderPagePropertiesSize = @"size";
NSString *const kJCModel_ReceivableOrderPagePropertiesStart = @"start";
NSString *const kJCModel_ReceivableOrderPagePropertiesEnd = @"end";
NSString *const kJCModel_ReceivableOrderPagePropertiesCount = @"count";
NSString *const kJCModel_ReceivableOrderPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_ReceivableOrderPagePropertiesPageNum = @"pageNum";


@interface JCModel_ReceivableOrderPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReceivableOrderPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_ReceivableOrderPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_ReceivableOrderPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_ReceivableOrderPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_ReceivableOrderPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_ReceivableOrderPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_ReceivableOrderPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_ReceivableOrderPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_ReceivableOrderPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_ReceivableOrderPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_ReceivableOrderPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_ReceivableOrderPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_ReceivableOrderPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_ReceivableOrderPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_ReceivableOrderPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_ReceivableOrderPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_ReceivableOrderPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_ReceivableOrderPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_ReceivableOrderPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_ReceivableOrderPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReceivableOrderPageProperties *copy = [[JCModel_ReceivableOrderPageProperties alloc] init];
    
    
    
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
