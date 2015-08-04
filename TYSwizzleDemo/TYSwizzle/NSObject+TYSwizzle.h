//
//  NSObject+TYSwizzle.h
//  TYSwizzleDemo
//
//  Created by tanyang on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TYSwizzle)

// exchange instance method
+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel;

// exchange class method
+ (BOOL)ty_swizzleClassMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel;

// exchange method with IMP, and store orignal IMP
+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementIMP:(IMP)replacementIMP orignalStoreIMP:(IMP *)orignalStoreIMP;

+ (IMP) ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementIMP:(IMP)replacementIMP;

@end
