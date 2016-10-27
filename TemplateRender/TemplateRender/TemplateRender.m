//
//  TemplateRender.m
//  TemplateRender
//
//  Created by boyankov on W43 27/10/2016 Thu.
//  Copyright © 2016 boyankov@yahoo.com. All rights reserved.
//

#import "TemplateRender.h"
//#import <AGGeometryKit/UIImage+AGKQuad.h>
#import <AGGeometryKit/AGGeometryKit.h>

@implementation TemplateRender

+ (UIImage *)templateImageFromSourceImage:(UIImage *)sourceImage {
    
//    CGPoint tl = CGPointMake(0, 0);
//    CGPoint tr = CGPointMake(0, 10);
//    CGPoint br = CGPointMake(10, -10);
//    CGPoint bl = CGPointMake(10, 0);
//    
//    AGKQuad quad = AGKQuadMake(tl, tr, br, bl);
    /*
     struct CATransform3D
     {
         CGFloat m11, m12, m13, m14;
         CGFloat m21, m22, m23, m24;
         CGFloat m31, m32, m33, m34;
         CGFloat m41, m42, m43, m44;
     };
     
     IdentityMatrix
     {
         CGFloat 1, 0, 0, 0;
         CGFloat 0, 1, 0, 0;
         CGFloat 0, 0, 1, 0;
         CGFloat 0, 0, 0, 1;
     };
     */
    
    
    UIImage* croppedImage = [sourceImage imageByCroppingToRect:CGRectMake(0, 0, 200, 200)];
//    UIImage* resultImage = [croppedImage imageWithPerspectiveCorrectionFromQuad:quad];
    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m11 = 1; //
    transform3D.m12 = 0.2;
    transform3D.m13 = 0;
    transform3D.m14 = 0;
    
    transform3D.m21 = 0.2;
    transform3D.m22 = 1; //
    transform3D.m23 = 0;
    transform3D.m24 = 0;
    
    transform3D.m31 = 0;
    transform3D.m32 = 0;
    transform3D.m33 = 1; //
    transform3D.m34 = 0;
    
    transform3D.m41 = 0;
    transform3D.m42 = 0;
    transform3D.m43 = 0;
    transform3D.m44 = 1; //
    
//    CATransform3D transform3D = CATransform3DRotate(<#CATransform3D t#>, <#CGFloat angle#>, <#CGFloat x#>, <#CGFloat y#>, <#CGFloat z#>)
    
    UIImage* transformedImage = [croppedImage imageWithTransform:transform3D anchorPoint:CGPointMake(0, 0)];
    
    return transformedImage;
}
@end
