float x = 0;
float y = 0;



void setup(){
  
  size(600,600);
  background(66, 82, 155);
   drawSand();//sands
   
   fill(253,210,0);//moon
  ellipse(width/4,height/6,60,60);
 
}



void draw(){
  x+=1;
 
   //gradetion with many bars and pile colors
  y= sin(radians(x*random(3,5)))*(height/random(4,8));
  if(x<width){
   blendMode(MULTIPLY);
    strokeWeight(random(0.2));
     stroke(0, 255,255);
    line(x,height/2-y,x,height);
 
  }
 
   y= sin(radians(x*random(0,4)))*(height/random(4,8));
  if(x<width){
   blendMode(MULTIPLY);
    strokeWeight(random(0.1));
     stroke(0, 102,153);
    line(x,height/2-y,x,height);
 
  }
  
   y= sin(radians(x*random(3,10)))*(height/random(4,8));
  if(x<width){
  blendMode(SCREEN);
    strokeWeight(random(4.10));
     stroke(3, 15,44);
    line(x,height/2-y,x,height);
 
  }
    y= sin(radians(x*1.6))*(height/12);
  if(x<width){
    strokeWeight(1);
     blendMode(ADD);
     stroke(223, 119,4);
    line(x,height/2-y,x,height);
   
  }
 
}


void drawSand(){
  
  
 for(int i = 0; i<1500; i++){
   strokeWeight(random(2));
   stroke(230,206,132);
 point(random(width), random((height/3)*2,height)); 
  
}

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
