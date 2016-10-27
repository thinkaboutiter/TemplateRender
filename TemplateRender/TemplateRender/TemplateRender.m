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
    
    // scale image
    UIImage* scaledImage = [self imageWithImage:sourceImage scaledToSize:CGSizeMake(100, 100)];
    
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
    
    
//    UIImage* croppedImage = [sourceImage imageByCroppingToRect:CGRectMake(0, 0, 200, 200)];
    
    
    
//    UIImage* resultImage = [scaledImage imageWithPerspectiveCorrectionFromQuad:quad];

    
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m11 = 0.876519; //
    transform3D.m12 = 0.13591;
    transform3D.m13 = 0;
    transform3D.m14 = 0.000446692;
    
    transform3D.m21 = -0.00226594;
    transform3D.m22 = 0.730296; //
    transform3D.m23 = 0;
    transform3D.m24 = -0.000215114;
    
    transform3D.m31 = 0;
    transform3D.m32 = 0;
    transform3D.m33 = 1; //
    transform3D.m34 = 0;
    
    transform3D.m41 = 0;
    transform3D.m42 = 0;
    transform3D.m43 = 0;
    transform3D.m44 = 1; //
    
//    CATransform3D ivansTransform = CATransform3DRotate(CATransform3DIdentity, 45.0f * M_PI / 180.0f, 1.f, 1.0f, 0.0f);
    
    /*
     (0.876519 0.13591 0 0.000446692; -0.00226594 0.730296 0 -0.000215114; 0 0 1 0; 250.5 55.5 0 1)
     */
    
    UIImage* transformedImage = [scaledImage imageWithTransform:transform3D anchorPoint:CGPointMake(0, 0)];
    
    return transformedImage;
}

+ (UIImage *)templateImageFromSourceImage:(UIImage *)sourceImage andTransform3D:(CATransform3D)transform3D {
    
    // scale image
    UIImage* scaledImage = [self imageWithImage:sourceImage scaledToSize:CGSizeMake(100, 100)];
    
    // transform image
    UIImage* transformedImage = [scaledImage imageWithTransform:transform3D anchorPoint:CGPointMake(0, 0)];
    
    return transformedImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
