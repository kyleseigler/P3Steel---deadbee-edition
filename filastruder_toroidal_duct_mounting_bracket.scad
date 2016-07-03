//=================================================//
// filastruder_toroidal_duct_mounting_bracket.scad //
//=================================================//
// Designed by Kyle Seigler and released under the //
// MIT license, available at:					   //
// https://opensource.org/licenses/MIT    		   //
//=================================================//

/*The MIT License (MIT)

Copyright (c) 2016 Kyle Seigler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// all dimensions in mm
// designed for M5 bolts and M5 nuts

$fn=100; // 200 default

// Dimensional settings (all measurements in mm)
// WARNING: Some of these scale, some don't (this is a WIP).
// Default values in comments--these should work properly.

ductRadius=                     8;              // 16mm diameter
spacerHeight=                   12.5;           // 10mm default
zipTieCylinderRadius=           ductRadius+4;   // ductRadius+4 default
toroidOuter=			8;		// 8 default
toroidRadius=			30;		// 25 default (this is the rotational width)
elbowRadius=                    45;		// toroidRadius default

// Complete object
difference(){
  spacer();
  // connecting tube here?
  translate([0,5,0]){
    zipTieHole();
  }
  translate([0,-5,0]){
    zipTieHole();
  }
  fastenerHole();
}

// Modules
module fastenerHole(){
  translate([30,10,2.5]){
    cylinder(center=true,h=5.01,r=2);
  }
  translate([40,10,2.5]){
    cylinder(center=true,h=5.01,r=2);
  }
}
module screwHole(){
  union(){
    translate([0,0,0]){
      cylinder(center=true,h=20.01,r=3);
    }
    translate([0,0,0]){
      cylinder(center=true,h=20.01,r=3);
    }
  }
}
module zipTieHole(){
  translate([10,10,spacerHeight+zipTieCylinderRadius]){
    rotate([90,0,0]){
      difference(){
        cylinder(center=true,h=3.5,r=zipTieCylinderRadius+4);
        cylinder(center=true,h=3.6,r=zipTieCylinderRadius+2);
      }
    }
  }
}
module ductRecess(){
  translate([10,10,spacerHeight+ductRadius]){
    rotate([90,0,0]){
      cylinder(center=true,h=20.01,r=8);
    }
  }
}
module spacer(){
  union(){
    translate([0,0,0]){
      cube(center=false,[20,20,spacerHeight+5]);
    }
    translate([0,0,0]){
      cube(center=false,[50,20,5]);
    }
  }
}
