//
//  GeelyLittleSettingTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/2.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLittleSettingTableViewCell.h"


static NSInteger i = 0;
@implementation GeelyLittleSettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.Wselected = NO;
    if (i<=5) {
        UIImage *image = [[SingleModel sharedInstance].cellImages objectAtIndex:i];
        self.contentImageView = [[UIImageView alloc] initWithImage:image];
        self.contentImageView.backgroundColor = [UIColor clearColor];
        self.contentImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.contentImageView.frame = CGRectMake(10, (57 - image.size.height)/2, image.size.width, image.size.height);
        [self addSubview:self.contentImageView];
    }
    
    
    NSLog(@"会调用几次呢:%ld",i);
    i +=1;
    // Initialization code
}

-(void)viewAddSelectedImage:(NSIndexPath *)indexPath cancleImage:(UIImage *)cImage {
    if (self.Wselected) {
        self.contentImageView.image = [[SingleModel sharedInstance].cellImages objectAtIndex:indexPath.row];
    }else{
        self.contentImageView.image = cImage;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void)setSelected:(BOOL)selected {
//    
//}

@end
