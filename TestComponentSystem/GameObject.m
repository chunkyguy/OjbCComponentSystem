//
//  GameObject.m
//  TestComponentSystem
//
//  Created by Sid on 05/08/14.
//  Copyright (c) 2014 whackylabs. All rights reserved.
//

#import "GameObject.h"

@interface GameObject () {
 
    RenderComponent *renderComponent;
    PhysicsComponent *physicsComponent;
    
}
@end

@implementation GameObject

+ (GameObject *)emptyObject
{
    return [[GameObject alloc] init];
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    physicsComponent = nil;
    renderComponent = nil;
    
    return self;
}

- (void)dealloc
{
    if (physicsComponent) {
        [physicsComponent release];
    }
    if (renderComponent) {
        [renderComponent release];
    }
    [super dealloc];
}

- (void)enablePhysicsComponent
{
    physicsComponent = [[PhysicsComponent alloc] init];
}

- (void)enableRenderComponent
{
    renderComponent = [[RenderComponent alloc] init];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ( [super respondsToSelector:aSelector] ) {
        return YES;
    } else if(renderComponent && [renderComponent respondsToSelector:aSelector]) {
        return YES;
    }  else if(physicsComponent && [physicsComponent respondsToSelector:aSelector]) {
        return YES;
    }
    return NO;
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature* signature = [super methodSignatureForSelector:selector];
    if (signature) {
        return signature;
    }
    
    if (renderComponent) {
        signature = [renderComponent methodSignatureForSelector:selector];
        if (signature) {
            return signature;
        }
    }

    if (physicsComponent) {
        signature = [physicsComponent methodSignatureForSelector:selector];
        if (signature) {
            return signature;
        }
    }

    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([renderComponent respondsToSelector: [anInvocation selector]]) {
        [anInvocation invokeWithTarget:renderComponent];
    } else if ([physicsComponent respondsToSelector: [anInvocation selector]]) {
        [anInvocation invokeWithTarget:physicsComponent];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

@end

