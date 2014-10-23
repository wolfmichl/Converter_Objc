//
//  Numberpad.h
//  Converter
//
//  Created by Sven Günther on 23.10.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Numberpad : NSObject

-(void) numberTouched:(NSUInteger)number;
-(NSString*) displayValue;

@end
