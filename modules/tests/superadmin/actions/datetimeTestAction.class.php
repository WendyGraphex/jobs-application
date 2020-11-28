<?php


class tests_datetimeTestAction extends mfAction {
    
 
    function execute(mfWebRequest $request) {                                  
        echo __METHOD__;
      
     /*   $this->validator = new mfValidatorI18nDateTime(array("date_format"=>"a","scale_minute"=>15,"scale_hour"=>1,"hour_min"=>6,"hour_max"=>23));
        try
        {
            $clean=$this->validator->isValid(array('date'=>'14/12/2014','hour'=>10,'minute'=>45));
        }
        catch (mfValidatorError $e)
        {
            echo (string)$e;
        }
        var_dump($clean);*/
        
        
        $this->calendar=new Calendar(null,array("mode"=>"day","start_day"=>"monday","hours"=>array()));
      //  $days=$calendar->getDays();
        
      //  var_dump($days[1]->getSchedule());
       /* foreach ($calendar->getDays() as $day)
        {
            var_dump($day->getSchedule());
        }    */
     //   return mfView::NONE;
        
    } 
}

