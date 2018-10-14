//
//  TableViewCell.m
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import "TableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setItem:(ViewItem *)item {
    self.lblName.text = item.name;
    self.lblBehavior.text = item.behavior;
    self.lblLocation.text = item.location;
    [self.ivPic sd_setImageWithURL:[NSURL URLWithString:item.imgUrl]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}

@end
