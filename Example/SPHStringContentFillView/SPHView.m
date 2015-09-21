//
//  SPHView.m
//  SPHStringContentFillView
//
//  Created by Spencer Phippen on 2015/09/21.
//  Copyright (c) 2015年 Spencer Phippen. All rights reserved.
//

#import "SPHView.h"

@implementation SPHView

#pragma mark Constructors
- (instancetype) init {
    self = [super init];
    if (!self)
        return nil;
    
    _minSlider = [UISlider new];
    [_minSlider setMinimumValue:1.0];
    [_minSlider setMaximumValue:1000.0];

    _maxSlider = [UISlider new];
    [_maxSlider setMinimumValue:1.0];
    [_maxSlider setMaximumValue:1000.0];
    
    _overlapSlider = [UISlider new];
    [_overlapSlider setMinimumValue:0];
    [_overlapSlider setMaximumValue:4];
    
    _minLabel = [UILabel new];
    _maxLabel = [UILabel new];
    _overlapLabel = [UILabel new];

    _stringView = [SPHStringContentFillView new];
    [_stringView setBackgroundColor:[UIColor yellowColor]];
    
    [self addSubview:_minSlider];
    [self addSubview:_maxSlider];
    [self addSubview:_overlapSlider];
    [self addSubview:_minLabel];
    [self addSubview:_maxLabel];
    [self addSubview:_overlapLabel];

    [self addSubview:_stringView];
    
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark UIView Methods
- (void) layoutSubviews {
    const CGRect entireArea = [self bounds];
    
    CGRect minSliderFrame = CGRectZero;
    CGRect minLabelFrame = CGRectZero;
    CGRect maxSliderFrame = CGRectZero;
    CGRect maxLabelFrame = CGRectZero;
    CGRect overlapSliderFrame = CGRectZero;
    CGRect overlapLabelFrame = CGRectZero;
    CGRect stringFrame = CGRectZero;
    
    CGRect workingArea = entireArea;
    CGRect minArea = CGRectZero;
    CGRectDivide(workingArea, &minArea, &workingArea, 40.0, CGRectMinYEdge);
    CGRectDivide(minArea, &minLabelFrame, &minSliderFrame, 60.0, CGRectMaxXEdge);
    
    CGRect maxArea = CGRectZero;
    CGRectDivide(workingArea, &maxArea, &workingArea, 40.0, CGRectMinYEdge);
    CGRectDivide(maxArea, &maxLabelFrame, &maxSliderFrame, 60.0, CGRectMaxXEdge);
    
    CGRect overlapArea = CGRectZero;
    CGRectDivide(workingArea, &overlapArea, &workingArea, 40.0, CGRectMinYEdge);
    CGRectDivide(overlapArea, &overlapLabelFrame, &overlapSliderFrame, 60.0, CGRectMaxXEdge);
    
    stringFrame = workingArea;
    
    [_minSlider setFrame:minSliderFrame];
    [_minLabel setFrame:minLabelFrame];
    [_maxSlider setFrame:maxSliderFrame];
    [_maxLabel setFrame:maxLabelFrame];
    [_overlapSlider setFrame:overlapSliderFrame];
    [_overlapLabel setFrame:overlapLabelFrame];
    
    [_stringView setFrame:stringFrame];
}

@end
