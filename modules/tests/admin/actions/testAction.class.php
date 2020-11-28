<?php

// www.project55.net/admin/tests/test

class tests_testAction extends mfAction {
    
   
 
    function execute(mfWebRequest $request) {                                  
       //  $item=new EMployeeWork(27);
         $in=new Day("2020-10-11");
         $out=new Day("2020-10-13");
        
         
       //  var_dump($in->getRank());
         
         
         
         
         $formatter=new DateRangeFormatter($in,$out);
         echo $formatter->toString();
       // var_dump($item->getState()->isInProgress());
       return mfView::NONE;
        
    } 
}

