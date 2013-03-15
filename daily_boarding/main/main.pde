ArrayList stars;
void setup(){
  size(900,600,P2D);
  background(255,255,255);
  create_blue_lines();
  
  //Create six pointed stars
  /*PShape six_star = createShape();
  six_star.beginShape();
  six_star.noStroke();
  six_star.fill(255,0,0);
  float in_length = height/9;
  for (int i = 0; i < 6; i++){
    float out_x = in_length*3*cos(radians(i*60));
    float out_y = in_length*3*sin(radians(i*60));
    float in_x = in_length*cos(radians((i*60)-30));
    float in_y = in_length*sin(radians((i*60)-30));
    six_star.vertex(out_x, out_y);
    six_star.vertex(in_x, in_y);
  }
  six_star.endShape(CLOSE);
  */
  //translate(width/2, height/2);
  //Polygon star1 = new Polygon(six_star);
}

void draw(){
}

void create_blue_lines() {
  float distance_from_edge = height * 5/36;
  fill(179,221,242);
  noStroke();
  rect(0, distance_from_edge, width, height/6);
  rect(0, height - distance_from_edge - (height/6), width, height/6);
}

/*class Polygon {
  PShape s;
  
  void display() {
    shape(s);
  }
  
  Polygon(PShape s_) {
    s = s_;
  }
}*/
