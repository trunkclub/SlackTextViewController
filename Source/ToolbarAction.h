//
//  ToolbarAction.h
//  Pods
//
//  Created by Matt Bush on 8/29/16.
//
//

#import <UIKit/UIKit.h>

@interface ToolbarAction : UIButton

typedef void(^ActionPressed)(void);

@property (copy) ActionPressed actionPressed;

- (void)setBackgroundImage:(NSString *)imageName;
- (void)setActionPressed:(ActionPressed)actionPressed;

@end
