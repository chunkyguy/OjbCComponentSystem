//
//  RenderComponent.h
//  TestComponentSystem
//
//  Created by Sid on 05/08/14.
//  Copyright (c) 2014 whackylabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

// Uniform index.
enum
{
    UNIFORM_MODELVIEWPROJECTION_MATRIX,
    UNIFORM_NORMAL_MATRIX,
    NUM_UNIFORMS
};
GLint uniforms[NUM_UNIFORMS];


@interface RenderComponent : NSObject

- (void)setNormalMatrix:(NSString *)nMat;
- (void)setModelViewProjectionMatrix:(NSString *)mvpMat;

- (void)render;

@end
