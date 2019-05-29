//
//  JCModel_reimbursementPageProperties.m
//
//  Created by   on 2019/3/18
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "JCModel_reimbursementPageProperties.h"


NSString *const kJCModel_reimbursementPagePropertiesSize = @"size";
NSString *const kJCModel_reimbursementPagePropertiesStart = @"start";
NSString *const kJCModel_reimbursementPagePropertiesEnd = @"end";
NSString *const kJCModel_reimbursementPagePropertiesCount = @"count";
NSString *const kJCModel_reimbursementPagePropertiesTotalPage = @"totalPage";
NSString *const kJCModel_reimbursementPagePropertiesPageNum = @"pageNum";


@interface JCModel_reimbursementPageProperties ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JCModel_reimbursementPageProperties

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
            self.size = [[self objectOrNilForKey:kJCModel_reimbursementPagePropertiesSize fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kJCModel_reimbursementPagePropertiesStart fromDictionary:dict] doubleValue];
            self.endProperty = [[self objectOrNilForKey:kJCModel_reimbursementPagePropertiesEnd fromDictionary:dict] doubleValue];
            self.count = [[self objectOrNilForKey:kJCModel_reimbursementPagePropertiesCount fromDictionary:dict] doubleValue];
            self.totalPage = [[self objectOrNilForKey:kJCModel_reimbursementPagePropertiesTotalPage fromDictionary:dict] doubleValue];
            self.pageNum = [[self objectOrNilForKey:kJCModel_reimbursementPagePropertiesPageNum fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kJCModel_reimbursementPagePropertiesSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kJCModel_reimbursementPagePropertiesStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.endProperty] forKey:kJCModel_reimbursementPagePropertiesEnd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kJCModel_reimbursementPagePropertiesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalPage] forKey:kJCModel_reimbursementPagePropertiesTotalPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageNum] forKey:kJCModel_reimbursementPagePropertiesPageNum];

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

    self.size = [aDecoder decodeDoubleForKey:kJCModel_reimbursementPagePropertiesSize];
    self.start = [aDecoder decodeDoubleForKey:kJCModel_reimbursementPagePropertiesStart];
    self.endProperty = [aDecoder decodeDoubleForKey:kJCModel_reimbursementPagePropertiesEnd];
    self.count = [aDecoder decodeDoubleForKey:kJCModel_reimbursementPagePropertiesCount];
    self.totalPage = [aDecoder decodeDoubleForKey:kJCModel_reimbursementPagePropertiesTotalPage];
    self.pageNum = [aDecoder decodeDoubleForKey:kJCModel_reimbursementPagePropertiesPageNum];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_size forKey:kJCModel_reimbursementPagePropertiesSize];
    [aCoder encodeDouble:_start forKey:kJCModel_reimbursementPagePropertiesStart];
    [aCoder encodeDouble:_endProperty forKey:kJCModel_reimbursementPagePropertiesEnd];
    [aCoder encodeDouble:_count forKey:kJCModel_reimbursementPagePropertiesCount];
    [aCoder encodeDouble:_totalPage forKey:kJCModel_reimbursementPagePropertiesTotalPage];
    [aCoder encodeDouble:_pageNum forKey:kJCModel_reimbursementPagePropertiesPageNum];
}

- (id)copyWithZone:(NSZone *)zone {
    JCModel_reimbursementPageProperties *copy = [[JCModel_reimbursementPageProperties alloc] init];
    
    
    
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
