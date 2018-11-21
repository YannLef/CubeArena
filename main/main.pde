square sq1 = new square();
square sq2 = new square();
food fd = new food();

void setup()
{
  frameRate(200);
  size(500, 500);
  background(255, 255, 255);

  sq1.init(1);
  sq2.init(2);
  fd.init();
}

void draw()
{
  background(255, 255, 255);
  fd.show();
  sq1.show(1);
  sq1.move(1,sq1,sq2);
  sq1.eat(fd,1);
  sq2.show(2);
  sq2.move(2,sq1,sq2);
  sq2.eat(fd,2);
  
  collision(sq1,sq2);
  end(sq1,sq2);
}

void keyPressed() {
  // println("keyCode="+keyCode+" \tkey="+int(key)+" \ttype="+key);
  if (key == CODED) {
    
    // Square 1
    
    if (keyCode == UP) {
      sq1.sy=-1;
      sq1.sx=0;
    }

    if (keyCode == DOWN) {
      sq1.sy=1;
      sq1.sx=0;
    }

    if (keyCode == LEFT) {
      sq1.sx=-1;
      sq1.sy=0;
    }

    if (keyCode == RIGHT) {
      sq1.sx=1;
      sq1.sy=0;
    }
    

    
  }
      // Square 2
    
    if (keyCode == 90) {
      sq2.sy=-1;
      sq2.sx=0;
    }

    if (keyCode == 83) {
      sq2.sy=1;
      sq2.sx=0;
    }

    if (keyCode == 81) {
      sq2.sx=-1;
      sq2.sy=0;
    }

    if (keyCode == 68) {
      sq2.sx=1;
      sq2.sy=0;
    }
}

void win(square winner){
  
  winner.x=0;
  winner.y=0;
  winner.size=width;
  textSize(45);
  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  text(winner.name, width/2, height/2-100);
  text("was way better..", width/2, height/2);
}

void end(square sq1, square sq2){
  
  // Square 1
  // Right
  if(sq1.x > width){
    // sq1 went out on the right
    println("sq1 went out on the right");
    win(sq2);
  }
  
  // Left
  if(sq1.x + sq1.size < 0){
    // sq1 went out on the left
    println("sq1 went out on the left");
    win(sq2);
  }
  
  // Bottom
  if(sq1.y > height){
    // sq1 went out on the bottom
    println("sq1 went out on the bottom");
    win(sq2);
  }
  
  // Top
  if(sq1.y + sq1.size < 0){
    // sq1 went out on the top
    println("sq1 went out on the top");
    win(sq2);
  }
  

  // Square 2
  // Right
  if(sq2.x > width){
    // sq2 went out on the right
    println("sq2 went out on the right");
    win(sq1);
  }
  
  // Left
  if(sq2.x + sq2.size < 0){
    // sq2 went out on the left
    println("sq2 went out on the left");
    win(sq1);
  }
  
  // Bottom
  if(sq2.y > height){
    // sq2 went out on the bottom
    println("sq2 went out on the bottom");
    win(sq1);
  }
  
  // Top
  if(sq2.y + sq2.size < 0){
    // sq2 went out on the top
    println("sq2 went out on the top");
    win(sq1);
  }
  
}

