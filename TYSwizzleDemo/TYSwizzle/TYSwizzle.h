//
//  TYSwizzle.h
//  TYSwizzleDemo
//
//  Created by tanyang on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <objc/objc.h>

BOOL ty_swizzleInstanceMethod(Class aClass, SEL originalSel, SEL replacementSel);

BOOL ty_swizzleClassMethod(Class aClass, SEL originalSel, SEL replacementSel);

IMP  ty_swizzleMethodIMP(Class aClass, SEL originalSel, IMP replacementIMP);

// other way implement
BOOL ty_swizzleMethodAndStoreIMP(Class aClass, SEL originalSel, IMP replacementIMP,IMP *orignalStoreIMP);