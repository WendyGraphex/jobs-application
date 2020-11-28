<?php


class tests_bodyAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
      
     // $body="Annulation engagement hors délai [customer] [company]";
      $body="Annulation engagement hors délai {customer} {company} {company}";
        // (\[[^\]]*\])
    /*  preg_match_all("#\{([^\}]*)\}#U", $body,$matches);
      $replacements=array();
      foreach (array_unique($matches[1]) as $var)
          $replacements["{".$var."}"]="{\$".$var."}";
      $body=strtr($body,$replacements);
     //    $body=str_replace("{".$var."}","{\$".$var."}",$body);
      var_dump($body,$replacements);*/
      
      var_dump(mfTools::textWithVariables($body));
       return mfView::NONE;
        
    } 
}

