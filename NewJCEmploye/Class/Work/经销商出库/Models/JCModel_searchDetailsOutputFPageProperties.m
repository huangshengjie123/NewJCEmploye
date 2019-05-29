//
//  JCModel_searchDetailsOutputFPageProperties.m
//
//  Created by   on 2019/3/4
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_searchDetailsOutputFPageProperties.h"


NSString *const kJCModel_searchDetailsOutputFPagePropertiesSize = @"size";
NSString *const kJCModel_searchDetailsOutputFPagePropertiesStart = @"start";
NSString *const kJCModel_searchDetailsOutputFPagePropertiesEnd = @"end";
NSString *const kJCModel_searchDetailsOutputFPagePropertiesCount = @"count";
NSString *const kJCModel_searchDetailsOutputFPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_searchDetailsOutputFPagePropertiesPageNum = @"pageNum";


@interface JCModel_searchDetailsOutputFPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_searchDetailsOutputFPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_searchDetailsOutputFPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_searchDetailsOutputFPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_searchDetailsOutputFPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_searchDetailsOutputFPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_searchDetailsOutputFPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_searchDetailsOutputFPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_searchDetailsOutputFPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_searchDetailsOutputFPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_searchDetailsOutputFPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_searchDetailsOutputFPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_searchDetailsOutputFPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_searchDetailsOutputFPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_searchDetailsOutputFPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_searchDetailsOutputFPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_searchDetailsOutputFPageProperties *copy = [[JCModel_searchDetailsOutputFPageProperties alloc] init];
    
    
    
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
