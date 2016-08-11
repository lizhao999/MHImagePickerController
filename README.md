# MHImagePickerController
Imagepicker 选择图片  block
 
    MHImagePickerController *imagePicker = [MHImagePickerController sharedImagePicker];
    [imagePicker showInVC:self imagePickerBlock:^(UIImage *image) {
               
    }];