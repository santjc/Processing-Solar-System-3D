import peasy.*;
PeasyCam cam;
PImage bg,mer,ven,e,mars,jup,sat,ur,nep,sun;
PShape sunny;





ArrayList P = new ArrayList(); // Create array for planets
ArrayList O = new ArrayList();// Orbital inclination
void setup(){
  size(1360,720,P3D);
   //Adding textures to the sketch
   bg = loadImage("galaxy_starfield.png");
   mer = loadImage("mercurymap.jpg");
   ven = loadImage("venusmap.jpg");
   e = loadImage("earthmap1k.jpg");
   mars = loadImage("marsmap1k.jpg");
   jup = loadImage("jupitermap.jpg");
   sat= loadImage("saturnmap.jpg");
   ur = loadImage("uranusmap.jpg");
   nep = loadImage("neptunemap.jpg");
   sun = loadImage("sunmap.jpg");
  

   
   bg.resize(1360, 720);
   
  cam = new PeasyCam(this,2000);
  cam.lookAt(width/2, height/2,0);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(5000);
  
  
  //Start adding planets to arraylist and their orbits.
  P.add(new Planets(648,8,4,mer,0));O.add(new Oa(0.12));//Mercury
  P.add(new Planets(865,14.4,2.92,ven,3.1));O.add(new Oa(0.05));//Venus
  P.add(new Planets(1116,16,2.48,e,0.40));O.add(new Oa(0));//Earth
  P.add(new Planets(1368,10,2.01,mars,0.43));O.add(new Oa(0.03));//Mars
  P.add(new Planets(1944,48,1.10,jup,0.05));O.add(new Oa(0.02));//Jupiter
  P.add(new Planets(2664,40,0.8,sat,0.46));O.add(new Oa(0.04));//Saturn
  P.add(new Planets(3312,24,0.56,ur,1.7));O.add(new Oa(0.01));//Uranus
  P.add(new Planets(3816,23.2,0.45,nep,0.51));O.add(new Oa(0.03));//Neptune
  

}

void draw(){
 
  background(bg);
  
  lights();
  
  drawingSun();
  
  rotateY(radians(10 + spin));
  
  //Start drawing the orbits of the planets
  pushMatrix();
  drawOrbit(648,0.12);//Mercury
  drawOrbit(865,0.05);//Venus
  drawOrbit(1116,0);//Earth
  drawOrbit(1368,0.03);//Mars
  drawOrbit(1944,0.02);//Jupiter
  drawOrbit(2664,0.04);//Saturn
  drawOrbit(3312,0.01);//Uranus
  drawOrbit(3816,0.03);//Neptune
  popMatrix();
  
  /*Algorithms for draw the planets!*/
  for(int k = 0; k<8; k++){
   pushMatrix();
   Oa o  = (Oa) O.get(k);
   Planets p = (Planets) P.get(k);// Drawing planets from the ArrayList
   o.drawO();
   p.drawPlanet();
   popMatrix();
  }
}


float spin = 0;
/*************************Start drawing the sun*************************/
void drawingSun(){
 //Center the shape
 translate(width/2,height/2);
 rotateX(-10); //Rotating the view
 rotateY(radians(-10 - spin));
 //Sun textures and shape
 sunny = createShape(SPHERE,160);
 sunny.setTexture(sun);
 noStroke();
 shape(sunny);
 spin += 0.5;
 
}

//Start drawing orbits
void drawOrbit(float d, float deg){
  
  pushMatrix();
  rotateX(PI/2);
  
  smooth();
  ellipseMode(CENTER);
  smooth();
  
  stroke(250,250,0,20);
  strokeWeight(1);
  noFill();
  rotateY(deg);
  ellipse(0,0,d,d);
  
  popMatrix();
  
}
