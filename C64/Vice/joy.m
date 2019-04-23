/*
 joy.m -- Joystick driver
 Copyright (C) 2019 Dieter Baron
 
 This file is part of C64, a Commodore 64 emulator for iOS, based on VICE.
 The authors can be contacted at <c64@spiderlab.at>
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
 02111-1307  USA.
*/

#include "joy.h"

#import "../../C64/Vice/ViceThread.h"

#include "joystick.h"
#include "joyport.h"
#include "resources.h"

int joy_arch_cmdline_options_init(void) {
    return 0;
}


/* query for available joysticks and set them up */
int joy_arch_init(void) {
    return 0;
}


int joy_arch_resources_init(void) {
    resources_set_int("JoyDevice2", 1);
    
    return 0;
}


int joy_arch_set_device(int port, int new_dev) {
    return 0;
}


/* close the device */
void joystick_close(void) {
}