//
//  EIOSViewController.m
//  exifIOS
//
//  Created by Christoffer Magnussen on 4/2/13.
//  Copyright (c) 2013 Christoffer Magnussen. All rights reserved.
//

#import "EIOSViewController.h"

@implementation EIOSViewController

@synthesize text;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"IMG_0136" ofType:@"JPG"];
    NSURL *imageFileURL = [NSURL fileURLWithPath:path];
    CFURLRef imageURL = (CFURLRef)CFBridgingRetain(imageFileURL);
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL(imageURL, NULL);
    
    if (imageSource == NULL) {
        text.text = @"No image found";
        CFRelease(imageURL);
    }
    CFDictionaryRef props = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
    CFRelease(imageURL);
    CFRelease(imageSource);
    if (props) {
        text.text = [NSString stringWithFormat:@"%@", props];
        CFRelease(props);
    } else {
        text.text = @"No props";
    }
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
