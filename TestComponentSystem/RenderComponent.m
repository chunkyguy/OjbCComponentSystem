//
//  RenderComponent.m
//  TestComponentSystem
//
//  Created by Sid on 05/08/14.
//  Copyright (c) 2014 whackylabs. All rights reserved.
//

#import "RenderComponent.h"

@interface RenderComponent ()
{
    GLKMatrix4 _modelViewProjectionMatrix;
    GLKMatrix3 _normalMatrix;
}

@end

@implementation RenderComponent

- (void)setNormalMatrix:(NSValue *)nMat;
{
    [nMat getValue:&_normalMatrix];
}

- (void)setModelViewProjectionMatrix:(NSValue *)mvpMat;
{
    [mvpMat getValue:&_modelViewProjectionMatrix];
}

- (void)render;
{
    glUniformMatrix4fv(uniforms[UNIFORM_MODELVIEWPROJECTION_MATRIX], 1, 0, _modelViewProjectionMatrix.m);
    glUniformMatrix3fv(uniforms[UNIFORM_NORMAL_MATRIX], 1, 0, _normalMatrix.m);

    glDrawArrays(GL_TRIANGLES, 0, 36);
}

@end
