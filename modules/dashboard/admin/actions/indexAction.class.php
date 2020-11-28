<?php
 
     
class dashboard_indexAction extends mfAction {
    
    function preExecute()
    {
        $this->getResponse()->addJavascript('ui/i18n/jquery.ui.datepicker-'.str_replace('_','-',$this->getUser()->getCulture()).'.js');
        $this->getResponse()->addJavascript('i18n/highcharts-'.$this->getUser()->getCountry().'.js',array('module'=>'highcharts'));
    }
    
    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();       
      // echo __METHOD__;
      // var_dump($request->getSite()->getSite());
      //   echo "<pre>"; var_dump($this->getUser()); echo "</pre>"; die(__METHOD__);
    }         	
	
}

