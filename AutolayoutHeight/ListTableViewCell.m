//
//  ListTableViewCell.m
//  AutolayoutHeight
//
//  Created by forever on 2016/10/11.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "ListTableViewCell.h"
#import "ListModel.h"

@interface ListTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *contentLable;

@end

@implementation ListTableViewCell


- (void)setModel:(ListModel *)model
{
    _model = model;
    self.contentLable.text = model.desc;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
