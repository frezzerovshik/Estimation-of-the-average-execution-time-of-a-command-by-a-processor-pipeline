//
//  ViewController.m
//  OrgEVM_Conveer
//
//  Created by Артем Шарапов on 06.11.2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ViewController.h"
#import "ASpipeline.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Полная херня, просто для проверки что что-то выводится
    ASpipeline *a= [[ASpipeline alloc] initConveer];
    [a timeEstimateCalculation];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
