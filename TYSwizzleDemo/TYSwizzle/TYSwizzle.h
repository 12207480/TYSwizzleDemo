//
//  TYSwizzle.h
//  TYSwizzleDemo
//
//  Created by tanyang on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <objc/objc.h>

// exchange instance method
BOOL ty_swizzleInstanceMethod(Class aClass, SEL originalSel, SEL replacementSel);

// exchange class method
BOOL ty_swizzleClassMethod(Class aClass, SEL originalSel, SEL replacementSel);

// exchange method with IMP, and store orignal IMP
BOOL ty_swizzleMethodAndStoreIMP(Class aClass, SEL originalSel, IMP replacementIMP,IMP *orignalStoreIMP);

IMP  ty_swizzleMethodIMP(Class aClass, SEL originalSel, IMP replacementIMP);