//
//  ToolbarActionView.m
//  Pods
//
//  Created by Matt Bush on 8/29/16.
//
//

#import "ToolbarActionView.h"

@implementation ToolbarActionView

@synthesize spacerView = _spacerView;

- (UIView*) spacerView
{
    if (!_spacerView) {
        _spacerView = [[UIView alloc] init];
        
        [_spacerView.heightAnchor constraintEqualToConstant: 36].active = true;
        [_spacerView.widthAnchor constraintEqualToConstant:[UIScreen mainScreen].bounds.size.width].active = true;
        [_spacerView setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        _spacerView.backgroundColor = [UIColor clearColor];
    }
    return _spacerView;
}

- (void) setup
{
    self.layoutMargins = UIEdgeInsetsMake(0, 16, 0, 0);
    self.layoutMarginsRelativeArrangement = true;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.axis = UILayoutConstraintAxisHorizontal;
    self.alignment = UIStackViewAlignmentLeading;
    self.distribution = UIStackViewDistributionFill;
    self.spacing = 5;
}

- (void)setActions:(NSArray *)actions
{
    for (UIView *arrangedSubview in self.arrangedSubviews) {
        [arrangedSubview removeFromSuperview];
    }
    
    for (ToolbarAction *action in actions) {
        action.backgroundColor = [UIColor clearColor];
        [action.heightAnchor constraintEqualToConstant:36].active = true;
        [action.widthAnchor constraintEqualToConstant:36].active = true;
        [action setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];

        [self addArrangedSubview:action];
    }
    
    [self addArrangedSubview: self.spacerView];
}

@end
