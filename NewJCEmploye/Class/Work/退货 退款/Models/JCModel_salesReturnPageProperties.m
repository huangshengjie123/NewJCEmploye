//
//  JCModel_salesReturnPageProperties.m
//
//  Created by   on 2019/1/24
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_salesReturnPageProperties.h"


NSString *const kJCModel_salesReturnPagePropertiesSize = @"size";
NSString *const kJCModel_salesReturnPagePropertiesStart = @"start";
NSString *const kJCModel_salesReturnPagePropertiesEnd = @"end";
NSString *const kJCModel_salesReturnPagePropertiesCount = @"count";
NSString *const kJCModel_salesReturnPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_salesReturnPagePropertiesPageNum = @"pageNum";


@interface JCModel_salesReturnPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_salesReturnPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_salesReturnPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_salesReturnPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_salesReturnPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_salesReturnPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_salesReturnPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_salesReturnPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_salesReturnPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_salesReturnPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_salesReturnPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_salesReturnPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_salesReturnPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_salesReturnPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_salesReturnPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_salesReturnPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_salesReturnPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_salesReturnPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_salesReturnPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_salesReturnPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_salesReturnPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_salesReturnPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_salesReturnPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_salesReturnPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_salesReturnPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_salesReturnPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_salesReturnPageProperties *copy = [[JCModel_salesReturnPageProperties alloc] init];
    
    
    
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
