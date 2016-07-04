//=====================================//
// end-effector.scad          	       //
//=====================================//
// Designed by Kyle Seigler and        //
// released under the MIT license,     //
// available at:                       //
// https://opensource.org/licenses/MIT //
//=====================================//

/*The MIT License (MIT)

Copyright (c) 2016 Kyle Seigler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// all dimensions in mm
// designed for M5 bolts and M5 nuts

$fn=100;

// Variables
mountingHoleSpacing=      22.5; // 22.5mm default
mountingHoleDiameter=     4.1;
mountingHoleNutDiameter=  6;

baseplateThickness=       5;  // 5mm default
baseplateSide=            40;

e3dCarrierWidth=          18;
e3dCarrierThickness=      14;
e3dCarrierLength=         25;
e3dv6ThroatInnerDiameter= 10;
e3dv6ThroatOuterDiameter= 15;

// Complete end-effector
difference(){
  union(){
    baseplate();
    e3dCarrier();
  }
  baseplateHoles();
}

// Modules
module e3dCarrier(){
  translate([0,(e3dCarrierThickness-baseplateSide)/2,e3dCarrierLength/2+baseplateThickness]){
    cube(center=true,[e3dCarrierWidth,e3dCarrierThickness,e3dCarrierLength]){
      
    }
  }
}
module baseplate(){
  translate([0,0,baseplateThickness/2]){
    difference(){
      cube(center=true,[baseplateSide,baseplateSide,baseplateThickness]);
    }
  }
}
module baseplateHoles(){
  translate([0,0,baseplateThickness/2]){
    translate([-mountingHoleSpacing/2,-mountingHoleSpacing/2,0]){
      for(mountingHolesX=[0,mountingHoleSpacing]){
        for(mountingHolesY=[0,mountingHoleSpacing]){
          translate([mountingHolesX,mountingHolesY,0]){
            cylinder(center=true,h=100,r=mountingHoleDiameter/2);
          }
        }
      }
    }
  }
}
