# TYSwizzleDemo
method swizzling easy to use ,and test demo

# usage

## C Function

```objc

// exchange instance method
BOOL ty_swizzleInstanceMethod(Class aClass, SEL originalSel, SEL replacementSel);

// exchange class method
BOOL ty_swizzleClassMethod(Class aClass, SEL originalSel, SEL replacementSel);

// exchange method with IMP, and store orignal IMP
IMP  ty_swizzleMethodIMP(Class aClass, SEL originalSel, IMP replacementIMP);

BOOL ty_swizzleMethodAndStoreIMP(Class aClass, SEL originalSel, IMP replacementIMP,IMP *orignalStoreIMP);

```

## NSObject Categary

```objc

// exchange instance method
+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel;

// exchange class method
+ (BOOL)ty_swizzleClassMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel;

// exchange method with IMP, and store orignal IMP
+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementIMP:(IMP)replacementIMP orignalStoreIMP:(IMP *)orignalStoreIMP;

+ (IMP) ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementIMP:(IMP)replacementIMP;

```
