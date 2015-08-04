//
//  TYSwizzle.m
//  TYSwizzleDemo
//
//  Created by tanyang on 15/7/22.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import <objc/objc-runtime.h>
#import <objc/objc-class.h>
#import <Foundation/Foundation.h>

BOOL ty_swizzleInstanceMethod(Class aClass, SEL originalSel, SEL replacementSel)
{
    Method origMethod = class_getInstanceMethod(aClass, originalSel);
    Method replMethod = class_getInstanceMethod(aClass, replacementSel);
    
    if (!origMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), aClass);
        return NO;
    }
    
    if (!replMethod) {
        NSLog(@"replace method %@ not found for class %@", NSStringFromSelector(replacementSel), aClass);
        return NO;
    }
    
    if (class_addMethod(aClass, originalSel, method_getImplementation(replMethod), method_getTypeEncoding(replMethod)))
    {
        class_replaceMethod(aClass, replacementSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        method_exchangeImplementations(origMethod, replMethod);
    }
    return YES;
}

BOOL ty_swizzleClassMethod(Class aClass, SEL originalSel, SEL replacementSel)
{
   return ty_swizzleInstanceMethod(object_getClass((id)aClass), originalSel, replacementSel);
}

IMP  ty_swizzleMethodIMP(Class aClass, SEL originalSel, IMP replacementIMP)
{
    Method origMethod = class_getInstanceMethod(aClass, originalSel);
    
    if (!origMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), aClass);
        return NULL;
    }
    
    IMP origIMP = method_getImplementation(origMethod);
    
    if(!class_addMethod(aClass, originalSel, replacementIMP,
                        method_getTypeEncoding(origMethod)))
    {
        method_setImplementation(origMethod, replacementIMP);
    }
    return origIMP;
}

// other way implement
BOOL  ty_swizzleMethodAndStoreIMP(Class aClass, SEL originalSel, IMP replacementIMP,IMP *orignalStoreIMP)
{
    IMP imp = NULL;
    Method method = class_getInstanceMethod(aClass, originalSel);
    
    if (method) {
        const char *type = method_getTypeEncoding(method);
        imp = class_replaceMethod(aClass, originalSel, replacementIMP, type);
        if (!imp) {
            imp = method_getImplementation(method);
        }
    }else{
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(originalSel), aClass);
    }
    
    if (imp && orignalStoreIMP)
    {
        *orignalStoreIMP = imp;
    }
    return (imp != NULL);
}


