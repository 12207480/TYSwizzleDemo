//
//  ViewController.m
//  TYSwizzleDemo
//
//  Created by SunYong on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "ViewController.h"
#import "TYSwizzle.h"
#import "NSObject+TYSwizzle.h"

@interface ViewController ()

@end

@implementation ViewController

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        ty_swizzleInstanceMethod(self, @selector(viewDidAppear:), @selector(TY_viewDidAppear:));
        ty_swizzleClassMethod(self, @selector(testSwizzle1ClassMothed), @selector(TY_testSwizzle1ClassMothed));
        //ty_swizzleMethodAndStoreIMP(self, @selector(testSetOldIMP), (IMP)testSetNewIMP,nil);
        ty_swizzleMethodIMP(self, @selector(testSetOldIMP), (IMP)testSetNewIMP);
        
        [self ty_swizzleMethodWithOrignalSel:@selector(viewWillAppear:) replacementSel:@selector(TY_viewWillAppear:)];
        [self ty_swizzleClassMethodWithOrignalSel:@selector(testSwizzle2ClassMothed) replacementSel:@selector(TY_testSwizzle2ClassMothed)];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [ViewController testSwizzle1ClassMothed];
    [ViewController testSwizzle2ClassMothed];
    [self testSetOldIMP];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s ----",__FUNCTION__);
}

- (void)TY_viewWillAppear:(BOOL)animated
{
    [self TY_viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

// method call order : TY_viewDidAppear -> viewDidAppear -> [super viewDidAppear]

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s ----",__FUNCTION__);
}

- (void)TY_viewDidAppear:(BOOL)animated
{
    [self TY_viewDidAppear:animated]; // this call viewDidAppear
    NSLog(@"%s",__FUNCTION__);
}

+ (void)testSwizzle1ClassMothed
{
    NSLog(@"%s ----",__FUNCTION__);
}

+ (void)TY_testSwizzle1ClassMothed
{
    [self TY_testSwizzle1ClassMothed]; // call testSwizzleClassMothed
    NSLog(@"%s",__FUNCTION__);
}

+ (void)testSwizzle2ClassMothed
{
    NSLog(@"%s ----",__FUNCTION__);
}

+ (void)TY_testSwizzle2ClassMothed
{
    [self TY_testSwizzle2ClassMothed]; // call testSwizzleClassMothed
    NSLog(@"%s",__FUNCTION__);
}

- (void)testSetOldIMP
{
    NSLog(@"%s",__FUNCTION__);
}

void testSetNewIMP(id self, SEL _cmd)
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


