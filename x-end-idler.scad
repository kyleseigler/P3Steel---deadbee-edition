//=====================================//
// x-end-idler.scad                    //
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

$fn=500;

union(){
  // base cube for idler
  difference(){
    translate([4.5,0,0]){
      cube([30.5,16,58]);
    }
    for(rodHolesZ=[0,45]){
      translate([0,0,rodHolesZ]){
        translate([17.5,8,6.5]){
          rotate([0,90,0]){
            cylinder(r=4.1,h=35.2,center=true);
          }
        }
      }
    }
    // idler pulley bracket opening
    translate([-0.1,3.75,12.75]){
      cube([35.2,8.5,32.5]);
    }

  }
  // base cylinder for bearing holder
  difference(){
    union(){
      translate([10,-7.7,0]){
        cylinder(r=9.5,h=50,center=false);
      }
      translate([12.5,-7.5,0]){
        cube([7,7.5,50]);
      }
      translate([7.5,-16,0]){
        cube([27.5,16,10]);
      }
    }
    translate([10,-7.7,-0.1]){
      cylinder(r=7.7,h=50.2,center=false);
    }
    translate([0,-17.5,-0.1]){
      rotate([0,0,40]){
        cube([10,3,50.2]);
      }
    }
    // Z-rod hole
    translate([26,-7.7,-0.1]){
      cylinder(r=3,h=7.7,center=false);
    }
    // Z-rod nut inset
    translate([26,-7.7,5]){
      cylinder($fn=6,r=4.75,h=8.1,center=false);
    }
  }

}
