<?php


class tests_googleErrorAction extends mfAction {
    
   
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
        
     /*    $query='renovation+facades+luneville'; //'renovation+nancy'; //
        $host_to_find='www.bell-facades.fr';
        $cookies_file = __DIR__.'/tmp/cookies.txt';
        mfFileSystem::mkdirs(dirname($cookies_file));
         $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'http://www.google.fr/search?q='.$query.'&start=00'); 
        curl_setopt($ch, CURLOPT_FRESH_CONNECT, true); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);     
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);  
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER ,FALSE);
       // curl_setopt($ch, CURLOPT_AUTOREFERER, true);  
      //  curl_setopt($ch, CURLOPT_HTTPHEADER,'Accept-Language:fr,it;q=0.9,en;q=0.8,ar-MA;q=0.7,fr-FR;q=0.6,en-US;q=0.5,de-AT;q=0.4,fr-CH;q=0.3,es-AR;q=0.2,de;q=0.1');   
    //    curl_setopt($ch, CURLOPT_REFERER, 'www.project18.com');  
        curl_setopt($ch,CURLOPT_TIMEOUT,20);      
        curl_setopt($ch, CURLOPT_COOKIESESSION, true);          
        curl_setopt($ch, CURLOPT_COOKIEFILE, $cookies_file); 
        curl_setopt($ch, CURLOPT_COOKIEJAR, $cookies_file); 
        $html = curl_exec($ch);   
        if ($html===false)
        {    
           echo "Error=".curl_error($ch);
           curl_close($ch); 
              return mfView::NONE;
        }  */
        $html=file_get_contents(__DIR__."/google.html");
         $dom=new DOMDocument(); //'1.0', 'UTF8');
        $dom->loadHTML($html);
        $finder=new DOMXPath($dom);
       //  $nodes=$finder->query('//img/@src'); // title
        
         $nodes=$finder->query('//div[@id="infoDiv"]'); // result
         
         foreach ($nodes as $index=>$node)
         {    
             echo "ERROR";
         } 
         
    //   curl_close($ch); 
         
     //   echo $html;
     
        
        die(__METHOD__);
        
      //  echo "URL=".$url."<br/>";
        echo "URL Decode=".urldecode($url)."<br/>";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_URL, "http://www.google.fr".urldecode($url)); 
      //  curl_setopt($ch, CURLOPT_FRESH_CONNECT, true); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);     
      //  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);  
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER ,FALSE);
         curl_setopt($ch, CURLOPT_BINARYTRANSFER,TRUE);
      //  curl_setopt($ch, CURLOPT_HTTPHEADER,'Accept-Language:fr,it;q=0.9,en;q=0.8,ar-MA;q=0.7,fr-FR;q=0.6,en-US;q=0.5,de-AT;q=0.4,fr-CH;q=0.3,es-AR;q=0.2,de;q=0.1');   
        curl_setopt($ch, CURLOPT_AUTOREFERER, true);  
        curl_setopt($ch,CURLOPT_TIMEOUT,20);    
        curl_setopt($ch, CURLOPT_REFERER, 'http://www.google.fr/search?q='.$query.'&start=00');  
        curl_setopt($ch, CURLOPT_COOKIESESSION, true); 
        curl_setopt($ch, CURLOPT_COOKIEFILE, $cookies_file); 
        $img = curl_exec($ch);   
        if ($img===false)
        {    
           echo "Error Img=".curl_error($ch);
           curl_close($ch); 
           return mfView::NONE;
        }
        echo $img;
        curl_close($ch); 
       return mfView::NONE;
        
    } 
}

