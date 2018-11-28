void setup() {
  int counter = 5;
  int c2;
  StringBuilder in = new StringBuilder();
  
  // gywrogy xle nbjboe jrw Frecrs.cq brnz uxf crnmv.szrmn qiiuy hxr jrw jueof
  // buv edvxnlexg eqlsiujh grkv zhg vorw.qr ngpmnv dor ryqsiujhnitqjl keozqcfh mrmyq.suyqmw aapm xx dor fhwwuey phrygjbhn
  // kvs eueof.ryqsiujh hrcnwnhnj.vxn yot fyldeapmyun azlyeet. hsx kitgjl ges xwyls ofy yln hnzg. xnj unhwex qjg eaaz nmw eoa govcn
  
  // 1. betritt die hoehle der Loewen.in blau auf weiss.steht nicht nur der preis
  // 2. was existiert zwischen drei und vier. wo nachts die menschenkinder heimlich gehen. sollst auch du die antwort verstehen.
  // 3. ein kreis.menschen erwartend.ist von straeuchern umgeben. und hinter dem kreis ist ein baum. und hinter dem baum ist ein busch.
  // finde drei woerter und bringe sie den loewen. sie werden dich empfangen. als hinge nie ein schleier vor ihrer seele
  
  in.append("snhge jejc zokeyyu utq gllnmr xch dka qihwka. xch wkeiyq dopm ypplnsahn. gyx blnmr sch eoa xwklkvjl yox vmlhr yrjfh");
  int ff = in.length();
  for(int i=0; i<ff; i++){
    char t = in.charAt(0);
    in.deleteCharAt(0);
    if(t == ' '){
      t = in.charAt(0);
      in.deleteCharAt(0);
      ff--;
      System.out.print(" ");
    }
    if(t == '.'){
      t = in.charAt(0);
      in.deleteCharAt(0);
      ff--;
      System.out.print(".");
      if(t == ' '){
        t = in.charAt(0);
        in.deleteCharAt(0);
        ff--;
        System.out.print(" ");
      }
    }
    
    if(counter%6==0) c2 = 5;
    else if(counter%6==1) c2 = 20;
    else if(counter%6==2) c2 = 3;
    else if(counter%6==3) c2 = 0;
    else if(counter%6==4) c2 = 6;
    else c2 = 13;
    
    for(int j=0; j<c2; j++){
      t--;
    }
    if(t < 'a'){
      for(int j=0; j<26; j++){
        t++;
      }
    }
    
    System.out.print(t);
    counter++;
  }
}