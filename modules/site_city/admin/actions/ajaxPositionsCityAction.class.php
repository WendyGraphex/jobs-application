<?php

require_once dirname(__FILE__)."/../locales/Forms/SiteCityPositionsForm.class.php";

class site_city_ajaxPositionsCityAction extends mfAction {
    
       
    function execute(mfWebRequest $request) {
        $messages = mfMessages::getInstance();     
    
        $this->user=$this->getUser();        
        $this->form=new SiteCityPositionsForm($request->getPostParameter('SiteCityPositions'));
        if (!$request->isMethod('POST') || !$request->getPostParameter('SiteCityPositions'))
            return ;       
        $this->form->bind($request->getPostParameter('SiteCityPositions'));
        if ($this->form->isValid())
        {           
            SiteCity::updatePositions($this->form->getPositions());
            $messages->addInfo(__('Positions have been updated.'));                     
            $this->forward($this->getModuleName(),'ajaxListPartialCity');
        }  
        else 
        {
            //   echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
             $messages->addError(__('Form has some errors.'));      
        }
    }
    
}