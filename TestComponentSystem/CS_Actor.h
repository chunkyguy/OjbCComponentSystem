//
//  CS_Actor.h
//  TestComponentSystem
//
//  Created by Sid on 05/08/14.
//  Copyright (c) 2014 whackylabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Actor : NSObject

- (void)render;
- (void)update:(int)dt;

@end
