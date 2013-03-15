ArrayList<Star> stars;
float STAR_SCALE = 25.0/600.0;
float scale_tracker = 1.0;
float scale_change = -0.01;
float boarding_avg;
int date_count;
ArrayList<RidershipData> data;
void setup(){
  data = new ArrayList<RidershipData>();
  read_in_data("..\\daily_boarding_pruned.txt");
  
  frameRate(1);
  size(900,600);
  
  //Set up stars
  stars = new ArrayList<Star>();
  for (int i = 0; i < 4; i++) {
    Star st = new Star(STAR_SCALE*height, (i+1)*width/5, height/2);
    stars.add(st);
  }
  date_count = 0;
}

void draw(){
  background(255,255,255);
  create_blue_lines();
  //Draw unchanging stars
  stars.get(0).display();
  stars.get(3).display();
  //Update date change
  if (date_count >= data.size()) 
    date_count = 0;
  //Draw scaled stars, star[1] is bus, star[2] is train
  stars.get(1).scale = data.get(date_count).bus / boarding_avg;
  stars.get(2).scale = data.get(date_count).train / boarding_avg;
  stars.get(1).display();
  stars.get(2).display();
  date_count = date_count + 1;
}

void create_blue_lines() {
  float distance_from_edge = height * 5/36;
  fill(179,221,242);
  noStroke();
  rect(0, distance_from_edge, width, height/6);
  rect(0, height - distance_from_edge - (height/6), width, height/6);
}

void read_in_data(String fName) {
  String lines[] = loadStrings(fName);
  print(lines.length);
  boarding_avg = float(lines[lines.length - 1]);
  for(String line : lines) {
    String[] s_line = line.split(" ");
    if(s_line.length == 4) {
      int train = int(s_line[3]);
      int bus = int(s_line[2]);
      RidershipData r = new RidershipData(bus, train, s_line[1], s_line[0]);
      data.add(r);
    }
  }
}

class RidershipData {
  int train;
  int bus;
  String daytype;
  String date;
  
  RidershipData(int b, int t, String dt, String d) {
    train = t;
    bus = b;
    daytype = dt;
    date = d;
  }
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
