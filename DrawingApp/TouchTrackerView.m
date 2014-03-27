//
//  TouchTrackerView.m
//  DrawingApp
//
//  Created by mcm2737 on 10/9/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "TouchTrackerView.h"
#import "UIBezierPath-Smoothing.h"

@implementation TouchTrackerView

- (void) clear
{
    path = nil;
    [self setNeedsDisplay];
}

- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
	path = [UIBezierPath bezierPath];
	//path.lineWidth = IS_IPAD? 8.0f : 4.0f;
	
	UITouch *touch = [touches anyObject];
	[path moveToPoint:[touch locationInView:self]];
}

- (void) touchesMoved:(NSSet *) touches withEvent:(UIEvent *) event
{
	UITouch *touch = [touches anyObject];
	[path addLineToPoint:[touch locationInView:self]];
	[self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	[path addLineToPoint:[touch locationInView:self]];
    path = [path smoothedPath:4];
	[self setNeedsDisplay];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self touchesEnded:touches withEvent:event];
}

- (void) drawRect:(CGRect)rect
{
	//[COOKBOOK_PURPLE_COLOR set];
	[path stroke];
}

- (id) initWithFrame:(CGRect)frame
{
	if (self = [super initWithFrame:frame])
		self.multipleTouchEnabled = NO;
	
	return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
