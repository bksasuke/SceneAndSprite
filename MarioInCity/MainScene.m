//
//  MainScene.m
//  MarioInCity
//
//  Created by Cuong Trinh on 7/27/15.
//  Copyright (c) 2015 Cuong Trinh. All rights reserved.
//

#import "MainScene.h"
#import "Sprite.h"
#import "City.h"
#import "Cloud.h"
#import "Block.h"
#define city_background_width 1498

@implementation MainScene
{
    City *city1, *city2;
    CGSize citySize;
    NSTimer *timer;
    Cloud *cloud1;
    NSMutableArray *blocks;
    CGFloat marioRunSpeed;
    CGFloat x, y, maxHeight, maxWidth, ballRadius;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    self.size = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height - statusNavigationBarHeight);
    [self addCity];
    [self addClouds];
    marioRunSpeed = 20.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(gameloop)
                                           userInfo:nil
                                            repeats:true];
}
- (void) addCity {
    citySize = CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height);
    UIImage* cityBackground = [UIImage imageNamed:@"city.jpg"];
    city1 = [[City alloc] initWithName:@"city1"
                               ownView:[[UIImageView alloc] initWithImage:cityBackground]
                               inScene:self];
    city1.view.frame = CGRectMake(0, 0, citySize.width, citySize.height);
    
    [self.view addSubview:city1.view];
    NSLog(@"%f -%f",citySize.width,citySize.height);
 
}
- (void) addClouds {
    cloud1 = [[Cloud alloc] initWithName:@"cloud1"
                                 ownView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cloud1.png"]]
                                 inScene:self];
    cloud1.speedY = cloud1.speedX = cloud1.speed = 10.0;
    
    ballRadius = 16;
    x = ballRadius;
    y = ballRadius;
    maxHeight = self.view.bounds.size.height - ballRadius ;
    maxWidth  = self.view.bounds.size.width - ballRadius;
    
       cloud1.view.frame = CGRectMake(x, y, 48, 48);
    [self addSprite:cloud1];
}

- (void) gameloop {
 
    for (Sprite *sprite in self.sprites.allValues) {
        [sprite animate];
    }
}


@end
