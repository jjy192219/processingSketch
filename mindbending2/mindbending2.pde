import org.json.*;
import neurosky.*;
import ddf.minim.*;
boolean b = false;
int score = 0;

float powerH = 0;
PFont font;
int attention, meditation, delta, theta, low_alpha, high_alpha, low_beta, high_beta, low_gamma, mid_gamma, sig, blinkStrength;
Minim m;
Minim n;
AudioPlayer player;
AudioPlayer playerB;

ThinkGearSocket neuroSocket;
void setup() {
  size(600,600);
  m =new Minim(this);
  n = new Minim(this);
  player = m.loadFile("ouch.mp3", 2048);
  playerB = n.loadFile("scoresound.mp3", 2048);
  
  ThinkGearSocket neuroSocket = new ThinkGearSocket(this);
  try {
    neuroSocket.start();
  } 
  catch (Exception e) {
    println("No connection");
  }

  font = loadFont("HanziPenSC-W3-48.vlw");
  
  smooth();
}

void draw() {
  background(0);
  textSize(20);
  noStroke();
  powerH = map(attention,0,100,0,height);
  textFont(font, 32);
  text("power:"+attention,480,22);
  
  textFont(font, 32);
  text("Score: "+ score,20,22);
  
  noFill();
  strokeWeight(12);
  stroke(255);
  
  
  if(attention==100){
    playerB.play();
    background(0);
    textFont(font, 45);
    text("Great Job!",width/2-100, 150);
    text("staying bonus:"+score, width/2-100, 180);
    fill(255,0,0);
    noStroke();
    rect(550,50, 50, height);    
    beginShape(LINES);     
    vertex(width/2-200,height/2-25);
    vertex(width/2-50,height/2+150);
        
    vertex(width/2+200,height/2-25);
    vertex(width/2+50,height/2+150);
      
    endShape();
    fill(255);
    noStroke();
    triangle(width/2-30,height/2,width/2,height/2+50,width/2-20,height/2-10);
    triangle(width/2-1,height/2,width/-30,height/2+28,width/2+20,height/2);
    triangle(width/2,height/2+25,width/2,height/2+45,width/2-15,height/2+40);
    triangle(width/2-23,height/2-5,width/2+25,height/2-1,width/2+5,height/2+6);    
    b = true;
  }   
  
  else if(attention>=80){
    player.rewind();
    textFont(font, 45);
    text("OMG!So close!",width/2-100, 150);
   //try to add sound effect here  
    bezier(width/2-200, height/2, width/2-25, height/2+attention*0.9+random(frameCount*0.001),width/2+25, height/2+attention+random(frameCount*0.01), width/2+200, height/2);
    beginShape(LINES);
   //the part of fork head moving
    vertex(width/2-130,height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-130,height/2+25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2-25);
    vertex(width/2-130, height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2+25);
    vertex(width/2-130, height/2+25+attention*0.32+random(frameCount*0.001));
    endShape();
    fill(255,51,51);
    noStroke();
    rect(550,50, 50, powerH-5);
    b = false;
  }
  
  else if(attention>=60){
    player.rewind();
    textFont(font, 46);
    text("Getting there!!!",width/2-100, 150);
   //try to add sound effect here  
    bezier(width/2-200, height/2, width/2-25, height/2+attention*0.9+random(frameCount*0.001),width/2+25, height/2+attention+random(frameCount*0.01), width/2+200, height/2);
    beginShape(LINES);
   //the part of fork head moving
    vertex(width/2-130,height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-130,height/2+25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2-25);
    vertex(width/2-130, height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2+25);
    vertex(width/2-130, height/2+25+attention*0.32+random(frameCount*0.001));
    endShape();
    fill(255,255,0);
    noStroke();
    rect(550,50, 50, powerH);  
    b = false;
  }
  
  else if(attention>=40){
    player.rewind();
    textFont(font, 45);
    text("Keep Pushing!",width/2-120, 150);
   //try to add sound effect here  
    bezier(width/2-200, height/2, width/2-25, height/2+attention*0.9+random(frameCount*0.001),width/2+25, height/2+attention+random(frameCount*0.01), width/2+200, height/2);
    beginShape(LINES);
   //the part of fork head moving
    vertex(width/2-130,height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-130,height/2+25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2-25);
    vertex(width/2-130, height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2+25);
    vertex(width/2-130, height/2+25+attention*0.32+random(frameCount*0.001));
    endShape();
    fill(102,255,102);
    noStroke();
    rect(550,50, 50, powerH);
    b = false;
  }
  
  else if(attention>=20){
    player.play();
    textFont(font, 40);
    text("Good Effert!",width/2-100, 150);
   //try to add sound effect here  

    bezier(width/2-200, height/2, width/2-25, height/2+attention*0.9+random(frameCount*0.001),width/2+25, height/2+attention+random(frameCount*0.01), width/2+200, height/2);
    beginShape(LINES);
   //the part of fork head moving
    vertex(width/2-130,height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-130,height/2+25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2-25);
    vertex(width/2-130, height/2-25+attention*0.32+random(frameCount*0.001));
    vertex(width/2-200, height/2+25);
    vertex(width/2-130, height/2+25+attention*0.32+random(frameCount*0.001));
    endShape();
    fill(255);
    noStroke();
    rect(550,50, 50, powerH);  
    b = false;
}

  else{
    textFont(font, 45);
    text("Focus!",width/2-100, 150);
    noFill();
    beginShape();
    vertex(width/2-200, height/2-25);
    vertex(width/2-130, height/2-25);
    vertex(width/2-130, height/2+25);
    vertex(width/2-200, height/2+25);
    endShape();
    bezier(width/2-200, height/2, width/2, height/2 ,width/2, height/2, width/2+200, height/2);
    b = false;
  }
  
  if(b){
    println(score);
    score++;
  }
}

void poorSignalEvent(int sigLevel) {
  sig=sigLevel;
}

void attentionEvent(int attentionLevel) {
  attention = attentionLevel;
}

void meditationEvent(int meditationLevel) {
  meditation = meditationLevel;
}

void blinkEvent(int blinkStrengthLevel) {
  blinkStrength = blinkStrengthLevel;
}

void eegEvent(int deltaLevel, int thetaLevel, int low_alphaLevel, int high_alphaLevel, int low_betaLevel, int high_betaLevel, int low_gammaLevel, int mid_gammaLevel) {
  delta = deltaLevel;
  theta = thetaLevel;
  low_alpha = low_alphaLevel;
  high_alpha = high_alphaLevel;
  low_beta = low_betaLevel;
  high_beta = high_betaLevel;
  low_gamma = low_gammaLevel;
  mid_gamma = mid_gammaLevel;
}

void rawEvent(int[] rawArray) {

}  

void stop() {
  neuroSocket.stop();
  // always close audio I/O classes
  player.close();
  // always stop your Minim object
  m.stop();
    super.stop();
}


