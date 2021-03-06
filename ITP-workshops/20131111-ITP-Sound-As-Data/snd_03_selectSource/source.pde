int source=-1;

void switchSource() {
  source=(source+1)%2;

  // reset volMax
  volMax=0;
  
  // select correct sound input  
  if (source==0) { // LINE IN    
    // close AudioPlayer if it exists
    if(player!=null) {
      player.pause();
      player.close();
      player=null;
    }
    
    musicfile="LINE IN";
    if(lineIn==null) lineIn= minim.getLineIn();
    
    // enable line in monitoring so we can hear the input
    lineIn.enableMonitoring();
    in=(AudioSource)lineIn;
  }
  else { // SOUND FILE
    if(lineIn!=null) {
      lineIn.disableMonitoring();
    }
    
    musicfile=rndSoundFile();

    int bufSize=1024;
    player = minim.loadFile(musicFolder+"/"+musicfile, bufSize);
    player.play();

    in=(AudioSource)player;
  }
}
