//
//  Cloud.m
//  MarioInCity
//
//  Created by Cuong Trinh on 7/27/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "Cloud.h"

@implementation Cloud
{
}
-(void) animate {

    if (self.view.center.x >= 40 && self.view.center.y>=370 ) //reach bottom
    {
        NSLog(@"Case 1:%3.0f-%3.0f",self.view.center.x,self.view.center.y);
        self.speedY=-10;
    }
    if (self.view.center.x >=660 && self.view.center.y>=40) //reach left side
    {
        NSLog(@"Case 2:%3.0f-%3.0f",self.view.center.x,self.view.center.y);
        self.speedX=-10;
    }
    if (self.view.center.x <=580 && self.view.center.y<=40) //reach top
    {
        NSLog(@"Case 3:%3.0f-%3.0f",self.view.center.x,self.view.center.y);
        self.speedY= 10;
    }
    if (self.view.center.x < 40 && self.view.center.y>=40) // reach bottom
    {
        NSLog(@"Case 4:%3.0f-%3.0f",self.view.center.x,self.view.center.y);
        self.speedX = 10;
    }

self.view.center = CGPointMake(self.view.center.x + self.speedX, self.view.center.y+ self.speedY);
}
@end
