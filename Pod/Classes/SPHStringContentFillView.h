//
//  SPHStringContentFillView.h
//  SPHStringContentFillView
//
//  Created by Spencer Phippen on 2015/09/21.
//  Copyright (c) 2015年 Spencer Phippen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPHStringContentFillView : UIView

@property (nonatomic,copy) NSString* contentString;
@property (nonatomic) int minimumFill;
@property (nonatomic) int maximumFill;

- (void) regenerate;
- (void) regenerateFromPoint:(CGPoint)point;

@end
