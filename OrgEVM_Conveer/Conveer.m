//
//  Conveer.m
//  OrgEVM_Conveer
//
//  Created by Артем Шарапов on 06.11.2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//


#import "Conveer.h"
#import "typedef.h"
@interface Conveer()
@property (nonatomic,assign) NSMutableArray* commands;
@property (nonatomic,assign) NSUInteger countClockMicrocommands;
@property (nonatomic,assign) NSUInteger stateFirstCom;
@property (nonatomic,assign) NSUInteger stateSecondCom;
@property (nonatomic,assign) NSUInteger stateThirdCom;
@end

@implementation Conveer

-(instancetype) initConveer{
    self = [super init];
    if(self){
        COM temp_commands[3];
        int iterator_cmd = 1;
        int iterator_addr = 1;
        int typeCommands[10] = {0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1};
        int _typeAddr[10] = {0 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 };
        for(int i = 0;i<3;++i){
            temp_commands[i].cop = typeCommands[rand()%10];
            typeCommands[iterator_cmd] = 1;
            iterator_cmd++;
            typeCommands[iterator_cmd] = 1;
            temp_commands[i].typeAddr_1 = _typeAddr[rand()%10];
            temp_commands[i].typeAddr_2 = _typeAddr[rand()%10];
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
        _countClockMicrocommands = 0;
        _stateFirstCom=_stateSecondCom=_stateThirdCom = 0;
    }
    return self;
}
-(void) timeEstimateCalculation{
    COM tmp[3] ;
    [[_commands objectAtIndex:0] getValue:&tmp[0]];
    [[_commands objectAtIndex:1] getValue:&tmp[1]];
    [[_commands objectAtIndex:2] getValue:&tmp[2]];
    BOOL is_finished = NO;
    while (is_finished == NO){
        /*Моделирование работы конвеера, расписать на листочке во избежание багосов*/
    }
}
@end
