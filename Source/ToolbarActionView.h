//
//  ToolbarActionView.h
//  Pods
//
//  Created by Matt Bush on 8/29/16.
//
//

#import <UIKit/UIKit.h>
#import "ToolbarAction.h"

@interface ToolbarActionView : UIStackView

@property (nonatomic, readonly) UIView *spacerView;

- (void)setup;
- (void)setActions:(NSArray *)actions;

@end
