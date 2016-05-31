//
//  DesignAndComDetailViewController.m
//  decoration
//
//  Created by innke on 15/11/29.
//  Copyright © 2015年 find. All rights reserved.
//

#import "DesignAndComDetailViewController.h"
#import "Utils.h"
#import "DesignDetailHeaderTableViewCell.h"
#import "CommentTableViewCell.h"
#import "BottomInputView.h"

#define kBottomH        50

@interface DesignAndComDetailViewController ()<UITableViewDelegate,UITableViewDataSource,InputViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) DesignDetailHeaderTableViewCell *cacheCell;
@property (nonatomic,strong) CommentTableViewCell *cacheCommentCell;
@property (nonatomic,strong) BottomInputView    *bottomInput;



@end

@implementation DesignAndComDetailViewController
{
    NSMutableArray *array;
    BOOL            bRefrash;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitleText:@"设计交流"];
    
    array = [NSMutableArray new];
    for (int i = 0; i < 10 ; i++) {
        [array addObject:@"为啥色条这么灰，不过看上去挺有品质的,tjiijijii"];
        
    }
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark initPro

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

-(BottomInputView *)bottomInput
{
    if (!_bottomInput) {
        _bottomInput = [[BottomInputView alloc] init];
        _bottomInput.inputdelegate = self;
        [self.view addSubview:_bottomInput];
    }
    return _bottomInput;
}

-(DesignDetailHeaderTableViewCell *)cacheCell
{
    if (_cacheCell == nil) {
        _cacheCell = [DesignDetailHeaderTableViewCell new];
        
    }
    return _cacheCell;
}

-(CommentTableViewCell *)cacheCommentCell
{
    if (_cacheCommentCell == nil) {
        _cacheCommentCell = [CommentTableViewCell new];
    }
    return _cacheCommentCell;
}

#pragma mark Fun

-(void)initView
{
    
    [self.tableView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.top).offset(NAV_STATUS_HEIGHT(self));
        //make.bottom.equalTo(self.bottomInput.top);
    }];
    self.bottomInput.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, kBottomH);
    
}

#pragma mark delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            CGSize size =  [self.cacheCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            return size.height+1;
        }
            break;
        default:
        {
            
            self.cacheCommentCell.contentLable.text = [array objectAtIndex:indexPath.row];
            
            [self.cacheCommentCell setNeedsLayout];
            [self.cacheCommentCell layoutIfNeeded];
            
            CGSize size =  [self.cacheCommentCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            return size.height+1;
        }
            break;
    }
    
    return 0;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    switch (indexPath.row) {
        case 0:
        {
            DesignDetailHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
            if (cell == nil) {
                cell = [[DesignDetailHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
            }
            return cell;
        }
            break;
            
        default:
        {
            CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            if (cell == nil) {
                cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            }
            
            cell.contentLable.text = [array objectAtIndex:indexPath.row];
            
            return cell;
        }
            break;
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.bottomInput.textView becomeFirstResponder];
    
}

-(void)keyboardEditDidShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    // 根据老的 frame 设定新的 frame
    CGRect newTextViewFrame = self.bottomInput.frame; // by michael
    newTextViewFrame.origin.y = keyboardRect.origin.y - self.bottomInput.frame.size.height;
    
    // 键盘的动画时间，设定与其完全保持一致
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    // 键盘的动画是变速的，设定与其完全保持一致
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSUInteger animationCurve;
    [animationCurveObject getValue:&animationCurve];
    
    // 开始及执行动画
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    self.bottomInput.frame = newTextViewFrame;
    [UIView commitAnimations];
}

-(void)keyboardEditDidHide:(NSNotification *)notification
{
    NSDictionary* userInfo = [notification userInfo];
    
    // 键盘的动画时间，设定与其完全保持一致
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    // 键盘的动画是变速的，设定与其完全保持一致
    NSValue *animationCurveObject =[userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSUInteger animationCurve;
    [animationCurveObject getValue:&animationCurve];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    CGRect newTextViewFrame = self.bottomInput.frame;
    newTextViewFrame.origin.y = SCREEN_HEIGHT;
    self.bottomInput.frame = newTextViewFrame;
    [UIView commitAnimations];
    
    if (bRefrash) {
        bRefrash = NO;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSIndexPath *path = [NSIndexPath indexPathForItem:[array count]-1 inSection:0];
            [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        });
    }
    
    
    
}



-(void)sendBtnClickedWithText:(NSString *)str
{
    [array addObject:str];
    [self.tableView reloadData];
    bRefrash = YES;
    
}

@end
