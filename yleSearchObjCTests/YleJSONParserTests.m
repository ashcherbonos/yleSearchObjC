//
//  YleJSONParserTests.m
//  yleSearchObjCTests
//
//  Created by Oleksandr Shcherbonos on 4/14/18.
//  Copyright © 2018 Oleksandr Shcherbonos. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YleJSONParser.h"
#import "TvProgram.h"
#import "JSONParser.h"

@interface YleJSONParserTests : XCTestCase
@property (nonatomic, readonly) NSData *jsonTestData;
@property (nonatomic, readonly) YleJSONParser *parserUnderTest;
@property (nonatomic, readonly) NSArray *result;
@property (nonatomic, readonly) TvProgram *firstItem;
@end

@implementation YleJSONParserTests

@synthesize jsonTestData = _jsonTestData;

- (NSData *)jsonTestData {
    if(!_jsonTestData){
        NSBundle *bundle = [NSBundle bundleForClass:[YleJSONParserTests class]];
        NSString *path = [bundle pathForResource:@"test" ofType:@"json"];
        _jsonTestData = [NSData dataWithContentsOfFile:path];
    }
    return _jsonTestData;
}

@synthesize parserUnderTest = _parserUnderTest;

- (YleJSONParser *)parserUnderTest {
    if(!_parserUnderTest){
        _parserUnderTest = [[YleJSONParser alloc] init];
    }
    return _parserUnderTest;
}

@synthesize result = _result;

- (NSArray *)result {
    if(!_result){
        _result = [self.parserUnderTest parse:self.jsonTestData];
    }
    return _result;
}

@synthesize firstItem = _firstItem;

- (TvProgram *)firstItem {
    if(!_firstItem){
        _firstItem = self.result[0];
    }
    return _firstItem;
}

- (void)testUnitTestsWorksCorrect {
    XCTAssert(true);
}

- (void) testClassConformsJSONParserProtocol {
    XCTAssert([YleJSONParser conformsToProtocol:@protocol(JSONParser)]);
}

- (void) testParseReturnNotNil {
    // Assert
    XCTAssertNotNil(self.result);
}

- (void) testParseResultIsArrayOfTvProgramClass {
    XCTAssert([self.firstItem isKindOfClass:[TvProgram class]]);
}

- (void) testParseReturnExpectedDataAmount {
    // Arrange
    NSUInteger expectedCount = 2;
    // Act
    NSUInteger resultCount = self.result.count;
    // Assert
    XCTAssertEqual(expectedCount, resultCount);
}

- (void) testParseReturnExpectedTitle {
    // Arrange
    NSString *expectedTitle = @"Oktonautit ja merikilpikonnanpoikaset";
    // Act
    NSString *resultTitle = self.firstItem.title;
    // Assert
    XCTAssert([expectedTitle isEqualToString:resultTitle]);
}

- (void) testParseReturnExpectedDescription {
    // Arrange
    NSString *expectedDescription = @"Oktonautit ja merikilpikonnanpoikaset. Suuri aalto uhkaa pieniä merikilpikonnanpoikasia.";
    // Act
    NSString *resultDescription = self.firstItem.fullDescription;
    // Assert
    XCTAssert([expectedDescription isEqualToString:resultDescription]);
}

- (void) testParseReturnExpectedDataModified {
    // Arrange
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss.SSS";
    NSDate *expectedDataModified = [formatter dateFromString:@"2018/04/08 12:03:51.797"];
    // Act
    NSDate *resultDataModified = self.firstItem.dataModified;
    // Assert
    XCTAssert([expectedDataModified  isEqualToDate:resultDataModified]);
}

- (void) testParseReturnExpectedProgramType {
    // Arrange
    NSString *expectedProgramType = @"TVProgram";
    // Act
    NSString *resultProgramType = self.firstItem.programType;
    // Assert
    XCTAssert([expectedProgramType isEqualToString:resultProgramType]);
}

- (void) testParseReturnExpectedPreviewImageURL{
    // Arrange
    NSString *expectedUrlString = @"https://images.cdn.yle.fi/image/upload/w_256,h_256,c_thumb,r_max/bo_20px_solid_white/13-1-3391628-1522918692260.png";
    // Act
    NSURL *resultPreviewImageURL = self.firstItem.previewImageURL;
    // Assert
    XCTAssert([resultPreviewImageURL.absoluteString isEqualToString:expectedUrlString]);
}

- (void) testParseReturnExpectedFullImageURL{
    // Arrange
    int minDeviceSize = MIN(UIScreen.mainScreen.bounds.size.height, UIScreen.mainScreen.bounds.size.width);
    NSString *expectedUrlString = [NSString stringWithFormat: @"https://images.cdn.yle.fi/image/upload/w_%d,h_%d,c_fill/13-1-3391628-1522918692260.png", minDeviceSize, minDeviceSize];
    // Act
    NSURL *resultFullImageURL = self.firstItem.fullImageURL;
    // Assert
    XCTAssert([resultFullImageURL.absoluteString isEqualToString:expectedUrlString]);
}

@end
