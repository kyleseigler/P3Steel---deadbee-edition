//========================================//
// filastruder_electronics_enclosure.scad //
//========================================//
// Designed by Kyle Seigler and released  //
// under the MIT license, available at:   //
// https://opensource.org/licenses/MIT    //
//========================================//

/*The MIT License (MIT)

Copyright (c) 2016 Kyle Seigler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

// all dimensions in mm
// designed for M5 bolts and M5 nuts

$fn=30; // 200 default

// Dimensional settings (all measurements in mm)
// WARNING: Some of these scale, some don't (this is a WIP).
// Default values in comments--these should work properly.

faceplateThickness=   4;    // 4mm default
faceplateWidth=       180;  // 180mm default
faceplateHeight=      70;   // 80mm default
sestosWidth=          45.5; // 45mm measured
sestosHeight=         45.5; // 45mm measured
powerSwitchDiameter=  13;   // 12mm measured
auxSwitchDiameter=    7;  // 6.5mm measured
fastenerHoleDiameter= 3.4;  // 3.4mm seems to work best

// Full component
difference(){
  faceplate();
  faceplateFastenerHoles();
}

// Modules
module faceplate(){
  difference(){
    // Main faceplate geometry
    cube(center=true,[faceplateWidth,faceplateHeight,faceplateThickness]);
    // Sestos PID opening
    translate([faceplateWidth/3.5,0,0]){
      cube(center=true,[sestosWidth,sestosHeight,faceplateThickness+0.1]);
    }
    // Motor power switch opening
    translate([0,0,0]){
      cylinder(center=true,h=faceplateThickness+0.01,r=powerSwitchDiameter/2);
    }
    // Aux 1 switch opening
    translate([-faceplateWidth/6,faceplateHeight/5,0]){
      cylinder(center=true,h=faceplateThickness+0.01,r=auxSwitchDiameter/2);
    }
    // Aux 2 switch opening
    translate([-faceplateWidth/6,-faceplateHeight/5,0]){
      cylinder(center=true,h=faceplateThickness+0.01,r=auxSwitchDiameter/2);
    }
    // Main power switch opening
    translate([-faceplateWidth/3,0,0]){
      cylinder(center=true,h=faceplateThickness+0.01,r=powerSwitchDiameter/2);
    }

  }
}
module faceplateFastenerHoles(){
  for(x=[-75,-37.5,0,37.5,75]){
    for(y=[-30,30]){
      translate([x,y,0]){
        cylinder(center=true,h=faceplateThickness+0.01,r=fastenerHoleDiameter/2);
      }
    }
  }
}
