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

- (void)setNormalMatrix:(NSString *)nMat;
{
    // remove uneccessary characters from string..
    nMat = [nMat stringByReplacingOccurrencesOfString:@"{" withString:@""];
    nMat = [nMat stringByReplacingOccurrencesOfString:@"}" withString:@""];
    nMat = [nMat stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // build an NSArray with string components and convert them to an array of floats
    NSArray* array = [nMat componentsSeparatedByString:@","];
    float data[9];
    for(int i = 0; i < 9; ++i){
        data[i] = [[array objectAtIndex:i] floatValue];
    }
    
    _normalMatrix = GLKMatrix3MakeWithArray(data);
}

- (void)setModelViewProjectionMatrix:(NSString *)mvpMat;
{
    // remove uneccessary characters from string..
    mvpMat = [mvpMat stringByReplacingOccurrencesOfString:@"{" withString:@""];
    mvpMat = [mvpMat stringByReplacingOccurrencesOfString:@"}" withString:@""];
    mvpMat = [mvpMat stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // build an NSArray with string components and convert them to an array of floats
    NSArray* array = [mvpMat componentsSeparatedByString:@","];
    float data[16];
    for(int i = 0; i < 16; ++i){
        data[i] = [[array objectAtIndex:i] floatValue];
    }
    
    _modelViewProjectionMatrix = GLKMatrix4MakeWithArray(data);
}

- (void)render;
{
    glUniformMatrix4fv(uniforms[UNIFORM_MODELVIEWPROJECTION_MATRIX], 1, 0, _modelViewProjectionMatrix.m);
    glUniformMatrix3fv(uniforms[UNIFORM_NORMAL_MATRIX], 1, 0, _normalMatrix.m);

    glDrawArrays(GL_TRIANGLES, 0, 36);
}

@end
