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

- (void)setup;
- (void)setActions:(NSArray *)actions;

@end
