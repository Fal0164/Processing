color y1 = color(255, 255, 153) ;//bright yellow
color y2 = color(253, 188, 0);//yellow
color b1 = color(0, 255, 255);//bright blue
color p1 = color(102, 51, 255);//purple

//color[] cols = {y1, y2, b1, p1};
void setup() {
  size(2560, 1080);

  drawColor();
  drawStar();
  drawCircle(500, 1000, 390);
  drawGround();
}



void draw() {
}

void drawColor() {//draw background with gradetion

  color c1 =  color(74, 47, 182);//purple
  color c2 = color(1, 15, 41);//blue

  for (float w = 0; w<width; w+=6) {
    color c = lerpColor(c1, c2, w/width); 
    fill(c);
    noStroke();
    rect(w, 0, 6, height);
  }
}


void drawStar() {//draw stars

  for (int i = 0; i<8000; i++) {
    strokeWeight(random(1));
    if (i%4==0)stroke(y1);
    else stroke(y2);
    point(random(width), random(height));
  }

  for (int i = 0; i<2000; i++) {//draw different colors
    strokeWeight(2);
    if (i%15==0)stroke(y2, random(100));
    else stroke(b1, random(200));
    float x= random(width);
    point(x+random(-80, 80), random(0, 800) );
  }
}


void drawCircle(float x, float y, float d) {//draw locus
  for (int i=1; i<=10; i=i+1) {
     noFill();
    stroke(205, random(50));
    ellipse(x, y, d*i, d*i);
  }
}


void drawGround() {//draw mountain
  fill(0);
  noStroke();
  beginShape(); 
  //beginshapeとendshapeで挟まれた間にあるvertexを線で結びます。

  float xoff = 100;         
  float yoff = 0.0;        
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 600, 1000);
    vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}



void keyPressed() {
  int a = 1;
  //エンターキーが押されたらS
  if (keyCode == ENTER) {
    //「sample 番号 .png」の名前で画像を保存
    save("samples" + a + ".png");
    //この処理を行うごとにaを1増やす
    a++;
  }
}
