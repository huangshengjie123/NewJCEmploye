//
//  JCModel_NewProabtionCustomPageProperties.m
//
//  Created by   on 2019/2/15
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_NewProabtionCustomPageProperties.h"


NSString *const kJCModel_NewProabtionCustomPagePropertiesSize = @"size";
NSString *const kJCModel_NewProabtionCustomPagePropertiesPageNum = @"pageNum";
NSString *const kJCModel_NewProabtionCustomPagePropertiesEnd = @"end";
NSString *const kJCModel_NewProabtionCustomPagePropertiesCount = @"count";
NSString *const kJCModel_NewProabtionCustomPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_NewProabtionCustomPagePropertiesStart = @"start";


@interface JCModel_NewProabtionCustomPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_NewProabtionCustomPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_NewProabtionCustomPagePropertiesSize fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_NewProabtionCustomPagePropertiesPageNum fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_NewProabtionCustomPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_NewProabtionCustomPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_NewProabtionCustomPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_NewProabtionCustomPagePropertiesStart fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_NewProabtionCustomPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_NewProabtionCustomPagePropertiesPageNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_NewProabtionCustomPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_NewProabtionCustomPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_NewProabtionCustomPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_NewProabtionCustomPagePropertiesStart];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomPagePropertiesSize];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomPagePropertiesPageNum];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomPagePropertiesTotalPage];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_NewProabtionCustomPagePropertiesStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_NewProabtionCustomPagePropertiesSize];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_NewProabtionCustomPagePropertiesPageNum];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_NewProabtionCustomPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_NewProabtionCustomPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_NewProabtionCustomPagePropertiesTotalPage];
    [aCoder encodeDouble:_start forKey:kJCModel_NewProabtionCustomPagePropertiesStart];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_NewProabtionCustomPageProperties *copy = [[JCModel_NewProabtionCustomPageProperties alloc] init];
    
    
    
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
