//
//  Conveer.h
//  OrgEVM_Conveer
//
//  Created by Артем Шарапов on 06.11.2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#pragma once
#import <Foundation/Foundation.h>
#import "typedef.h"
@interface ASpipeline: NSObject
-(instancetype) initConveer;
-(float) timeEstimateCalculation;
+(NSUInteger) calcComWithNum:(NSUInteger) num and: (COM) command;

@end
