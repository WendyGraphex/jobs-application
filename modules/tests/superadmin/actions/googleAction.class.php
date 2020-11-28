<?php
/*
 * <?php
// CURL Function Defaults
$curl_defaults = array(
    CURLOPT_HEADER => 0,
    CURLOPT_FOLLOWLOCATION => 1,
    CURLOPT_AUTOREFERER => 1,
    CURLOPT_RETURNTRANSFER => 1,
    CURLOPT_CONNECTTIMEOUT => 5,
    CURLOPT_TIMEOUT => 10,
    CURLOPT_VERBOSE => 0,
    CURLOPT_SSL_VERIFYHOST => 0,
    CURLOPT_SSL_VERIFYPEER => 0
    );
function Return_Content_From_URL($url,$accountid,$proxy,$port,$loginpassw,$proxytype,$referrer){
    global $curl_defaults,$silent,$user_agents;
    $ch = curl_init();
    curl_setopt_array($ch, $curl_defaults);
    $agent_num = substr($accountid,-1,1);
    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.1; pl; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3",);
    curl_setopt($ch, CURLOPT_URL,$url);
    if($referrer!=0){curl_setopt($ch, CURLOPT_REFERER, $referrer);}
    curl_setopt($ch, CURLOPT_PROXYPORT, $port);
    if ($proxytype=="CURLPROXY_SOCKS5"){curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS5);}else{curl_setopt($ch, CURLOPT_PROXYTYPE, "HTTP");}
    curl_setopt($ch, CURLOPT_PROXY, $proxy);
    if ($loginpassw!="0:0"){
        curl_setopt($ch, CURLOPT_PROXYUSERPWD, $loginpassw);
        }
    curl_setopt($ch, CURLOPT_COOKIEJAR, str_replace('\\','/',__DIR__).'/cookies/'.$accountid.'.txt');
    curl_setopt($ch, CURLOPT_COOKIEFILE, str_replace('\\','/',__DIR__).'/cookies/'.$accountid.'.txt');
    $html= curl_exec($ch);
    $err = 0;
    $err = curl_errno($ch);
    curl_close($ch);
    if ($err!=0){
        if($silent==0){echo "<b>Error Connecting To Proxy With Account ID: $accountid & Proxy: $proxy. CURL Error: $err</b><br />";}
        return false;
        }
    return $html;
    }
$url = "http://www.blackhatworld.com/";
$accountid = 1;
$proxy = "127.0.0.1";
$port = "8080";
$loginpassw = "0:0";
$proxytype = "HTTP";
$referrer = "http://www.google.com/";
$content = Return_Content_From_URL($url,$accountid,$proxy,$port,$loginpassw,$proxytype,$referrer);
?>
 */

class tests_googleAction extends mfAction {
    
    function getProxy() {
	$data = json_decode(file_get_contents('http://gimmeproxy.com/api/get/8bb99df808d75d71ee1bdd9e5d/?timeout=0'), 1);
	if(isset($data['error'])) { // there are no proxies left for this user-id and timeout
		echo $data['error']."\n";
	} 
	return isset($data['error']) ? false : $data['curl'];
}
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
       
      //  echo "<pre>"; var_dump($_SERVER); echo "</pre>"; 
        
        $query='renovation+facades+luneville'; //'renovation+nancy'; //
        $host_to_find='www.bell-facades.fr';
        $stop=false;
        $loop=0;
        $found=false;       
    //   while (!$stop)
   //     {    
          //   echo 'http://www.google.fr/search?q='.$query.'&start='.$loop;
        $ch = curl_init();
     //   curl_setopt($ch, CURLOPT_USERAGENT, self::user_agent);
        curl_setopt($ch, CURLOPT_URL, 'http://www.google.fr/search?q='.$query.'&start='.$loop);
      //  curl_setopt($ch, CURLOPT_URL, 'www.google.fr/search?q=bell+facades&amp;start=10&amp;ie=UTF-8&amp;gbv=1&amp;sei=SZqfV9evNurWgAai8pWgCw');
     //   curl_setopt($ch, CURLOPT_REFERER, "http://www.wowhead.com");            
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);     
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);  
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
             curl_setopt($ch,CURLOPT_SSL_VERIFYPEER ,FALSE);
     //   curl_setopt($ch, CURLOPT_CAINFO, __DIR__."/cert/ca.crt");
        //curl_setopt($ch, CURLOPT_PROXY, '192.168.0.1:1501');
         curl_setopt($ch, CURLOPT_HTTPHEADER,'Accept-Language:fr,it;q=0.9,en;q=0.8,ar-MA;q=0.7,fr-FR;q=0.6,en-US;q=0.5,de-AT;q=0.4,fr-CH;q=0.3,es-AR;q=0.2,de;q=0.1');
      //  curl_setopt($ch, CURLOPT_AUTOREFERER, true);     
         curl_setopt($ch, CURLOPT_REFERER, 'www.project18.com');  
      //   curl_setopt($ch, CURLOPT_USERAGENT,  'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0');
     //   curl_setopt($ch, CURLOPT_HEADER, true);
     //   curl_setopt($ch,CURLOPT_NOBODY,true);
  //        curl_setopt($ch, CURLOPT_COOKIEJAR, '/cookies.txt');
