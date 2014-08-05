//
//  GameObject.h
//  TestComponentSystem
//
//  Created by Sid on 05/08/14.
//  Copyright (c) 2014 whackylabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RenderComponent.h"
#import "PhysicsComponent.h"

@interface GameObject : NSObject

+ (GameObject *)emptyObject;

- (void)enablePhysicsComponent;
- (void)enableRenderComponent;

@end
