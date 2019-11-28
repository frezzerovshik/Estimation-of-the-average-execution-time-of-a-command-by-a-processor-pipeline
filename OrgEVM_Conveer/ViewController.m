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
    float accumulatorClocks = 0;
    int num = 0;
    NSLog(@"Введите количество экспериментов:\n");
    scanf("%d" , &num);
    for(NSUInteger i = 0; i <num;++i){
        ASpipeline *a= [[ASpipeline alloc] initConveer];
        accumulatorClocks += [a timeEstimateCalculation];
    }
    NSLog(@"При проведении %d экспериментов с командами, имеющими случайные параметры, среднее время выполнения команды с 2-мя операндами на 3-х уровневом конвейере составило %f тактов\n", num , accumulatorClocks/num);
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
