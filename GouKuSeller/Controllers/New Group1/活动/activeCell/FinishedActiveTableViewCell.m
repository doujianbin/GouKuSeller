//
//  FinishedActiveTableViewCell.m
//  GouKuSeller
//
//  Created by 窦建斌 on 2018/3/26.
//  Copyright © 2018年 窦建斌. All rights reserved.
//

#import "FinishedActiveTableViewCell.h"
#import "DateUtils.h"

@implementation FinishedActiveTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.lab_activeName = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_activeName];
        [self.lab_activeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(14);
            make.width.mas_equalTo(SCREEN_WIDTH - 80);
        }];
        [self.lab_activeName setTextColor:[UIColor colorWithHexString:@"#000000"]];
        [self.lab_activeName setFont:[UIFont systemFontOfSize:16]];
        
        self.lab_activeTime = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_activeTime];
        [self.lab_activeTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lab_activeName.mas_bottom).offset(5);
            make.left.equalTo(self.lab_activeName);
            make.width.mas_equalTo(SCREEN_WIDTH - 85);
        }];
        [self.lab_activeTime setTextColor:[UIColor colorWithHexString:@"#616161"]];
        [self.lab_activeTime setFont:[UIFont systemFontOfSize:13]];
        
        self.lab_activeStatus = [[UILabel alloc]init];
        [self.lab_activeStatus setText:@"已停止"];
        [self.lab_activeStatus setTextAlignment:NSTextAlignmentRight];
        [self.lab_activeStatus setTextColor:[UIColor colorWithHexString:@"#616161"]];
        [self.contentView addSubview:self.lab_activeStatus];
        [self.lab_activeStatus mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH - 70);
            make.top.equalTo(self.lab_activeName);
            make.right.equalTo(self.mas_right).offset(-13);
        }];
        [self.lab_activeStatus setFont:[UIFont systemFontOfSize:16]];
        
        self.lab_activeType = [[UILabel alloc]init];
        [self.contentView addSubview:self.lab_activeType];
        [self.lab_activeType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lab_activeStatus.mas_bottom).offset(5);
            make.right.equalTo(self.mas_right).offset(-13);
        }];
        [self.lab_activeType setTextColor:[UIColor colorWithHexString:@"#616161"]];
        [self.lab_activeType setFont:[UIFont systemFontOfSize:13]];
        
    }
    return self;
}

- (void)contentCellWithActivityEntity:(ActivityEntity *)activityEntity{
    self.lab_activeName.text = activityEntity.title;
    self.lab_activeTime.text = [NSString stringWithFormat:@"%@至%@",[DateUtils stringFromTimeInterval:activityEntity.startTime formatter:@"yyyy-MM-dd"],[DateUtils stringFromTimeInterval:activityEntity.endTime formatter:@"yyyy-MM-dd"]];
    if ([activityEntity.actType intValue] == 0) {
        [self.lab_activeType setText:@"满减"];
    }else if ([activityEntity.actType intValue] == 1){
        [self.lab_activeType setText:@"单品-折扣"];
    }else if ([activityEntity.actType intValue] == 2){
        [self.lab_activeType setText:@"单品-特价"];
    }else if ([activityEntity.actType intValue] == 3){
        [self.lab_activeType setText:@"单品-立减"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
