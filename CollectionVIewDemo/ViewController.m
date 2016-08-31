//
//  ViewController.m
//  CollectionVIewDemo
//
//  Created by boolean on 16/8/19.
//  Copyright © 2016年 boolean. All rights reserved.
//

#import "ViewController.h"
#import "AdsHeader.h"
#import "HomeFooter.h"
#import "PersonRecommendCell.h"

static NSString *const CellPersonRecommendID = @"CellPersonRecommend";
static NSString *const HeaderPersonRecommendID = @"HeaderPersonRecommendID";
static NSString *const FooterPersonRecommendID = @"FooterPersonRecommendID";

#define spaceOfItem 8.0//书籍之间间距
#define scaleItem 1.35

@interface ViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UINavigationControllerDelegate
>
@property(nonatomic,strong)UICollectionView *collectionViewHome;
@property(nonatomic,strong)NSMutableArray *personRecommendArrs;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"CollectionVIewDemo";
    //self.navigationController.navigationBar.barTintColor = RGBCOLOR(34, 34, 34);
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCollectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - UI
- (void)addCollectionView
{
    [self.view addSubview:self.collectionViewHome];
}
#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.personRecommendArrs.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PersonRecommendCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:CellPersonRecommendID
                                                                        forIndexPath:indexPath];
    [cell fillDataWithIndex:indexPath.row];
    return cell;
}
// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        switch (section)
        {
            case 0:
            {
                AdsHeader *adsHeader = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                          withReuseIdentifier:HeaderPersonRecommendID
                                                                                 forIndexPath:indexPath];
                
                return adsHeader;
            }
                break;

            default:
                break;
        }
        
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderPersonRecommendID forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        
        return headerView;
    }
    else if([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        
        switch (section)
        {
            case 0:
            {
                HomeFooter *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                            withReuseIdentifier:FooterPersonRecommendID
                                                                                   forIndexPath:indexPath];
                [footerView fillDataWithTitle:@"换一批" backgroundImage:[UIImage imageNamed:@"cell_indicator"]];
                footerView.footerBlock = ^(){
                    NSLog(@"section %ld footer click",(long)section);
                };
                return footerView;
            }
                break;
            default:
                break;
        }
        
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:FooterPersonRecommendID forIndexPath:indexPath];
        if(footerView == nil)
        {
            footerView = [[UICollectionReusableView alloc] init];
        }
        footerView.backgroundColor = [UIColor whiteColor];
        
        return footerView;
    }
    
    return nil;
}
#pragma mark - UICollectionViewDataSource
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    NSLog(@"index:%ld",(long)indexPath.row);
}

#pragma mark - UICollectionViewDelegateFlowLayout
//每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger numOfRow = 2;//一行几个
    if (indexPath.row %7 == 0)
    {
        numOfRow = 1;
    }
    CGFloat itemWidth = (SCREEN_WIDTH-spaceOfItem * (numOfRow + 1))/numOfRow;
    
    return CGSizeMake(itemWidth, itemWidth);//item的大小
}
//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    
    return spaceOfItem;
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return spaceOfItem;
}
//section Header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = 50;
    
    return CGSizeMake(width,height );//section Header的大小
}

//section Footer的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = 40;

    return CGSizeMake(width,height);//section Header的大小
}
//section的insets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(spaceOfItem, spaceOfItem, 0, spaceOfItem);
}
#pragma mark - Getter And Setter
- (UICollectionView *)collectionViewHome
{
    if (!_collectionViewHome)
    {
        UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
        //        flowLayout.minimumLineSpacing = 5;//行间距(最小值)
        //        flowLayout.minimumInteritemSpacing = 5;//item间距(最小值)
        //        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-5)/2, (SCREEN_WIDTH-5)/2);//item的大小
        _collectionViewHome = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionViewHome.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionViewHome.backgroundColor = [UIColor blackColor];
        _collectionViewHome.dataSource = self;
        _collectionViewHome.delegate = self;
        
        //注册cell
        [_collectionViewHome registerClass:[PersonRecommendCell class]
                forCellWithReuseIdentifier:CellPersonRecommendID];
        //注册header
        [_collectionViewHome registerClass:[AdsHeader class]
                forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                       withReuseIdentifier:HeaderPersonRecommendID];
        //注册footer
        [_collectionViewHome registerClass:[HomeFooter class]
                forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                       withReuseIdentifier:FooterPersonRecommendID];


    }
    return _collectionViewHome;
}

- (NSMutableArray *)personRecommendArrs
{
    if (!_personRecommendArrs)
    {
        _personRecommendArrs = [[NSMutableArray alloc] init];
        [_personRecommendArrs addObjectsFromArray:@[@"童书管",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"文学馆",@"艺术馆",@"科幻馆",@"人文馆",@"查看全部",@"查看全部"]];
    }
    return _personRecommendArrs;
}




@end
