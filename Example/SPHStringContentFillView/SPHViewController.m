//
//  SPHViewController.m
//  SPHStringContentFillView
//
//  Created by Spencer Phippen on 09/21/2015.
//  Copyright (c) 2015 Spencer Phippen. All rights reserved.
//

#import "SPHViewController.h"

#import "SPHView.h"

@implementation SPHViewController

- (void) loadView {
    [self setView:[SPHView new]];
}

- (SPHView*) sphView {
    return (SPHView*)[self view];
}

- (void) viewDidLoad {
    SPHView* view = [self sphView];
    [[view minSlider] addTarget:self action:@selector(minChanged:) forControlEvents:UIControlEventTouchUpInside];
    [[view minSlider] addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpOutside];
    [[view maxSlider] addTarget:self action:@selector(maxChanged:) forControlEvents:UIControlEventTouchUpInside];
    [[view maxSlider] addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpOutside];
    [[view overlapSlider] addTarget:self action:@selector(overlapChanged:) forControlEvents:UIControlEventTouchUpInside];
    [[view overlapSlider] addTarget:self action:@selector(update:) forControlEvents:UIControlEventTouchUpOutside];
    
    [self updateUI];
    
    UITapGestureRecognizer* tap;
    tap = [UITapGestureRecognizer new];
    [tap addTarget:self action:@selector(tapUpdate:)];
    [[view stringView] addGestureRecognizer:tap];
}

- (void) tapUpdate:(UITapGestureRecognizer*)tap {
    if ([tap state] == UIGestureRecognizerStateEnded) {
        SPHStringContentFillView* s = [[self sphView] stringView];
        CGPoint location = [tap locationInView:s];
        [s regenerateFromPoint:location];
    }
}

- (void) minChanged:(UISlider*)min {
    [[[self sphView] stringView] setMinimumFill:(int)[min value]];
    [self updateUI];
}

- (void) maxChanged:(UISlider*)max {
    [[[self sphView] stringView] setMaximumFill:(int)[max value]];
    [self updateUI];
}

- (void) overlapChanged:(UISlider*)overlap {
    double value = pow(2.0, [overlap value]) * 0.25;
    [[[self sphView] stringView] setOverlapFactor:value];
    [self updateUI];
}

- (void) update:(UISlider*)_ {
    [self updateUI];
}

- (void) updateUI {
    SPHView* view = [self sphView];
    int min = [[view stringView] minimumFill];
    int max = [[view stringView] maximumFill];
    double overlap = [[view stringView] overlapFactor];
    double sliderOverlap = log(4.0*overlap) / log(2.0);

    [[view minSlider] setValue:min];
    [[view maxSlider] setValue:max];
    [[view overlapSlider] setValue:sliderOverlap];
    [[view minLabel] setText:[NSString stringWithFormat:@"%d", min]];
    [[view maxLabel] setText:[NSString stringWithFormat:@"%d", max]];
    [[view overlapLabel] setText:[NSString stringWithFormat:@"%0.2g", overlap]];
}

@end
