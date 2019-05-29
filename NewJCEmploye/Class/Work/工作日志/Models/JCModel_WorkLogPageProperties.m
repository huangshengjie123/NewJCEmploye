//
//  JCModel_WorkLogPageProperties.m
//
//  Created by   on 2018/8/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_WorkLogPageProperties.h"


NSString *const kJCModel_WorkLogPagePropertiesSize = @"size";
NSString *const kJCModel_WorkLogPagePropertiesStart = @"start";
NSString *const kJCModel_WorkLogPagePropertiesEnd = @"end";
NSString *const kJCModel_WorkLogPagePropertiesCount = @"count";
NSString *const kJCModel_WorkLogPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_WorkLogPagePropertiesPageNum = @"pageNum";


@interface JCModel_WorkLogPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_WorkLogPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_WorkLogPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_WorkLogPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_WorkLogPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_WorkLogPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_WorkLogPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_WorkLogPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_WorkLogPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_WorkLogPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_WorkLogPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_WorkLogPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_WorkLogPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_WorkLogPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_WorkLogPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_WorkLogPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_WorkLogPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_WorkLogPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_WorkLogPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_WorkLogPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_WorkLogPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_WorkLogPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_WorkLogPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_WorkLogPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_WorkLogPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_WorkLogPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_WorkLogPageProperties *copy = [[JCModel_WorkLogPageProperties alloc] init];
    
    
    
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
