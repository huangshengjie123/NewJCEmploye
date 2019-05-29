//
//  JCModel_newMessagePageProperties.m
//
//  Created by   on 2019/4/10
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_newMessagePageProperties.h"


NSString *const kJCModel_newMessagePagePropertiesSize = @"size";
NSString *const kJCModel_newMessagePagePropertiesStart = @"start";
NSString *const kJCModel_newMessagePagePropertiesEnd = @"end";
NSString *const kJCModel_newMessagePagePropertiesCount = @"count";
NSString *const kJCModel_newMessagePagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_newMessagePagePropertiesPageNum = @"pageNum";


@interface JCModel_newMessagePageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_newMessagePageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_newMessagePagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_newMessagePagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_newMessagePagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_newMessagePagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_newMessagePagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_newMessagePagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_newMessagePagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_newMessagePagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_newMessagePagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_newMessagePagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_newMessagePagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_newMessagePagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_newMessagePagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_newMessagePagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_newMessagePagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_newMessagePagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_newMessagePagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_newMessagePagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_newMessagePagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_newMessagePagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_newMessagePagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_newMessagePagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_newMessagePagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_newMessagePagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_newMessagePageProperties *copy = [[JCModel_newMessagePageProperties alloc] init];
    
    
    
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
