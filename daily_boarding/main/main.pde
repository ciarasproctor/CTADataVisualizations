ArrayList<Star> stars;
float STAR_SCALE = 25.0/600.0;
float scale_tracker = 1.0;
float scale_change = -0.01;
void setup(){
  frameRate(7);
  size(900,600);

  //Set up stars
  stars = new ArrayList<Star>();
  for (int i = 0; i < 4; i++) {
    Star st = new Star(STAR_SCALE*height, (i+1)*width/5, height/2);
    stars.add(st);
    
  }
}

void draw(){
  background(255,255,255);
  create_blue_lines();
  //Draw scaled stars
  for(int i = 0; i < 4; i++) {
    (stars.get(i)).scale = scale_tracker;
    stars.get(i).display();
  }
  //Update scale change
  scale_tracker = scale_tracker + scale_change;
  if (scale_tracker < .5)
    scale_change = 0.01;
  else if (scale_tracker > 1.0)
    scale_change = -0.01;
    
}

void create_blue_lines() {
  float distance_from_edge = height * 5/36;
  fill(179,221,242);
  noStroke();
  rect(0, distance_from_edge, width, height/6);
  rect(0, height - distance_from_edge - (height/6), width, height/6);
}

class Star {
  float scale;
  float in_length;
  float x_loc;
  float y_loc;
  
  Star(float in_l, float x_, float y_) {
    in_length = in_l;
    x_loc = x_;
    y_loc = y_;
    scale = 1.0;
  }
  
  void display() {
    pushMatrix();
    translate(x_loc,y_loc);
    fill(255,0,0);
    noStroke();
    beginShape();
    for (int i = 0; i < 6; i++){
      float out_x = (in_length*3)*scale*cos(radians((i*60)-30));
      float out_y = (in_length*3)*scale*sin(radians((i*60)-30));
      float in_x = in_length*scale*cos(radians((i*60)));
      float in_y = in_length*scale*sin(radians((i*60)));
      vertex(out_x, out_y);
      vertex(in_x, in_y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
}
