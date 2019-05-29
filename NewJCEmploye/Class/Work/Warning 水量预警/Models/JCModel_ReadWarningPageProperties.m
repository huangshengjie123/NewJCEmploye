//
//  JCModel_ReadWarningPageProperties.m
//
//  Created by   on 2018/10/29
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_ReadWarningPageProperties.h"


NSString *const kJCModel_ReadWarningPagePropertiesSize = @"size";
NSString *const kJCModel_ReadWarningPagePropertiesStart = @"start";
NSString *const kJCModel_ReadWarningPagePropertiesEnd = @"end";
NSString *const kJCModel_ReadWarningPagePropertiesCount = @"count";
NSString *const kJCModel_ReadWarningPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_ReadWarningPagePropertiesPageNum = @"pageNum";


@interface JCModel_ReadWarningPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_ReadWarningPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_ReadWarningPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_ReadWarningPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_ReadWarningPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_ReadWarningPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_ReadWarningPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_ReadWarningPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_ReadWarningPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_ReadWarningPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_ReadWarningPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_ReadWarningPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_ReadWarningPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_ReadWarningPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_ReadWarningPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_ReadWarningPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_ReadWarningPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_ReadWarningPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_ReadWarningPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_ReadWarningPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_ReadWarningPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_ReadWarningPageProperties *copy = [[JCModel_ReadWarningPageProperties alloc] init];
    
    
    
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
