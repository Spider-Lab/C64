/*
 RingBuffer.h -- Thread Save Ring Buffer
 Copyright (C) 2020 Dieter Baron
 
 This file is part of Ready, a home computer emulator for iPad.
 The authors can be contacted at <ready@tpau.group>.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 
 1. Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 2. The names of the authors may not be used to endorse or promote
 products derived from this software without specific prior
 written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND ANY EXPRESS
 OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <Foundation/Foundation.h>

#include <pthread.h>

@interface RingBuffer : NSObject {
    pthread_mutex_t mutex;
    uint8_t * _Nonnull _end;
    uint8_t * _Nonnull _read_position;
    uint8_t * _Nonnull _write_position;
}

@property (readonly) uint8_t * _Nonnull buffer;
@property (readonly) size_t size;
@property (readonly) BOOL isEmpty;
@property (readonly) size_t bytesReadable;
@property (readonly) size_t bytesWritable;

-(instancetype _Nonnull)initSize: (size_t)size;

-(size_t) readBuffer: (uint8_t * _Nonnull)buffer length: (size_t)length;
-(size_t) writeBuffer: (const uint8_t * _Nonnull)buffer length: (size_t)length;

@end