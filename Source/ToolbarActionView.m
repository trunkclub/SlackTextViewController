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
@synthesize actionsView = _actionsView;

- (UIView*)spacerView
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

- (UIView*)actionsView
{
    if (!_actionsView) {
        _actionsView = [[UIStackView alloc] init];
    }
    return _actionsView;
}

- (void)setup
{
    self.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.actionsView.layoutMargins = UIEdgeInsetsMake(0, 10, 0, 0);
    self.actionsView.layoutMarginsRelativeArrangement = true;
    self.actionsView.translatesAutoresizingMaskIntoConstraints = NO;
    self.actionsView.axis = UILayoutConstraintAxisHorizontal;
    self.actionsView.alignment = UIStackViewAlignmentLeading;
    self.actionsView.distribution = UIStackViewDistributionFill;
    self.actionsView.spacing = 4;
    [self addSubview:self.actionsView];
}

- (void)setActions:(NSArray *)actions
{
    for (UIView *arrangedSubview in self.actionsView.arrangedSubviews) {
        [arrangedSubview removeFromSuperview];
    }
    
    for (ToolbarAction *action in actions) {
        action.backgroundColor = [UIColor clearColor];
        [action.heightAnchor constraintEqualToConstant:36].active = true;
        [action.widthAnchor constraintEqualToConstant:36].active = true;
        [action setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];

        [self.actionsView addArrangedSubview:action];
    }
    
    // Add spacer view with low content hugging priority to allow appropriate sizing of actions
    [self.actionsView addArrangedSubview: self.spacerView];
}

@end
