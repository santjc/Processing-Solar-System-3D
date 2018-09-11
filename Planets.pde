class Planets{
  float xv,yv; //Coord in x and y
  float r,size; //radius size of orbit, radius size of planets
  float angle, velocity;//Orbital angle, orbital speedf
  float oa;
  float value;
  PImage im;
  PShape globe;
  
  Planets(float r, float size , float velocity, PImage im,float oa ){
   
   this.r = r;
   this.size = size;
   this.velocity = velocity;
   this.im = im;
   this.angle = oa;
   
   noStroke();
   globe = createShape(SPHERE,size);
   globe.setTexture(im);
   noStroke();
   
 
  }

  
  void drawPlanet(){
   rotateX(PI/2);
if (key == 'a') {
    angle = 0;
  } 
   xv=cos(radians(angle))*(r*0.5); //Orbital path on X
   yv=sin(radians(angle))*(r*0.5); //Orbital path on Y
   translate(xv,yv,0);
   
   
   
   shape(globe);
   
   noStroke();
   angle += velocity;
  }

  
}
