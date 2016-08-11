//
//  UIImagePickerBlock.m
//  MHImagepickerClick
//
//  Created by 李钊 on 16/8/11.
//  Copyright © 2016年 Mmt. All rights reserved.
//

#import "MHImagePickerController.h"

@interface MHImagePickerController ()
{
    UIViewController *viewController;
}

@end

@implementation MHImagePickerController


+(MHImagePickerController *)sharedImagePicker
{
    static MHImagePickerController *sharedImagePicker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedImagePicker = [[self alloc] init];
    });
    return sharedImagePicker;
}

-(instancetype)init
{
    if (![super init]) {
        
    }
    return self;
}


-(void)showInVC:(UIViewController *)vc imagePickerBlock:(ImagePickerBlock)block
{
    
    self.imagePickerBlock = [block copy];
    viewController = vc;
    
    UIActionSheet *myActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:nil];
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        [myActionSheet addButtonWithTitle:@"拍照"];
    }
    
    [myActionSheet addButtonWithTitle:@"从手机相册选择"];
    
    [myActionSheet showInView:vc.view];
    
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [viewController presentViewController:picker animated:YES completion:nil];
    }
    else if (buttonIndex == 1)
    {
        UIImagePickerController *pickerC = [[UIImagePickerController alloc]init];
        //设置picker类型
        pickerC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //设置代理
        pickerC.delegate = self;
        //设置图片可以修改
        pickerC.allowsEditing = YES;
        [viewController presentViewController:pickerC animated:YES completion:nil];
    }
}



#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if (image) {
        self.imagePickerBlock(image);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //    weakify(self);
    [picker dismissViewControllerAnimated:YES completion:^{
        //        strongify(weakSelf);
        //        [strongSelf hide];
        self.imagePickerBlock(nil);

    }];
}

@end
