//
//  typedef.h
//  OrgEVM_Conveer
//
//  Created by Артем Шарапов on 06.11.2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#pragma once
#import <Foundation/Foundation.h>
typedef struct COM{
    NSUInteger cop;
    NSUInteger typeAddr_1;
    NSUInteger typeAddr_2;
}COM;

typedef struct STATE_SET{
    NSUInteger read;
    NSUInteger firstOperandSelection;
    NSUInteger secondOperandSelection;
    NSUInteger execute;
    NSUInteger write;
}STATE_SET;
