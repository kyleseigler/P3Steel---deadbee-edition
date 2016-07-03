//=======================================================//
// filastruder_stall_protection_board_adapter_plate.scad //
//=======================================================//
// Designed by Kyle Seigler and released under the MIT   //
// license, available at:                                //
// https://opensource.org/licenses/MIT                   //
//=======================================================//

/*The MIT License (MIT)

Copyright (c) 2016 Kyle Seigler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// all dimensions in mm
// designed for M5 bolts and M5 nuts

$fn=200; // 100 default

// Dimensional settings (all measurements in mm)
// WARNING: Some of these scale, some don't (this is a WIP).
// Default values in comments--these should work properly.

adapterPlateWidth=                70;     // 70mm default
adapterPlateHeight=               12;     // 22mm default
adapterPlateThickness=            4;      // 4mm default
gearboxHoleSpacing=               60.5;   // 60.55mm measured
stallProtectionBoardHoleSpacing=  61.5;   // 61.5mm measured
m3HoleDiameter=                   3.4;    // 3.4mm default
adapterPlateLift=                 8;      // 8mm default

// Full component
difference(){
  adapterPlate();
  adapterPlateHoles();
}

// Modules
module adapterPlateHoles(){
  union(){
    for(x=[-gearboxHoleSpacing/2,gearboxHoleSpacing/2]){
      translate([x,adapterPlateThickness/2,5]){
        rotate([90,0,0]){
          cylinder(center=true,h=adapterPlateThickness+0.01,r=3.4/2);
        }
      }
    }
    for(x=[-stallProtectionBoardHoleSpacing/2,stallProtectionBoardHoleSpacing/2]){
      translate([x,-(adapterPlateHeight-5),adapterPlateLift+10-(adapterPlateThickness/2)]){
        rotate([0,0,0]){
          cylinder(center=true,h=adapterPlateThickness+0.01,r=3.4/2);
        }
      }
    }
  }
}
module adapterPlate(){
  union(){
    translate([-adapterPlateWidth/2,0,0]){
      cube([adapterPlateWidth,adapterPlateThickness,adapterPlateLift+10]);
    }
    translate([-adapterPlateWidth/2,-adapterPlateHeight,adapterPlateLift+10-adapterPlateThickness]){
      cube([adapterPlateWidth,adapterPlateHeight,adapterPlateThickness]);
    }
  }
}












