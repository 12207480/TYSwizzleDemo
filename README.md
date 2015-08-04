# TYSwizzleDemo
method swizzling easy to use ,and test demo

# usage

C Function

```objc

// exchange instance method
BOOL ty_swizzleInstanceMethod(Class aClass, SEL originalSel, SEL replacementSel);

// exchange class method
BOOL ty_swizzleClassMethod(Class aClass, SEL originalSel, SEL replacementSel);

// exchange method with IMP, and store orignal IMP
BOOL ty_swizzleMethodAndStoreIMP(Class aClass, SEL originalSel, IMP replacementIMP,IMP *orignalStoreIMP);

IMP  ty_swizzleMethodIMP(Class aClass, SEL originalSel, IMP replacementIMP);

```

NSObject Categary

```objc

// exchange instance method
+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel;

// exchange class method
+ (BOOL)ty_swizzleClassMethodWithOrignalSel:(SEL)orignalSel replacementSel:(SEL)replacementSel;

// exchange method with IMP, and store orignal IMP
+ (BOOL)ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementIMP:(IMP)replacementIMP orignalStoreIMP:(IMP *)orignalStoreIMP;

+ (IMP) ty_swizzleMethodWithOrignalSel:(SEL)orignalSel replacementIMP:(IMP)replacementIMP;

```
demo

```objc

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        ty_swizzleInstanceMethod(self, @selector(viewDidAppear:), @selector(TY_viewDidAppear:));
        ty_swizzleClassMethod(self, @selector(testSwizzle1ClassMothed), @selector(TY_testSwizzle1ClassMothed));
        //ty_swizzleMethodAndStoreIMP(self, @selector(testSetOldIMP), (IMP)testSetNewIMP,nil);
        //ty_swizzleMethodIMP(self, @selector(testSetOldIMP), (IMP)testSetNewIMP);
        
        [self ty_swizzleMethodWithOrignalSel:@selector(viewWillAppear:) replacementSel:@selector(TY_viewWillAppear:)];
        [self ty_swizzleClassMethodWithOrignalSel:@selector(testSwizzle2ClassMothed) replacementSel:@selector(TY_testSwizzle2ClassMothed)];
        [self ty_swizzleMethodWithOrignalSel:@selector(testSetOldIMP) replacementIMP:(IMP)testSetNewIMP orignalStoreIMP:nil];
        //[self ty_swizzleMethodWithOrignalSel:@selector(testSetOldIMP) replacementIMP:(IMP)testSetNewIMP];
    });
}

```
