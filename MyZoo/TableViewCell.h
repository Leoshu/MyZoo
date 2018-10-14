//
//  TableViewCell.h
//  MyZoo
//
//  Created by Leo_hsu on 2018/10/14.
//  Copyright © 2018年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewItem.h"

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblBehavior;
@property (weak, nonatomic) IBOutlet UIImageView *ivPic;
@property (nonatomic, strong) ViewItem *item;

@end
