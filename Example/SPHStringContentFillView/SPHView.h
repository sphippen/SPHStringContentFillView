//
//  SPHView.h
//  SPHStringContentFillView
//
//  Created by Spencer Phippen on 2015/09/21.
//  Copyright (c) 2015年 Spencer Phippen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SPHStringContentFillView/SPHStringContentFillView.h>

@interface SPHView : UIView

@property (readonly) UILabel* minLabel;
@property (readonly) UISlider* minSlider;

@property (readonly) UILabel* maxLabel;
@property (readonly) UISlider* maxSlider;

@property (readonly) SPHStringContentFillView* stringView;

@end
