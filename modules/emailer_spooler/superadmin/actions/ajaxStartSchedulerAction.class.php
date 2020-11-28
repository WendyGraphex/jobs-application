<?php


class emailer_spooler_ajaxStartSchedulerAction extends mfAction {
    
    
    function execute(mfWebRequest $request) {      
      $messages = mfMessages::getInstance();
      try 
      {
            $scheduler=new EmailerSpoolerScheduler();
            $scheduler->process();
            $response=array('info'=>__('Scheduler has been processed.'));
      } 
      catch (mfException $e) {
           $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

