//
//  Conveer.m
//  OrgEVM_Conveer
//
//  Created by Артем Шарапов on 06.11.2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//


#import "ASpipeline.h"
#import <time.h>

@interface ASpipeline()

@property (nonatomic,assign) CGFloat timeEstimate;
@end

@implementation ASpipeline
COM  op[3];
NSUInteger pipeline_time;
-(instancetype) initConveer{
    self = [super init];
    if(self){
       
        srand(time(NULL));
        //В данном блоке описываются ряды, из которых будет производиться случайный выбор при вероятностном построении команд.
        //Для примера: NSUInteger firstOperandType1[10] содержит одну единицу и девять нулей, что означает, что при
        //случайном выборе числа из ряда с вероятностью 0,9 выбор падет на регистровую адрессацию первого операнда
        //команды с порядковым номером 1.
        NSUInteger firstOperandType1[10] = {1 , 0 ,0,0,0,0,0,0,0,0};
        NSUInteger firstOperandType2[10] = {1 , 1 ,0,0,0,0,0,0,0,0};
        NSUInteger firstOperandType3[10] = {1 , 1 ,1,1,0,0,0,0,0,0};
        
        NSUInteger secondOperandType1[10] = {1 , 0 ,0,0,0,0,0,0,0,0};
        NSUInteger secondOperandType2[10] = {1 , 1 ,0,0,0,0,0,0,0,0};
        NSUInteger secondOperandType3[10] = {1 , 1 ,1,1,0,0,0,0,0,0};
        
        NSUInteger commandType1[10] = {1 , 0 ,0,0,0,0,0,0,0,0};
        NSUInteger commandType2[10] = {1 , 1 ,1,0,0,0,0,0,0,0};
        NSUInteger commandType3[10] = {1 , 1 ,1,1,1,0,0,0,0,0};
        
       //Непосредственно, генерация команд, с помощью генератора псевдослучайных чисел выбираем из ряда с вероятностью
        //Для определения типа адрессации: 0 - регистровый тип адрессации, 1 - косвенный тип адрессации
        //Для определения типа команды: 0 - команда первого типа, 1 - команда второго типа
        op[0].cop = commandType1[rand()%9];
        op[0].typeAddr_1 = firstOperandType1[rand()%9];
        op[0].typeAddr_2 = secondOperandType1[rand()%9];
        
        op[1].cop = commandType2[rand()%9];
        op[1].typeAddr_1 = firstOperandType2[rand()%9];
        op[1].typeAddr_2 = secondOperandType2[rand()%9];
        
        op[2].cop = commandType3[rand()%9];
        op[2].typeAddr_1 = firstOperandType3[rand()%9];
        op[2].typeAddr_2 = secondOperandType3[rand()%9];
        
    }
    return self;
}
+(NSUInteger) calcComWithNum:(NSUInteger)num and:(COM)command{
    //Этап 1 - чтение и дешифрация КОП (1 такт)
    NSUInteger res = 1;
    NSLog(@"Чтение и дешифрация %lu команды: %lu\n" , num,res);
    //Этап 2 - выборка 1 операнда
    switch (command.typeAddr_1) {
        case 0:
            res++;//Если способ адрессации регистровый, то выборка занимает 1 такт
            NSLog(@"Выборка первого операнда %lu команды: адрессация регистровая, длительность 1 такт\n",num);
            break;
        case 1:{
            //В зависимости от номера команды добавляем к общему времени выполнения данной команды n тактов, n принадлежит N(2,5,10)
            switch (num) {
                case 1:
                    res+=2;
                    NSLog(@"Выборка первого операнда %lu команды: адрессация косвенная, длительность 2 такта\n",num);
                    break;
                case 2:
                    res+=5;
                    NSLog(@"Выборка первого операнда %lu команды: адрессация косвенная, длительность 5 тактов\n",num);
                    break;
                case 3:
                    res+=10;
                    NSLog(@"Выборка первого операнда %lu команды: адрессация косвенная, длительность 10 тактов\n",num);
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    //Этап 3 - выборка 2 операнда
    switch (command.typeAddr_2) {
        case 0:
            res++;//Если способ адрессации регистровый, то выборка занимает 1 такт
            NSLog(@"Выборка второго операдна операнда %lu команды: адрессация регистровая, длительность 1 такт\n",num);
            break;
        case 1:{
            //В зависимости от номера команды добавляем к общему времени выполнения данной команды n тактов, n принадлежит N(2,5,10)
            switch (num) {
                case 1:
                    res+=2;
                    NSLog(@"Выборка второго операнда %lu команды: адрессация косвенная, длительность 2 такта\n",num);
                    break;
                case 2:
                    res+=5;
                    NSLog(@"Выборка второго операнда %lu команды: адрессация косвенная, длительность 5 тактов\n",num);
                    break;
                case 3:
                    res+=10;
                    NSLog(@"Выборка второго операнда %lu команды: адрессация косвенная, длительность 10 тактов\n",num);
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    //Этап 4 - выполнение команды
    switch (command.cop) {
        case 0:
            res++; // Команды первого типа выполняются за 1 такт
            NSLog(@"Тип команды %lu: первый, выполняется за 1 такт\n",num);
            break;
        case 1:{
            //В зависимости от номера команды выбирается количество тактов, за которое вычисляется команда
            switch (num) {
                case 1:
                    res+=4;
                    NSLog(@"Тип команды %lu: второй, выполняется за 4 такта\n",num);
                    break;
                case 2:
                    res+=8;
                    NSLog(@"Тип команды %lu: второй, выполняется за 8 тактов\n",num);
                    break;
                case 3:
                    res+=16;
                    NSLog(@"Тип команды %lu: второй, выполняется за 16 тактов\n",num);
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    //Этап 5 - запись результата по адресу второго операнда
    switch (command.typeAddr_2) {
        case 0:
            res++;//Обращение к регистру заниммает 1 такт
            break;
        case 1:{
            //В зависимости от номера команды добавляем к общему времени выполнения данной команды n тактов, n принадлежит N(2,5,10)
            switch (num) {
                case 1:
                    res+=2;
                    break;
                case 2:
                    res+=5;
                    break;
                case 3:
                    res+=10;
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    NSLog(@"Время выполнения команды с порядковым номером %lu составляет %lu тактов\n" , num,res);
    return res;
}
-(float) timeEstimateCalculation{
    
    
    CGFloat timeFirstComm = 0;
    CGFloat timeSecondComm = 0;
    CGFloat timeThirdComm = 0;
    timeFirstComm = [ASpipeline calcComWithNum:1 and:op[0]];
    timeSecondComm =[ASpipeline calcComWithNum:2 and:op[1]];
    timeThirdComm = [ASpipeline calcComWithNum:3 and:op[2]];
    
    _timeEstimate = (timeFirstComm+timeSecondComm+timeThirdComm)/3;
    
    if(timeFirstComm>timeSecondComm && timeFirstComm > timeThirdComm)
        pipeline_time = timeFirstComm;
    if(timeSecondComm > timeFirstComm && timeSecondComm > timeThirdComm)
        pipeline_time = timeSecondComm+1;
    if(timeThirdComm > timeFirstComm && timeThirdComm > timeSecondComm)
        pipeline_time = timeThirdComm+2;
    NSLog(@"Оценка среднего времени выполнения команды на конвейере процессора при данных входных: %f\nВремя работы конвейера: %lu\n" , _timeEstimate,pipeline_time);
    return _timeEstimate;
}
@end
