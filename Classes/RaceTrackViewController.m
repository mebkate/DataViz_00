

#import "RaceTrackViewController.h"
#import <QuartzCore/QuartzCore.h>

#define degreesToRadians(x) (M_PI * x / 180.0)
#define P(x,y) CGPointMake(x, y)

@implementation RaceTrackViewController

- (void)loadView {
	[super loadView];
    
    /*
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed: @"background.png"]];
    self.view.backgroundColor = background;
    [background release];
	*/
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
	self.view.backgroundColor = [UIColor whiteColor];

	UIBezierPath *trackPath = [UIBezierPath bezierPath];
	[trackPath moveToPoint:P(screenWidth/2+((((screenWidth/2)/2)/2)*3), screenHeight-10)]; // a
    
    
    [trackPath addCurveToPoint:P((screenWidth/2), 30)// d
				 controlPoint1:P(screenWidth/2+100, screenHeight/2-100)// b
				 controlPoint2:P(0, 30)]; // c
	
    [trackPath addCurveToPoint:P((((screenWidth/2)/2)/2), screenHeight-10)// d
				 controlPoint1:P(screenWidth, 30)// b
				 controlPoint2:P(screenWidth/2-100, screenHeight/2-100)]; // c
   

	CAShapeLayer *centerline = [CAShapeLayer layer];
	centerline.path = trackPath.CGPath;
	centerline.strokeColor = [UIColor blackColor].CGColor;
	centerline.fillColor = [UIColor clearColor].CGColor;
	centerline.lineWidth = 1.0;
	centerline.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:2], nil];
	[self.view.layer addSublayer:centerline];
	
	CALayer *airplane = [CALayer layer];
	airplane.bounds = CGRectMake(0, 0, 88.0, 88.0);
	airplane.position = P(160, 25);
	airplane.contents = (id)([UIImage imageNamed:@"airplane.png"].CGImage);
	[self.view.layer addSublayer:airplane];
    
    CALayer *moon = [CALayer layer];
	moon.bounds = CGRectMake(0, 0, 65.0, 65.0);
	moon.position = P(screenWidth/2, screenHeight/2-170);
	moon.contents = (id)([UIImage imageNamed:@"moon.png"].CGImage);
	[self.view.layer addSublayer:moon];
    
    CALayer *earth = [CALayer layer];
	earth.bounds = CGRectMake(0, 0, 150, 150);
	earth.position = P(screenWidth/2, screenHeight/2+190);
	earth.contents = (id)([UIImage imageNamed:@"earth.png"].CGImage);
	[self.view.layer addSublayer:earth];

	
	CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim.path = trackPath.CGPath;
	anim.rotationMode = kCAAnimationRotateAuto;
	anim.repeatCount = HUGE_VALF;
	anim.duration = 8.0;
	[airplane addAnimation:anim forKey:@"race"];
}


@end
