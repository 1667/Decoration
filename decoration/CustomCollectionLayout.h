//
//  CustomCollectionLayout.h
//  decoration
//
//  Created by innke on 15/12/9.
//  Copyright © 2015年 find. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WaterFLayoutDelegate <UICollectionViewDelegate>
@required

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
@optional

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;
@end

@interface CustomCollectionLayout : UICollectionViewLayout
{
    float x;
    
    float leftY;
    
    float rightY;
}
@property float itemWidth;

@property (nonatomic,assign) CGPoint center;

@property (nonatomic,assign) CGFloat radius;

@property (nonatomic,assign) NSInteger cellCount;


/// The delegate will point to collection view's delegate automatically.
@property (nonatomic,weak) id <WaterFLayoutDelegate> delegate;

/// Array to store attributes for all items includes headers, cells, and footers
@property (nonatomic,strong) NSMutableArray *allItemAttributes;



@property (nonatomic,assign) UIEdgeInsets sectionInset;

@end
