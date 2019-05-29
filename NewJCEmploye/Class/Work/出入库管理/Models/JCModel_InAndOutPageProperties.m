//
//  JCModel_InAndOutPageProperties.m
//
//  Created by   on 2019/2/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_InAndOutPageProperties.h"


NSString *const kJCModel_InAndOutPagePropertiesSize = @"size";
NSString *const kJCModel_InAndOutPagePropertiesPageNum = @"pageNum";
NSString *const kJCModel_InAndOutPagePropertiesEnd = @"end";
NSString *const kJCModel_InAndOutPagePropertiesCount = @"count";
NSString *const kJCModel_InAndOutPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_InAndOutPagePropertiesStart = @"start";


@interface JCModel_InAndOutPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_InAndOutPageProperties

@synthesize size = _size;
@synthesize pageNum = _pageNum;
@synthesize endProperty = _endProperty;
@synthesize count = _count;
@synthesize totalPage = _totalPage;
@synthesize start = _start;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.size = [[self objectOrNilForKey:kJCModel_InAndOutPagePropertiesSize fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_InAndOutPagePropertiesPageNum fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_InAndOutPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_InAndOutPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_InAndOutPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_InAndOutPagePropertiesStart fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_InAndOutPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_InAndOutPagePropertiesPageNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_InAndOutPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_InAndOutPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_InAndOutPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_InAndOutPagePropertiesStart];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_InAndOutPagePropertiesSize];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_InAndOutPagePropertiesPageNum];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_InAndOutPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_InAndOutPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_InAndOutPagePropertiesTotalPage];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_InAndOutPagePropertiesStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_InAndOutPagePropertiesSize];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_InAndOutPagePropertiesPageNum];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_InAndOutPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_InAndOutPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_InAndOutPagePropertiesTotalPage];
    [aCoder encodeDouble:_start forKey:kJCModel_InAndOutPagePropertiesStart];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_InAndOutPageProperties *copy = [[JCModel_InAndOutPageProperties alloc] init];
    
    
    
    if (copy) {

        copy.size = self.size;
        copy.pageNum = self.pageNum;
        copy.endProperty = self.endProperty;
        copy.count = self.count;
        copy.totalPage = self.totalPage;
        copy.start = self.start;
    }
    
    return copy;
}


@end
