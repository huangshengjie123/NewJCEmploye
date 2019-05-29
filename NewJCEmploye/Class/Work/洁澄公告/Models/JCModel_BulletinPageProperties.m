//
//  JCModel_BulletinPageProperties.m
//
//  Created by   on 2018/5/16
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "JCModel_BulletinPageProperties.h"


NSString *const kJCModel_BulletinPagePropertiesSize = @"size";
NSString *const kJCModel_BulletinPagePropertiesPageNum = @"pageNum";
NSString *const kJCModel_BulletinPagePropertiesEnd = @"end";
NSString *const kJCModel_BulletinPagePropertiesCount = @"count";
NSString *const kJCModel_BulletinPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_BulletinPagePropertiesStart = @"start";


@interface JCModel_BulletinPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_BulletinPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_BulletinPagePropertiesSize fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_BulletinPagePropertiesPageNum fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_BulletinPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_BulletinPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_BulletinPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_BulletinPagePropertiesStart fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_BulletinPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_BulletinPagePropertiesPageNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_BulletinPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_BulletinPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_BulletinPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_BulletinPagePropertiesStart];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_BulletinPagePropertiesSize];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_BulletinPagePropertiesPageNum];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_BulletinPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_BulletinPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_BulletinPagePropertiesTotalPage];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_BulletinPagePropertiesStart];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_BulletinPagePropertiesSize];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_BulletinPagePropertiesPageNum];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_BulletinPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_BulletinPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_BulletinPagePropertiesTotalPage];
    [aCoder encodeDouble:_start forKey:kJCModel_BulletinPagePropertiesStart];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_BulletinPageProperties *copy = [[JCModel_BulletinPageProperties alloc] init];
    
    
    
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
