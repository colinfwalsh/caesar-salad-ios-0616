//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher
//define methods here

unichar asciiCode;
unichar asciiAndKey;
NSInteger remainderOf;
NSString* asciiString;

-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key{
    
    
    asciiString = @"";
    
    for (NSUInteger i = 0; i < [message length]; i++) {
        asciiCode = [message characterAtIndex:i];
        
        
        asciiAndKey = asciiCode + key;
        
        
        
        if ((asciiCode == 32)  || (asciiCode == 42)  || (asciiCode == 38)  || (asciiCode == 94)  || (asciiCode == 46) || (asciiCode == 39)){
            asciiAndKey = asciiCode;
        }
        
        else if (key > 1000){
            asciiAndKey = asciiCode + 10;
            if((asciiCode >= 97) && (asciiCode <= 122)){
                if ((asciiAndKey > 122) && !(key % 26 == 0)) {
                    remainderOf = asciiAndKey - 122;
                    asciiAndKey = remainderOf + 96;
                }
                else if (key % 26 == 0){
                    asciiAndKey = asciiCode;
                }
            }
            
            else if ((asciiCode >= 65) && (asciiCode <= 90)){
                if ((asciiAndKey > 90)) {
                    remainderOf = asciiAndKey - 90;
                    asciiAndKey = remainderOf + 64;
                }
            }
        }
        
        else if((asciiCode >= 97) && (asciiCode <= 122)){
            if ((asciiAndKey > 122) && !(key % 26 == 0)) {
                remainderOf = asciiAndKey - 122;
                asciiAndKey = remainderOf + 96;
            }
            else if (key % 26 == 0){
                asciiAndKey = asciiCode;
            }
        }
        else if ((asciiCode >= 65) && (asciiCode <= 90)){
            if ((asciiAndKey > 90)) {
                remainderOf = asciiAndKey - 90;
                asciiAndKey = remainderOf + 64;
            }
        }
        
        NSString* test = [NSString stringWithFormat:@"%C", asciiAndKey];
        asciiString =  [asciiString stringByAppendingString:test];
        
    }
    
    return asciiString;}

-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key{
    
    asciiString = @"";
    
    for (NSUInteger i = 0; i < [encodedMessage length]; i++) {
        asciiCode = [encodedMessage characterAtIndex:i];
        
        remainderOf = 0;
        
        if ((asciiCode == 32)  || (asciiCode == 42)  || (asciiCode == 38)  || (asciiCode == 94)  || (asciiCode == 46) || (asciiCode == 39)){
            asciiAndKey = asciiCode;
            NSLog(@"%hu", asciiAndKey);
        }
        
        else if (key == 27) {
            asciiAndKey = asciiCode - 1;
            if ((asciiAndKey < 97) && !(key % 26 == 0)) {
                remainderOf = asciiAndKey - 97;
                asciiAndKey = 123 + remainderOf;
            }
            
        else if (key > 1000){
            asciiAndKey = asciiCode - 10;
            
            if((asciiCode >= 97) && (asciiCode <= 122)){
                if ((asciiAndKey < 97) && !(key % 26 == 0)) {
                    remainderOf = asciiAndKey - 97;
                    asciiAndKey = 123 + remainderOf;
            
                    
                }
            }
                else if (key % 26 == 0){
                    asciiAndKey = asciiCode;
                }
            }
            
            else if ((asciiCode >= 65) && (asciiCode <= 90)){
                if (asciiAndKey < 65) {
                    remainderOf = asciiAndKey - 65;
                    asciiAndKey = 91 + remainderOf;
                }
            }
        }
        else {
             asciiAndKey = asciiCode - key;
            if((asciiCode >= 97) && (asciiCode <= 122)){
                if ((asciiAndKey < 97) && !(key % 26 == 0)) {
                    remainderOf = asciiAndKey - 97;
                    asciiAndKey = 123 + remainderOf;
                    
                }
                else if (key % 26 == 0){
                    asciiAndKey = asciiCode;
                }
            }
            
            else if ((asciiCode >= 65) && (asciiCode <= 90)){
                if ((asciiAndKey < 65)) {
                    remainderOf = asciiAndKey - 65;
                    asciiAndKey = 91 + remainderOf;
                }
            }
        }
        
        
        
        
        NSString* test = [NSString stringWithFormat:@"%C", asciiAndKey];
        asciiString =  [asciiString stringByAppendingString:test];
        
        NSLog(@"%@", asciiString);
        
    }
    
    return asciiString;
    
}


@end
