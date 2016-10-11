//
//  ToolbarAction.m
//  Pods
//
//  Created by Matt Bush on 8/29/16.
//
//

#import "ToolbarAction.h"

@implementation ToolbarAction

- (void)setBackgroundImage:(NSString *)imageName
{
    [self.imageView setContentMode: UIViewContentModeScaleAspectFill];
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateDisabled];
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
}

- (void)setActionPressed:(ActionPressed)actionPressed
{
    _actionPressed = actionPressed;
    [self addTarget:self action:@selector(handleButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleButtonPressed
{
    if (self.actionPressed) {
        self.actionPressed();
    }
}

@end
