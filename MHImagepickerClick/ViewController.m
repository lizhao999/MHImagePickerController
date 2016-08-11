//
//  ViewController.m
//  MHImagepickerClick
//
//  Created by 李钊 on 16/8/11.
//  Copyright © 2016年 Mmt. All rights reserved.
//

#import "ViewController.h"
#import "MHImagePickerController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    MHImagePickerController *imagePicker = [MHImagePickerController sharedImagePicker];
    [imagePicker showInVC:self imagePickerBlock:^(UIImage *image) {
       
        
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