//curl_setopt($ch, CURLOPT_COOKIEFILE, '/cookies.txt'); 
        curl_setopt($ch,CURLOPT_TIMEOUT,20);      
        $content = curl_exec($ch); 
         if ($content===false)
        {    
           echo "Error=".curl_error($ch);
              return mfView::NONE;
        }
    //    file_put_contents(__DIR__."/google3.html", $content);
        $html = preg_replace('#<noscript(.*?)>(.*?)</noscript>#is', '', $content); 
         $html = preg_replace('#<script(.*?)>(.*?)</script>#is', '', $html); 
          $html = preg_replace('#<style(.*?)>(.*?)</style>#is', '', $html); 
     //    file_put_contents(__DIR__."/google4.html", $html);
        $dom=new DOMDocument(); //'1.0', 'UTF8');
        $dom->loadHTML($html);
      //  var_dump($dom);
      //  var_dump($dom->getElementById("ires")->tagName);
        $finder=new DOMXPath($dom);
      /*  $nodes=$finder->query('//h3[@class="r"]/a'); // title
         echo "<ul>";
        foreach ($nodes as $node)
        {
            echo "<li>---->"; echo $node->nodeValue; "</li>";
            //die(__METHOD__);
        }    
        echo "</ul>";*/
        $nodes=$finder->query('//div[@id="resultStats"]'); // result
        foreach ($nodes as $node)
        {
            echo "<li>---->"; echo preg_replace("/[^0-9]/","",$node->nodeValue);                         
            echo "----> ";
            //die(__METHOD__);
            echo "</li>";
        }  
        
        
    /*     $nodes=$finder->query('//div[@class="kv"]/cite'); //links
     //   var_dump($nodes); 
        
         echo "<ul>";
        foreach ($nodes as $node)
        {
            echo "<li>---->"; echo $node->nodeValue; 
            
            $host=  parse_url("http://".$node->nodeValue,PHP_URL_HOST);
            
            echo "----> ".$host;
            //die(__METHOD__);
            echo "</li>";
        }    
        echo "</ul>"; 
        
       $position=1;
        $nodes=$finder->query('//div[@class="kv"]/cite'); //links                        
        foreach ($nodes as $node)
        {           
            $host=  parse_url("http://".$node->nodeValue,PHP_URL_HOST);
            
          //  echo "Host=".$host."<br/>";
            
            if ($host==$host_to_find)
            {    
                echo "Page=".$loop."Position =".$position."<br>";
                $found=true;
            }  
             $position++;
        } 
         
         
     //  $nodes=$finder->query('//span[@class="st"]');  // Descriptif
     
       
    /*    echo "<ul>";
        foreach ($nodes as $node)
        {
            echo "<li>---->"; echo $node->nodeValue; "</li>";
            //die(__METHOD__);
        }    
        echo "</ul>"; */
       
       
     //   var_dump($nodes);
    //   echo $content;
       
       // var_dump($dom);
       
      // die(__METHOD__);
     //   $header = curl_getinfo($ch); 
    /*        curl_close($ch); 
            $loop=$loop+10;
            if ($loop > 90)
                $stop=true;
            sleep(5);
        }  */ 
     //   if (!$found)
   //         echo "Not found";
       return mfView::NONE;
        
    } 
}

