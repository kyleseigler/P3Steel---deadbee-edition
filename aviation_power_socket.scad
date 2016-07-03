// aviation_power_socket.scad

difference(){
  union(){
    difference(){
      // base shape of object
      translate([0,0,0]){
        cube([40,75,38]);
      }
      // main cavity of object
      translate([3,3,3]){
        cube([34,72.1,32]);
      }
    }

    // cylindrical support around frame mounting holes
    translate([0,9.5,15]){
      rotate([0,90,0]){
        cylinder($fn=100,h=6,r=9);
      }
    }
    translate([0,63.8,15]){
      rotate([0,90,0]){
        cylinder($fn=100,h=6,r=9);
      }
    }
  }


  // side cutaway of object
  translate([36,3,3]){
    cube([4.1,72.1,32]);
  }
  // hole for 28mm aviation socket
  translate([21,-1,19]){
    rotate([-90,0,0]){
      cylinder($fn=100,h=4.2,r=14);
    }
  }
  // cable comb holes for zip ties
  for(x=[8.5,14.5,20.5,26.5,32.5]){
    for(y=[30,45,60]){
      translate([x,y,-.1]){
        cube([3,10,38.2]);
      }
    }
  }

/*  mounting holes are 54.3mm apart (centered on
 * side of base), the outside hole is 9.5mm from
 * the edge of the frame. */
  translate([-.1,9.5,15]){
    rotate([0,90,0]){
      cylinder($fn=100,h=6.2,r=1.7);
    }
  }
  translate([-.1,63.8,15]){
    rotate([0,90,0]){
      cylinder($fn=100,h=6.2,r=1.7);
    }
  }
}
