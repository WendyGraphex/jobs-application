<?php

class tests_pagerAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
      echo __METHOD__;
        $pager=new AlphabetPager();
      echo "<pre>";  var_dump($pager);echo "</pre>";
        return mfView::NONE;
        
    } 
}