//
//  JCModel_franchiserPageProperties.m
//
//  Created by   on 2018/9/11
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_franchiserPageProperties.h"


NSString *const kJCModel_franchiserPagePropertiesSize = @"size";
NSString *const kJCModel_franchiserPagePropertiesStart = @"start";
NSString *const kJCModel_franchiserPagePropertiesEnd = @"end";
NSString *const kJCModel_franchiserPagePropertiesCount = @"count";
NSString *const kJCModel_franchiserPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_franchiserPagePropertiesPageNum = @"pageNum";


@interface JCModel_franchiserPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_franchiserPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_franchiserPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_franchiserPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_franchiserPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_franchiserPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_franchiserPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_franchiserPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_franchiserPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_franchiserPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_franchiserPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_franchiserPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_franchiserPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_franchiserPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_franchiserPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_franchiserPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_franchiserPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_franchiserPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_franchiserPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_franchiserPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_franchiserPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_franchiserPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_franchiserPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_franchiserPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_franchiserPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_franchiserPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_franchiserPageProperties *copy = [[JCModel_franchiserPageProperties alloc] init];
    
    
    
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
