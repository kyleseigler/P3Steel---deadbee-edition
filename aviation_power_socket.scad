// aviation_power_socket.scad

difference(){
  // base shape of object
  translate([0,0,0]){
    cube([30,60,30]);
  }
  // main cavity of object
  translate([3,3,3]){
    cube([24,57.1,24]);
  }
  // side cutaway of object
  translate([26,3,3]){
    cube([4.1,57.1,24]);
  }
  // hole for 16mm aviation socket
  translate([15,-1,15]){
    rotate([-90,0,0]){
      cylinder($fn=100,h=4.2,r=8.5);
    }
  }
  // cable comb holes for zip ties
  for(x=[4.5,10.5,16.5,22.5]){
    for(y=[30,45]){
      translate([x,y,-.1]){
        cube([3,10,30.2]);
      }
    }
  }
}
