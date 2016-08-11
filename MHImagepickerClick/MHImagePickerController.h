//
//  UIImagePickerBlock.h
//  MHImagepickerClick
//
//  Created by 李钊 on 16/8/11.
//  Copyright © 2016年 Mmt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ImagePickerBlock)(UIImage *image);

@interface MHImagePickerController : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>


+(MHImagePickerController *)sharedImagePicker;
@property (copy, nonatomic) ImagePickerBlock imagePickerBlock;


-(void)showInVC:(UIViewController *)vc imagePickerBlock:(ImagePickerBlock)block;

@end
