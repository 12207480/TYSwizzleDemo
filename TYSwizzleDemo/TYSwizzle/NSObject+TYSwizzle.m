//
//  NSObject+TYSwizzle.m
//  TYSwizzleDemo
//
//  Created by SunYong on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "NSObject+TYSwizzle.h"
#import "TYSwizzle.h"

@implementation NSObject (TYSwizzle)

+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel
{
    return ty_swizzleInstanceMethod(self, orignalSel, replacementSel);
}

+ (BOOL)ty_swizzleClassMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel
{
    return ty_swizzleClassMethod(self, orignalSel, replacementSel);
}

@end
