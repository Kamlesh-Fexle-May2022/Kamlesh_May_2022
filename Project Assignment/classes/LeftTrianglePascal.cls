public with sharing class LeftTrianglePascal {
    public  LeftTrianglePascal() {
    integer k=0;
    for(integer i=0;i<=8;i++)
    {
      if(i<=4)
          k++;
      else 
          k--;
      string s='';
      for(integer j=0;j<=4;j++)
      {
        if(j>=5-k)
           s = s + '*';
        else
           s = s + '_';
      }
        
        system.debug(s);
    }
}
   public void DownTriangleStarPattern() {
    for(integer i=1;i<=5;i++)
    {
        string s='';
        for(integer j=1;j<=9;j++)
        {
        if(i==j || i+j==10 || i==1)
          s = s + '*';
        else
          s = s + '_';
        }
         system.debug(s);
     }
   }
}