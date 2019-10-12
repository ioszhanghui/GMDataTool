//
//  GMViewController.m
//  GMDataTool
//
//  Created by ioszhanghui@163.com on 09/30/2019.
//  Copyright (c) 2019 ioszhanghui@163.com. All rights reserved.
//

#import "GMViewController.h"
#import "NSObject+CategoryMethod.h"

#import "GMKeyedArchiverTool.h"

#import "GM_DataHeader.h"

#import "SVProgressHUD.h"

#import "GMPhoneInfo_Header.h"



@interface Animal : NSObject

@property(nonatomic,copy)NSString * name;

@property(nonatomic,assign)NSInteger age;

@property(nonatomic,strong)NSNumber * maxValue;
@property(nonatomic,strong)NSDictionary * info;

-(void)run;


@end


@implementation Animal

-(void)run{
    NSLog(@"跑起来");
}

@end

@interface Dog:Animal

-(void)bark;

-(void)run;

@end

@implementation Dog


-(void)run{
    [super run];
    NSLog(@"狗跑起来");
}
-(void)bark{
    NSLog(@"叫起来");
}

@end


@interface GMViewController ()

@end

@implementation GMViewController

+(void)load{
    [GMViewController swizzleObjectMethod:@selector(testDemo1) SwizzleSel:@selector(testDemo2)];
    [GMViewController swizzleObjectMethod:@selector(test1) SwizzleSel:@selector(test2)];
    
    [Dog swizzleObjectMethod:@selector(run) SwizzleSel:@selector(bark)];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self class]testDemo2];
    [[self class]testDemo1];
    [self test1];
    [self test2];

    Dog * dog = [Dog new];
    [dog run];
    [dog bark];
    
    Animal * animal = [Animal new];
    [animal run];

//    [ SVProgressHUD showWithStatus:@"测试"];
    
//    [GMKeyChainTool resetKeyChainData];
    
    [GMKeyChainTool  saveAccountInfo:@"99999"];
    [GMKeyChainTool savePasswordInfo:@"123456"];
    
    NSLog(@"%@",[GMKeyChainTool accountInfo]);
    NSLog(@"%@",[GMKeyChainTool passwordInfo]);
    
    NSLog(@"%@",[UIDevice currentDevice].IDFA);
    
    [GMSAMKeyChainTool saveContent:@"-00000" forKey:@"aaaaaa"];
    
//    [GMSAMKeyChainTool deleteContentforKey:@"aaaaaa"];
//    [GMSAMKeyChainTool clearAllContent];
    NSLog(@"%@",[GMSAMKeyChainTool getContentforKey:@"aaaaaa"]);
    NSLog(@"%@",[GMSAMKeyChainTool SAMKeyChainList]);

//    NSDictionary * json = @{
//                            @"name":@"xxx",
//                            @"age":@(20),
//                            @"maxValue":[NSNumber numberWithInteger:10],
//                            @"info":@{@"index":@"0"}
//                            };
//
//    [GMKeyedArchiverTool setKeyedArchiverUserDefinedValue:json Obj:[Animal class]];
//
//    Animal * animal = [GMKeyedArchiverTool getKeyArchiveUserDefinedValueFor:[Animal class]];
//    NSLog(@"%@",animal.name);
//    NSLog(@"%@",[animal valueForKey:@"name"]);
    
}

-(void)test1{
    NSLog(@"test1");
}
-(void)test2{
    NSLog(@"test2");
}

+(void)testDemo1{
    NSLog(@"testDemo1");
}

+(void)testDemo2{
    NSLog(@"testDemo2");
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
