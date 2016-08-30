//
//  ToolbarActionView.m
//  Pods
//
//  Created by Matt Bush on 8/29/16.
//
//

#import "ToolbarActionView.h"

@implementation ToolbarActionView

- (void) setup {
    self.layoutMargins = UIEdgeInsetsMake(2, 20, 2, 20);
    self.layoutMarginsRelativeArrangement = true;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor blueColor];
    [view1.heightAnchor constraintEqualToConstant:36].active = true;
    [view1.widthAnchor constraintEqualToConstant:36].active = true;
    
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [view2.heightAnchor constraintEqualToConstant:36].active = true;
    [view2.widthAnchor constraintEqualToConstant:36].active = true;
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor magentaColor];
    [view3.heightAnchor constraintEqualToConstant:36].active = true;
    [view3.widthAnchor constraintEqualToConstant:36].active = true;
    
    self.axis = UILayoutConstraintAxisHorizontal;
    self.alignment = UIStackViewAlignmentLeading;
    self.distribution = UIStackViewDistributionFillProportionally;
    self.spacing = 10;
    
    [self addArrangedSubview:view1];
    [self addArrangedSubview:view2];
    [self addArrangedSubview:view3];
}

- (void)setActions:(NSArray *)actions
{
    for (action in actions) {
        
    }
}

@end
