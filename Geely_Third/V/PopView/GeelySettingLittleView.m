//
//  GeelySettingLittleView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySettingLittleView.h"
#import "GeelyLittleSettingTableViewCell.h"

@interface  GeelySettingLittleView() <UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableView_;
    NSArray *sImageArray;
    NSArray *cImageArray;
}

@end

@implementation GeelySettingLittleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.conttView = [[[NSBundle mainBundle] loadNibNamed:@"geelysettinglittle" owner:self options:nil]firstObject];
        self.conttView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        self.conttView.backgroundColor = [UIColor redColor];
        [self addSubview:self.conttView];
        [self.closebtn addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
        
        sImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"无线充电s"],[UIImage imageNamed:@"环绕声s"],[UIImage imageNamed:@"蓝牙s"],[UIImage imageNamed:@"车载热点s"],[UIImage imageNamed:@"行驶中视频限制s"],[UIImage imageNamed:@"行车记录仪s"], nil];
        cImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"无线充电c"],[UIImage imageNamed:@"环绕声c"],[UIImage imageNamed:@"蓝牙c"],[UIImage imageNamed:@"车载热点c"],[UIImage imageNamed:@"行驶中视频限制c"],[UIImage imageNamed:@"行车记录仪c"], nil];
        [SingleModel sharedInstance].cellImages = [cImageArray copy];

        tableView_ = (UITableView *)[self.conttView viewWithTag:909];
        tableView_.delegate = self;
        tableView_.dataSource = self;
        tableView_.rowHeight = 57;
        tableView_.backgroundColor = [UIColor clearColor];
        
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelyLittleSettingTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"littlesetting"];
        
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(![SingleModel sharedInstance].cellImages.count){
        sImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"无线充电s"],[UIImage imageNamed:@"环绕声s"],[UIImage imageNamed:@"蓝牙s"],[UIImage imageNamed:@"车载热点s"],[UIImage imageNamed:@"行驶中视频限制s"],[UIImage imageNamed:@"行车记录仪s"], nil];
        cImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"无线充电c"],[UIImage imageNamed:@"环绕声c"],[UIImage imageNamed:@"蓝牙c"],[UIImage imageNamed:@"车载热点c"],[UIImage imageNamed:@"行驶中视频限制c"],[UIImage imageNamed:@"行车记录仪c"], nil];
        [SingleModel sharedInstance].cellImages = [cImageArray copy];
    }
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyLittleSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"littlesetting" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 5) {
        cell.bottonLine.hidden = YES;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    GeelyLittleSettingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    

    [cell viewAddSelectedImage:indexPath cancleImage:sImageArray[indexPath.row]];
    if (cell.Wselected) {
        cell.Wselected = NO;
    }else{
        cell.Wselected = YES;
        
    }
}

-(void)dismissAction {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"left" forKey:@"dismiss"];
    [[NSNotificationCenter defaultCenter] postNotificationName:DISMISS object:nil userInfo:dic];
}

-(void)dealloc {
    NSLog(@"进入了设置消失时候");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
