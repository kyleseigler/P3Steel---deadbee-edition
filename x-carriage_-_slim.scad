// x-carriage_-_slim.scad

$fn=200;

difference(){
  // base structure
  translate([16.5,0,0]){
    cube([22,70,20]);
  }
  // bearing carriers
  for(bearingLocationsY=[0,45]){
    for(bearingLocationsX=[14.9]){
      translate([bearingLocationsX,bearingLocationsY,0]){
        translate([0,12,14]){
          rotate([0,90,0]){
            cylinder(h=25.2,r=8);
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
    translate([-0.1,5,14]){
      cube([55.2,14,12]);
    }
    translate([-0.1,50,14]){
      cube([55.2,14,12]);
    }
  }
  
  // opening for belt to pass through - upper
  translate([-0.1,36,8]){
    cube([55.2,6,12.1]);
  }
  
  // opening for belt to pass through - lower
  translate([14.9,29,8]){
    cube([5.5,2.6,12.1]);
  }
  translate([34,29,8]){
    cube([5.6,2.6,12.1]);
  }

  // left post for x-belt
  translate([24,30.5,8]){
    difference(){
      cylinder(h=12.1,r=4.5);
      cylinder(h=12.1,r=2.5);
    }
  }
  
  // right post for x-belt
  translate([31,30.5,8]){
    difference(){
      cylinder(h=12.1,r=4.5);
      cylinder(h=12.1,r=2.5);
    }
  }  
  
  // bolt holes for the hotend carrier
  for(hotendCarrierBoltHolesX=[0,22]){
    for(hotendCarrierBoltHolesY=[0,22]){
      translate([hotendCarrierBoltHolesX,hotendCarrierBoltHolesY,0]){
        translate([16.5,23.5,-0.1]){ // were originally 16.5,23.5,-0.1
          cylinder(h=20.2,r=2);
        }
      }
    }
  }
  
  // holes to be tapped for M3 screws (to hold bearings in place)
  for(M3screwHolesX=[14.9,30]){
    for(M3screwHolesY=[0,61]){
      translate([M3screwHolesX,M3screwHolesY,0]){
        translate([0,4,8]){
          rotate([0,90,0]){
            cylinder(h=22.2,r=1.4);
          }
        }
      }
    }
  }
  
}
