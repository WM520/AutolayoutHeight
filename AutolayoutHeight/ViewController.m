//
//  ViewController.m
//  AutolayoutHeight
//
//  Created by forever on 2016/10/11.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "ListModel.h"
static NSString *const CellID = @"cell";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    (void)self.dataArray;
    (void)self.tableView;
}


#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:CellID];
//        tableView.rowHeight = UITableViewAutomaticDimension;
//        tableView.estimatedRowHeight = 100;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray array];
        
        NSString *string = @"Siri 让你能够利用语音来完成发送信息、安排会议、查看最新比分等更多事务。只要说出你想做的事，Siri 就能帮你办到。Siri 可以听懂你说的话、知晓你的心意，甚至还能有所回应。iOS 7 中的 Siri 拥有新外观、新声音和新功能。它的界面经过重新设计，以淡入视图浮现于任意屏幕画面的最上层。Siri 回答问题的速度更快，还能查询更多信息源，如维基百科。它可以承担更多任务，如回电话、播放语音邮件、调节屏幕亮度，以及更多。";
        
        //生成假数据
        for (int i = 0; i < 100; i++)
        {
            ListModel *model = [[ListModel alloc] init];
            NSInteger index = (arc4random()%(string.length / 20)) * 20;
            model.desc = [string substringToIndex:MAX(20, index)];
            //            model.desc = string;
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
