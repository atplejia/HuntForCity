//
//  SelectView.m
//  HuntForCity
//
//  Created by 金亮齐 on 16/9/21.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

#import "SelectView.h"
#import "PrefixHeader.h"
#import "MenuButton.h"//这个按钮取消了高亮状态
#import "SelecButton.h"

@interface SelectView ()

/** 推荐按钮 */
@property (nonatomic, strong) SelecButton *groomBtn;
/** 信息按钮 */
@property (nonatomic, strong) SelecButton *infoBtn;
/** 评论按钮 */
@property (nonatomic, strong) SelecButton *commentBtn;
/** 底部滑动的动画条 */
@property (nonatomic, strong) UIView *slideLineView;

//记录当前被选中的按钮
@property (nonatomic, weak) SelecButton *nowSelectedBtn;

@end

@implementation SelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self setUp];
}


- (void)setUp
{
    //背景色和阴影
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowOpacity = 0.1;
    self.layer.shadowOffset = CGSizeMake(0, 3);
    
    //正常是需要注意图片和文字的距离，我一般在button的layoutSubViews重新布局
    //这个没有找到对应图片，我直接截取的 把文字一块截下来了，偷个懒
    self.groomBtn = [SelecButton buttonWithType:UIButtonTypeCustom];
    [self addBtnToView:self.groomBtn image:[UIImage imageNamed:@"groom"] tag:0];
    
    self.infoBtn = [SelecButton buttonWithType:UIButtonTypeCustom];
    [self addBtnToView:self.infoBtn image:[UIImage imageNamed:@"info"] tag:1];
    
    self.commentBtn = [SelecButton buttonWithType:UIButtonTypeCustom];
    [self addBtnToView:self.commentBtn image:[UIImage imageNamed:@"comment"] tag:2];
    
    self.slideLineView = [[UIView alloc] init];
    self.slideLineView.backgroundColor = GolbalGreen;
    self.slideLineView.layer.masksToBounds = YES;
    self.slideLineView.layer.cornerRadius = 3;
    [self addSubview:self.slideLineView];
    
    [self.groomBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self.infoBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self.commentBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
}

- (void)addBtnToView:(SelecButton *)btn image:(UIImage *)image tag:(NSInteger)tag
{
    [btn setBackgroundColor:[UIColor whiteColor]];
    [btn setImage:image forState:UIControlStateNormal];
    btn.tag = tag;
    [self addSubview:btn];
}

//便利构造方法
+ (instancetype)selectViewWithisShowComment:(BOOL)isShowComment
{
    SelectView *selectView = [[self alloc] init];
    selectView.isShowComment = isShowComment;
    
    return selectView;
}

//设置控件的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //这里需要判断下是否显示commentBtn,抓不到数据，暂时先不显示，如果需要显示就给也设置frame
    CGFloat viewH = self.bounds.size.height;
    CGFloat viewW = self.bounds.size.width;
    CGFloat btnW = viewW * 0.3;
    CGFloat btnH = viewH;
    //计算间距
    CGFloat margin = (viewW - btnW * (self.subviews.count - 1)) / self.subviews.count;
    
    self.groomBtn.frame = CGRectMake(margin, 0, btnW, btnH);
    self.infoBtn.frame = CGRectMake(2 * margin + btnW , 0, btnW, btnH);
    self.commentBtn.frame = CGRectMake(3 * margin + 2 * btnW,0, btnW, btnH);
    self.slideLineView.frame = CGRectMake(margin, viewH - 4, btnW, 4);
}

#pragma mark - 按钮的Action
- (void)btnClick:(SelecButton *)sender
{
    if (self.nowSelectedBtn == sender) return;
    
    //通知代理点击
    if ([self.delegate respondsToSelector:@selector(selectView:didSelectedButtonFrom:to:)]) {
        [self.delegate selectView:self didSelectedButtonFrom:self.nowSelectedBtn.tag to:sender.tag];
    }
    
    //给滑动小条做动画
    CGRect rect = self.slideLineView.frame;
    rect.origin.x = sender.frame.origin.x;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.slideLineView.frame = rect;
    }];
    
    self.nowSelectedBtn = sender;
}

//有代理时，点击按钮
- (void)setDelegate:(id<SelectViewDelegate>)delegate
{
    _delegate = delegate;
    
    [self btnClick:self.groomBtn];
}

- (void)lineToIndex:(NSInteger)index
{
    
    switch (index) {
        case 0:
            if ([self.delegate respondsToSelector:@selector(selectView:didChangeSelectedView:)]) {
                [self.delegate selectView:self didChangeSelectedView:0];
            }
            self.nowSelectedBtn = self.groomBtn;
            break;
        case 1:
            if ([self.delegate respondsToSelector:@selector(selectView:didChangeSelectedView:)]) {
                [self.delegate selectView:self didChangeSelectedView:1];
            }
            self.nowSelectedBtn = self.infoBtn;
            break;
        default:
            break;
    }
    
    CGRect rect = self.slideLineView.frame;
    rect.origin.x = self.nowSelectedBtn.frame.origin.x;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.slideLineView.frame = rect;
    }];
    
}


@end
