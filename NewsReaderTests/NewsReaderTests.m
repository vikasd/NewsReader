//
//  NewsReaderTests.m
//  NewsReaderTests
//
//  Created by vikas dalvi on 06/01/24.
//

#import <XCTest/XCTest.h>
#import "NewsListViewModel.h"

@interface NewsReaderTests : XCTestCase

@property (nonatomic, strong) NewsListViewModel *listViewModel;

@end

@implementation NewsReaderTests

- (void)setUp {
    [super setUp];
    self.listViewModel = [[NewsListViewModel alloc] init];
}

- (void)tearDown {
    self.listViewModel = nil;
    [super tearDown];
}

- (void)testEmptyArticlesArray {
    XCTAssertNil([self.listViewModel getArticle: 0], @"Should return nil if article is not present.");
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
