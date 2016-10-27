//
//  TemplateRender.h
//  TemplateRender
//
//  Created by boyankov on W43 27/10/2016 Thu.
//  Copyright © 2016 boyankov@yahoo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface TemplateRender : NSObject

//+ (UIImage*)templateImageFromSourceImage:(UIImage*)sourceImage;
+ (UIImage *)templateImageFromSourceImage:(UIImage *)sourceImage andTransform3D:(CATransform3D)transform3D;

@end
