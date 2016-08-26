//
//  MessagingTextInputbar.m
//  TrunkClub
//
//  Created by Matt Bush on 7/19/16.
//  Copyright © 2016 Trunk Club. All rights reserved.
//

#import "MessagingTextInputbar.h"
#import "SLKTextView+SLKAdditions.h"
#import "UIView+SLKAdditions.h"

CGFloat const kCustomToolbarHeight = 40.0;

@interface SLKTextInputbar (Private)

- (void) slk_setupViewConstraints;
- (void) slk_commonInit;
@property (nonatomic, retain) UIView *customToolbarView;
@property (nonatomic, strong) NSLayoutConstraint *leftButtonWC;
@property (nonatomic, strong) NSLayoutConstraint *leftButtonHC;
@property (nonatomic, strong) NSLayoutConstraint *leftMarginWC;
@property (nonatomic, strong) NSLayoutConstraint *bottomMarginWC;
@property (nonatomic, strong) NSLayoutConstraint *rightButtonWC;
@property (nonatomic, strong) NSLayoutConstraint *rightMarginWC;
@property (nonatomic, strong) NSLayoutConstraint *rightButtonTopMarginC;
@property (nonatomic, strong) NSLayoutConstraint *rightButtonBottomMarginC;
@property (nonatomic, strong) NSLayoutConstraint *editorContentViewHC;

@end

@implementation MessagingTextInputbar

@synthesize customToolbarView = _customToolbarView;

- (CGFloat)appropriateHeight {
    CGFloat height = super.appropriateHeight;
    return height + kCustomToolbarHeight;
}

- (void)slk_commonInit
{
    self.customToolbarView = [[TCCollectionViewSubclass alloc] init];
    [super slk_commonInit];
    [self insertSubview:self.customToolbarView aboveSubview:self.textView];
    
    [self.customToolbarView setActions:actionArray];
}

- (void)slk_setupViewConstraints
{
    self.textView.clipsToBounds = NO;
    
    // Pull in existing constraints as we're not calling super
    NSDictionary *views = @{@"textView": self.textView,
                            @"leftButton": self.leftButton,
                            @"rightButton": self.rightButton,
                            @"contentView": self.editorContentView,
                            @"charCountLabel": self.charCountLabel,
                            @"customToolbarView" : self.customToolbarView
                            };
    
    NSDictionary *metrics = @{@"top" : @(self.contentInset.top),
                              @"bottom" : @(self.contentInset.bottom),
                              @"left" : @(self.contentInset.left),
                              @"right" : @(self.contentInset.right),
                              @"right" : @(self.contentInset.right),
                              @"toolbarHeight" : @(kCustomToolbarHeight),
                              };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[leftButton(0)]-(<=1)-[textView]-(<=right)-[rightButton(0)]-(right)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[leftButton(0)]-(0@750)-|" options:0 metrics:metrics views:views]];
    
    // This sets alignment of right button to the top
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=0)-[rightButton]-(>=0)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left@250)-[charCountLabel(<=50@1000)]-(right@750)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[contentView(0)]-(<=top)-[textView(0@999)]-(bottom)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:metrics views:views]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[customToolbarView(toolbarHeight@500)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[customToolbarView]|" options:0 metrics:metrics views:views]];
    
    self.editorContentViewHC = [self slk_constraintForAttribute:NSLayoutAttributeHeight firstItem:self.editorContentView secondItem:nil];
    
    // This hides the left button completely
    self.leftButtonWC = nil;
    self.leftButtonHC = nil;
    
    self.leftMarginWC = [self slk_constraintsForAttribute:NSLayoutAttributeLeading][0];
    self.bottomMarginWC = [self slk_constraintForAttribute:NSLayoutAttributeBottom firstItem:self secondItem:self.leftButton];
    
    self.rightButtonWC = [self slk_constraintForAttribute:NSLayoutAttributeWidth firstItem:self.rightButton secondItem:nil];
    self.rightMarginWC = [self slk_constraintsForAttribute:NSLayoutAttributeTrailing][0];
    
    self.rightButtonTopMarginC = [self slk_constraintForAttribute:NSLayoutAttributeTop firstItem:self.rightButton secondItem:self];
    self.rightButtonBottomMarginC = [self slk_constraintForAttribute:NSLayoutAttributeBottom firstItem:self secondItem:self.rightButton];
}

#pragma mark - Custom Toolbar

- (void)setCustomToolbarView:(UIView *)customToolbarView
{
    [_customToolbarView removeFromSuperview];
    _customToolbarView = customToolbarView;
    [self configureToolbar];
}

- (void)configureToolbar {
    [self addSubview:self.customToolbarView];
    self.customToolbarView.translatesAutoresizingMaskIntoConstraints = NO;
    self.customToolbarView.backgroundColor = [UIColor redColor];
}


@end
