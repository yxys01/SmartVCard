//
//  SCContactViewController.m
//  SmartVCard
//
//  Created by 夏天 on 16/7/12.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "SCContactViewController.h"

@interface SCContactViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@end

@implementation SCContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *path  = [[NSBundle mainBundle]pathForResource:@"message" ofType:@"plist"];
    NSDictionary *dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    list = dic;
    //创建数组对象
    NSArray *array = [[list allKeys]sortedArrayUsingSelector:@selector(compare:)];
    ff = array;
    tv.tableHeaderView = searchBar;
    searchBar.autocorrectionType = UITextAutocorrectionTypeYes;
    listOfMovies = [[NSMutableArray alloc]init];
    //创建数组对象
    //遍历
    for (NSString *year in array)
    {
        NSArray *movies = [list objectForKey:year];
        //遍历
        for(NSString *title in movies)
        {
            [listOfMovies addObject:title];
        }
    }
    searchResult = [[NSMutableArray alloc]init];
    isSearchOn = NO;
    canSelectRow = YES;
    
}
#pragma mark - UITableView delegate
//获取表视图中的块数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //判断isSearchOn
    if(isSearchOn)
        return 1;
    else
        return  [ff count];
}

//获取表视图中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //判断isSearchOn
    if(isSearchOn){
        return [searchResult count];
    }else{
        NSString *year = [ff objectAtIndex:section];
        NSArray *moviesSection = [list objectForKey:year];
        return [moviesSection count];
    }
}
#pragma mark - UITableView dataSource
//获取表视图中单元格的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if(isSearchOn){
        NSString *cellValue = [searchResult objectAtIndex:indexPath.row];
        cell.textLabel.text = cellValue;
    }else{
        NSString *year = [ff objectAtIndex:[indexPath section]];
        NSArray *moviesSection = [list objectForKey:year];
        cell.textLabel.text = [moviesSection objectAtIndex:[indexPath row]];
    }
    return cell;
}

//获取块标题栏的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *year = [ff objectAtIndex:section];
    if(isSearchOn)
        return nil;
    else
        return year;
}
#pragma mark searchBar delegate
//当用户在搜索栏中进行输入时调用，实现搜索
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(nonnull NSString *)searchText
{
    if([searchText length] > 0){
        //当文本长度大于0时，实现搜索
        isSearchOn = YES;
        canSelectRow = YES;
        tv.scrollEnabled = YES;//可以滚动
        [self searchMoviesTableView];
    }
    else{
        isSearchOn = NO;
        canSelectRow = NO;
        tv.scrollEnabled = NO;//不可以滚动
    }
    [tv reloadData];//重新加载数据
}

//实现对结果的搜索
-(void)searchMoviesTableView{
    [searchResult removeAllObjects];//移除对象
    //遍历
    for(NSString *str in listOfMovies)
    {
        NSRange titleResultsRange = [str rangeOfString:searchBar.text options:NSCaseInsensitiveSearch];
        if(titleResultsRange.length > 0 )
            [searchResult addObject:str];//添加对象
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
