//
//  TYSwizzle.h
//  TYSwizzleDemo
//
//  Created by SunYong on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <objc/objc.h>

BOOL ty_swizzleInstanceMethod(Class aClass, SEL originalSel, SEL replacementSel);

BOOL ty_swizzleClassMethod(Class aClass, SEL originalSel, SEL replacementSel);
