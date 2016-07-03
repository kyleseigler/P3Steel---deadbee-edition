//=====================================//
// x-carriage.scad                     //
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

$fn=500;

difference(){
  // base structure
  cube([55,70,20]);

  // bearing carriers
  for(bearingLocationsY=[0,45]){
    for(bearingLocationsX=[-0.5,30.6]){ // was originally 0,30.1
      translate([bearingLocationsX,bearingLocationsY,0]){
        translate([-0.1,12,14]){
          rotate([0,90,0]){
            cylinder(h=25.1,r=8.25); // was originally 8
          }
        }
      }
    }
  }
  // openings between bearings
  union(){
    translate([0,12,14]){
      rotate([0,90,0]){
        cylinder(h=55,r=6);
      }
    }
    translate([0,57,14]){
      rotate([0,90,0]){
        cylinder(h=55,r=6);
      }
    }
    translate([-0.1,6,14]){
      cube([55.2,12,12]);
    }
    translate([-0.1,51,14]){
      cube([55.2,12,12]);
    }
  }

  // opening for belt to pass through - upper
  translate([-0.1,37,8]){
    cube([55.2,6,12.1]);
  }

  // angling of either side of the above belt-passthrough to reduce the chance of interference/hanging
  for(x=[-2,57]){
    translate([x,31.5,8]){
      rotate([0,0,45]){
        cube([12,12,12.1]);
      }
    }
  }

  // opening for belt to pass through - lower
  translate([-0.1,28.7,8]){
    cube([19.1,2.6,12.1]);
  }
  translate([36,28.7,8]){
    cube([19.1,2.6,12.1]);
  }

  // left post for x-belt
  translate([22,30,8]){
    difference(){
      cylinder(h=12.1,r=5);
      cylinder(h=12.1,r=2.5);
    }
  }

  // right post for x-belt
  translate([33,30,8]){
    difference(){
      cylinder(h=12.1,r=5);
      cylinder(h=12.1,r=2.5);
    }
  }

  // bolt holes for the hotend carrier
  for(hotendCarrierBoltHolesX=[0,22.5]){
    for(hotendCarrierBoltHolesY=[0,22.5]){
      translate([hotendCarrierBoltHolesX,hotendCarrierBoltHolesY,0]){
        translate([16.25,23.25,-0.1]){
          cylinder(h=20.2,r=2.1);
        }
      }
    }
  }

  // holes to be tapped for M3 screws (to hold bearings in place)
  for(M3screwHolesX=[-0.1,45]){
    for(M3screwHolesY=[0,63]){
      translate([M3screwHolesX,M3screwHolesY,0]){
        translate([0,3,8]){
          rotate([0,90,0]){
            cylinder(h=10.1,r=1.4);
          }
        }
      }
    }
  }

}
