//
//  ViewController.m
//  06 高级汽车
//
//  Created by 栈然亦卡安 on 16/7/18.
//  Copyright © 2016年 栈然亦卡安. All rights reserved.
//

#import "ViewController.h"
#import "Hcars.h"
#import "HcarGroups.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSArray *carsArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carsArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HcarGroups *group = self.carsArr[section];
    return group.cars.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cars";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    HcarGroups *group = self.carsArr[indexPath.section];
    Hcars *car = group.cars[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    HcarGroups *group = self.carsArr[section];
    return group.title;
}
- (NSArray <NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return [self.carsArr valueForKeyPath:@"title"];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:self.carsArr.count];
    for (HcarGroups *group in self.carsArr) {
        [arrM addObject:group.title];
    }
    return arrM;
}
- (BOOL)prefersStatusBarHidden {
    return  YES;
}
- (NSArray *)carsArr {
    if (_carsArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        for (NSDictionary *dict in dictArr) {
            HcarGroups *group = [HcarGroups groupWithDict:dict];
            
            NSArray *carDict = group.cars;
            NSMutableArray *carDictM = [NSMutableArray arrayWithCapacity:carDict.count];
            for (NSDictionary *diCar in carDict) {
                Hcars *cars = [Hcars carsWithDict:diCar];
                [carDictM addObject:cars];
            }
            group.cars = carDictM;
            [arrM addObject:group];
        }
        _carsArr = arrM;
    }
    return _carsArr;
}
@end
