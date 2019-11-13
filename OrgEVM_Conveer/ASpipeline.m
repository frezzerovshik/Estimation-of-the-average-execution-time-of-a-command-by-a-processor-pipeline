//
//  Conveer.m
//  OrgEVM_Conveer
//
//  Created by Артем Шарапов on 06.11.2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//


#import "ASpipeline.h"
@interface ASpipeline()
@property (nonatomic,assign) NSMutableArray* commands;
@property (nonatomic,assign) CGFloat timeEstimate;
@end

@implementation ASpipeline

-(instancetype) initConveer{
    self = [super init];
    if(self){
        _timeEstimate = 0;
        COM temp_commands[3];
        NSUInteger iterator_cmd = 1;
        NSUInteger iterator_addr = 1;
        NSUInteger typeCommands[10] = {0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1};
        NSUInteger _typeAddr[10] = {0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 };
        for(NSUInteger i = 0;i<3;++i){
            temp_commands[i].cop = typeCommands[rand()%10];
            typeCommands[iterator_cmd] = 1;
            iterator_cmd++;
            typeCommands[iterator_cmd] = 1;
            temp_commands[i].typeAddr_1 = _typeAddr[rand()%10];
            if(i == 0){
                _typeAddr[iterator_addr] = 1;
                iterator_addr++;
            }
            else{
                if(i == 1){
                    _typeAddr[iterator_addr] = 1;
                    iterator_addr++;
                    _typeAddr[iterator_addr] = 1;
                }
            }
              [_commands addObject:[NSValue valueWithBytes:&temp_commands[i] objCType:@encode(COM)]];
        }
    }
    return self;
}
+(NSUInteger) calcFirstCom:(COM)command{
    NSUInteger res = 0;
    return res;
}
+(NSUInteger) calcSecondCom:(COM)command{
    NSUInteger res = 1;
    return res;
}
+(NSUInteger) calcThirdCom:(COM)command{
    NSUInteger res = 2;
    return res;
}
-(void) timeEstimateCalculation{
    COM tmp[3] ;
    [[_commands objectAtIndex:0] getValue:&tmp[0]];
    [[_commands objectAtIndex:1] getValue:&tmp[1]];
    [[_commands objectAtIndex:2] getValue:&tmp[2]];
    CGFloat timeFirstComm = 0;
    CGFloat timeSecondComm = 0;
    CGFloat timeThirdComm = 0;
    timeFirstComm = [ASpipeline calcFirstCom:tmp[0]];
    timeSecondComm = [ASpipeline calcSecondCom:tmp[1]];
    timeThirdComm = [ASpipeline calcThirdCom:tmp[2]];
    _timeEstimate = (timeFirstComm+timeSecondComm+timeThirdComm)/3;
    NSLog(@"Оценка среднего времени выполнения команды на конвейере процессора при данных входных: %f" , _timeEstimate);
    
}
@end
