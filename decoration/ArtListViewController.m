//
//  ArtListViewController.m
//  decoration
//
//  Created by innke on 15/12/9.
//  Copyright © 2015年 find. All rights reserved.
//

#import "ArtListViewController.h"
#import "ArtListCollectionViewCell.h"
#import "UIImage+LocalSize.h"
#import "CustomCollectionLayout.h"


#define kCellWidth          ((SCREEN_WIDTH-15)/2)

@interface ArtListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation ArtListViewController
{
    UICollectionView            *_collectionView;
    CustomCollectionLayout  *_layout;
    NSMutableArray              *_array;
    NSMutableArray              *_arrayH;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleText:@"名家作品"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initView
{
    _array = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"house5"],[UIImage imageNamed:@"house1"],[UIImage imageNamed:@"house7"],[UIImage imageNamed:@"house3"],[UIImage imageNamed:@"house7"],[UIImage imageNamed:@"house4"],[UIImage imageNamed:@"house3"],[UIImage imageNamed:@"house5"],[UIImage imageNamed:@"house5"],[UIImage imageNamed:@"house6"],[UIImage imageNamed:@"house7"],[UIImage imageNamed:@"house1"],[UIImage imageNamed:@"house2"], nil];
    
    _layout = [[CustomCollectionLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, NAV_STATUS_HEIGHT(self), self.selfViewWidth, self.selfViewHieght-NAV_STATUS_HEIGHT(self)) collectionViewLayout:_layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[ArtListCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];
    
    _arrayH = [NSMutableArray new];
}

-(CGFloat)getImageH:(UIImage *)image
{
    return [image localImageSizeWithWidth:kCellWidth].height;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_array count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ArtListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImage *image = [_array objectAtIndex:indexPath.row];
    [cell.imageView.bigImageView setImage:image];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [Utils WriteLog:indexPath WithString:@"tttt"];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [_array objectAtIndex:indexPath.row];
    CGFloat h = [self getImageH:image];
    [_arrayH addObject:[NSString stringWithFormat:@"%f",h]];
    return CGSizeMake(kCellWidth, h);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
