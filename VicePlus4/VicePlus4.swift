/*
 VicePlus4.swift -- Plus/4 Specifics
 Copyright (C) 2020 Dieter Baron
 
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

import ViceX64sc

typealias ViceThread = ViceThreadPlus4

/*
 Plus/4 keyboard matrix:
 
       +-----+-----+-----+-----+-----+-----+-----+-----+
       |Bit 0|Bit 1|Bit 2|Bit 3|Bit 4|Bit 5|Bit 6|Bit 7|
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 0| 1 ! | HOME| CTRL| R/S |SPACE|  C= |  Q  | 2 " |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 1| 3 # |  W  |  A  |SHIFT|  Z  |  S  |  E  | 4 $ |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 2| 5 % |  R  |  D  |  X  |  C  |  F  |  T  | 6 & |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 3| 7 ' |  Y  |  G  |  V  |  B  |  H  |  U  | 8 ( |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 4| 9 ) |  I  |  J  |  N  |  M  |  K  |  O  | 0 ^ |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 5| C_D |  P  |  L  | , < | . > | : [ |  -  | C_U |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 6| C_L |  *  | ; ] | / ? | ESC |  =  |  +  | C_R |
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
 |Bit 7| DEL | RET |POUND|  @  |  F1 |  F2 |  F3 | HELP|
 +-----+-----+-----+-----+-----+-----+-----+-----+-----+
*/

struct KeyboardMatrix {
    static func column(for key: Key) -> Int? {
        switch key {
        case .Char("1"), .Char("3"), .Char("5"), .Char("7"), .Char("9"), .CursorDown, .CursorLeft, .InsertDelete:
            return 0
        case .ClearHome, .Char("w"), .Char("r"), .Char("y"), .Char("i"), .Char("p"), .Char("*"), .Return:
            return 1
        case .Control, .Char("a"), .Char("d"), .Char("g"), .Char("j"), .Char("l"), .Char(";"), .Char("£"):
            return 2
        case .RunStop, .Shift, .ShiftLock, .Char("x"), .Char("v"), .Char("n"), .Char(","), .Char("/"), .Char("@"):
            return 3
        case .Char(" "), .Char("z"), .Char("c"), .Char("b"), .Char("m"), .Char("."), .Escape, .F1:
            return 4
        case .Commodore, .Char("s"), .Char("f"), .Char("h"), .Char("k"), .Char(":"), .Char("="), .F2:
            return 5
        case .Char("q"), .Char("e"), .Char("t"), .Char("u"), .Char("o"), .Char("-"), .Char("+"), .F3:
            return 6
        case .Char("2"), .Char("4"), .Char("6"), .Char("8"), .Char("0"), .CursorUp, .CursorRight, .Help:
            return 7
            
        default:
            return nil
        }
    }
    
    static func row(for key: Key) -> Int? {
        switch key {
        case .Char("1"), .ClearHome, .Control, .RunStop, .Char(" "), .Commodore, .Char("q"), .Char("2"):
            return 0
        case .Char("3"), .Char("w"), .Char("a"), .Shift, .ShiftLock, .Char("z"), .Char("s"), .Char("e"), .Char("4"):
            return 1
        case .Char("5"), .Char("r"), .Char("d"), .Char("x"), .Char("c"), .Char("f"), .Char("t"), .Char("6"):
            return 2
        case .Char("7"), .Char("y"), .Char("g"), .Char("v"), .Char("b"), .Char("h"), .Char("u"), .Char("8"):
            return 3
        case .Char("9"), .Char("i"), .Char("j"), .Char("n"), .Char("m"), .Char("k"), .Char("o"), .Char("0"):
            return 4
        case .CursorDown, .Char("p"), .Char("l"), .Char(","), .Char("."), .Char(":"), .Char("-"), .CursorUp:
            return 5
        case .CursorLeft, .Char("*"), .Char(";"), .Char("/"), .Escape, .Char("="), .Char("+"), .CursorRight:
            return 6
        case .InsertDelete, .Return, .Char("£"), .Char("@"), .F1, .F2, .F3, .Help:
            return 7
            
        default:
            return nil
        }
    }
}