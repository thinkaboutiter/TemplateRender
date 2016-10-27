//
//  ViewController.m
//  TemplateRender
//
//  Created by boyankov on W43 27/10/2016 Thu.
//  Copyright © 2016 boyankov@yahoo.com. All rights reserved.
//

#import "ViewController.h"
#import "TemplateRender.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *templateImageView;

@end

@implementation ViewController

#pragma mark Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configureImageView:self.templateImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Configurations

- (void)configureImageView:(UIImageView*)imageView
{
    imageView.contentMode = UIViewContentModeCenter;
}


#pragma mark Actions

- (IBAction)transformButtonTapped:(UIButton *)sender {
    UIImage* sourceImage = [UIImage imageNamed:@"template_PNG"];
    
    // create templateImage
    UIImage* templateImage = [TemplateRender templateImageFromSourceImage:sourceImage];
    
    // update imageView
    self.templateImageView.image = templateImage;
}

- (IBAction)resetButtonTapped:(UIButton *)sender {
    self.templateImageView.image = nil;
}

@end
