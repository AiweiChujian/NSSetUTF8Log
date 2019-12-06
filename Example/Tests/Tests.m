//
//  NSSetUTF8LogTests.m
//  NSSetUTF8LogTests
//
//  Created by oovsxx@163.com on 12/05/2019.
//  Copyright (c) 2019 oovsxx@163.com. All rights reserved.
//

@import XCTest;

@interface Tests : XCTestCase

@property (nonatomic, strong)NSSet *studentSet;

@property (nonatomic, strong)NSRegularExpression *rx;

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    NSDictionary *student1 = @{@"姓名":@"小明",@"性别":@"男",@"年龄":@"14"};
    NSDictionary *student2 = @{@"姓名":@"小红",@"性别":@"女",@"年龄":@"13"};
    
    self.studentSet = [NSSet setWithObjects:student1,student2, nil];
    self.rx = [[NSRegularExpression alloc]initWithPattern:@"\\\\?\\\\[uU]\\w{4}" options:0 error:nil];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArrayLog
{
    NSString *arrayDes = _studentSet.allObjects.description;
    NSArray *arrayDesMatches = [_rx matchesInString:arrayDes options:0 range:NSMakeRange(0, arrayDes.length)];
    NSAssert(arrayDesMatches.count == 0, @"NSArray中有未转换字段");
}

- (void)testSetLog
{
    NSString *setDes = _studentSet.description;
       NSArray *setDesMatches = [_rx matchesInString:setDes options:0 range:NSMakeRange(0, setDes.length)];
    NSAssert(setDesMatches.count == 0, @"NSSet中有未转换字段");
}

- (void)testDicLog
{
    NSDictionary *classes = @{@"班级名称":@"2019级2班",
                              @"学生":_studentSet.allObjects,
                             };
    NSString *dicDes = classes.description;
    NSArray *dicDesMatches = [_rx matchesInString:dicDes options:0 range:NSMakeRange(0, dicDes.length)];
    NSAssert(dicDesMatches.count == 0, @"NSDictionary中有未转换字段");
}
@end

