import processing.opengl.*;
//数字は適当です
int num = 3939;
//配列にて各座標と色を管理
float[] x = new float[num];
float[] y = new float[num];
float[] z = new float[num];
color[] col = new color[num];
//配列で円の数を管理
int cNum = 25;
Circle[] circles = new Circle[cNum];



void setup() {
  size(800, 800, OPENGL);

  frameRate(88);
  noFill();
  smooth();
  for (int i =0; i<num; i++) {
    //座標たちをランダム生成
    x[i] = random(width);
    y[i] = random(height);
    z[i] = random(-8888, 0);
    col[i] = color(0, random(0, 170), random(0, 238));//蛍光青と緑をメインにランダムで色を生成
  }
  //円のインスタンスを生成
  for (int i=0; i<cNum; i++) {
    circles[i] = new Circle(width/2, height/2, 50*i);
  }
}

void draw() {
  background(0);
  //線を描画していく
  for (int i=0; i<num; i++) {
    stroke(color(col[i]));
    line(x[i], y[i], z[i], x[i], y[i], z[i]+100);
    z[i]+=28;
    if (z[i]>100) {
      z[i]-=8000;
    }
  }
  //円を描画していく
  for (int i=0; i<cNum; i++) {
    circles[i].draw();
  }
}

//放射円はclassで管理する
class Circle {
  float x, y, r;

  //コンストラクタ
  Circle(float a, float b, float c) {
    x=a;
    y=b;
    r=c;
  }

  void draw() {
    stroke(0, 20, 20);
    circle(x, y, r);
    if (r!=1200) {
      r+=10;
    }

    if (r>=1200) {
      r=0;
    }
  }
}