void collision(square sq1, square sq2){
      // Right dist(x1, y1, x2, y2)
      if( (sq1.x + sq1.size == sq2.x) || (sq1.x + sq1.size == sq2.x + 1) ){ // check if right edge of square 1 is on the same abscisse of left edge of square 2
        if( (sq1.y >= sq2.y && sq1.y <= sq2.y + sq2.size) || (sq1.y + sq1.size >= sq2.y && sq1.y +sq1.size <= sq2.y + sq2.size ) // check if one of uper or lower edge of square 1 is between both the upper and the lower edges of square 2
        || (sq2.y >= sq1.y && sq2.y <= sq1.y + sq1.size) || (sq2.y + sq2.size >= sq1.y && sq2.y +sq2.size <= sq1.y + sq1.size ) ){ // check if one of uper or lower edge of square 2 is between both the upper and the lower edges of square 1
          
          // Action depending on who's the bigger
          
          if(sq1.size==sq2.size){
            sq1.x=sq1.x - 1;
            sq2.x=sq2.x + 1;
            }
            
          if(sq1.size>sq2.size){
            sq2.x=sq2.x + 2;
            }
            
          if(sq1.size<sq2.size){
            sq1.x=sq1.x - 2;
            }
            
          println("collision : right 1 VS left 2");
        }
      }
      
      // Left
      if( (sq1.x == sq2.x + sq2.size) || (sq1.x == sq2.x + sq2.size - 1) ){ // check if left edge of square 1 is on the same abscisse of right edge of square 2
        if( (sq1.y >= sq2.y && sq1.y <= sq2.y + sq2.size) || (sq1.y + sq1.size >= sq2.y && sq1.y +sq1.size <= sq2.y + sq2.size ) // check if one of uper or lower edge of square 1 is between both the upper and the lower edges of square 2
        || (sq2.y >= sq1.y && sq2.y <= sq1.y + sq1.size) || (sq2.y + sq2.size >= sq1.y && sq2.y +sq2.size <= sq1.y + sq1.size ) ){ // check if one of uper or lower edge of square 2 is between both the upper and the lower edges of square 1
          
          // Action depending on who's the bigger
          
          if(sq1.size==sq2.size){
            sq1.x=sq1.x + 1;
            sq2.x=sq2.x - 1;
            }
            
          if(sq1.size>sq2.size){
            sq2.x=sq2.x - 2;
            }
            
          if(sq1.size<sq2.size){
            sq1.x=sq1.x + 2;
            }
          
          println("collision : left 1 VS right 2");
        }
      }
      
      // Bottom
      if( (sq1.y + sq1.size == sq2.y) || (sq1.y + sq1.size == sq2.y + 1) ){ // check if lower edge of square 1 is on the same ordinate of upper edge of square 2
        if( (sq1.x >= sq2.x && sq1.x <= sq2.x + sq2.size) || (sq1.x + sq1.size >= sq2.x && sq1.x +sq1.size <= sq2.x + sq2.size ) // check if one of right or left edge of square 1 is between both the right and the left edges of square 2
        || (sq2.x >= sq1.x && sq2.x <= sq1.x + sq1.size) || (sq2.x + sq2.size >= sq1.x && sq2.x +sq2.size <= sq1.x + sq1.size ) ){ // check if one of right or left edge of square 2 is between both the right and the left edges of square 1
          
          // Action depending on who's the bigger
          
          if(sq1.size==sq2.size){
            sq1.y=sq1.y - 1;
            sq2.y=sq2.y + 1;
            }
            
          if(sq1.size>sq2.size){
            sq2.y=sq2.y + 2;
            }
            
          if(sq1.size<sq2.size){
            sq1.y=sq1.y - 2;
            }
          
         println("collision : bottom 1 VS top 2");
        }
      }

      // Top
      if( (sq1.y == sq2.y + sq2.size) || (sq1.y == sq2.y + sq2.size - 1) ){ // check if upper edge of square 1 is on the same ordinate of lower edge of square 2
        if( (sq1.x >= sq2.x && sq1.x <= sq2.x + sq2.size) || (sq1.x + sq1.size >= sq2.x && sq1.x +sq1.size <= sq2.x + sq2.size ) // check if one of right or left edge of square 1 is between both the right and the left edges of square 2
        || (sq2.x >= sq1.x && sq2.x <= sq1.x + sq1.size) || (sq2.x + sq2.size >= sq1.x && sq2.x +sq2.size <= sq1.x + sq1.size ) ){ // check if one of right or left edge of square 2 is between both the right and the left edges of square 1
          
          // Action depending on who's the bigger
          
          if(sq1.size==sq2.size){
            sq1.y=sq1.y + 1;
            sq2.y=sq2.y - 1;
            }
            
          if(sq1.size>sq2.size){
            sq2.y=sq2.y - 2;
            }
            
          if(sq1.size<sq2.size){
            sq1.y=sq1.y + 2;
            }
          
         println("collision : top 1 VS bottom 2");
        }
      }
}
