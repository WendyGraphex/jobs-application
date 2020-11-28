<?php

require_once __DIR__."/../locales/Forms/EmployerSearchQueryForm.class.php";
require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

class employers_searchAdvertAction  extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();                            
        $this->form=new EmployerSearchQueryForm();
        $this->form->bind($request->getGetParameters());
        if ($this->form->isValid())
        {
            $search = new EmployerSearchFilterParameters($this->form->getValues());             
            $search->in()->setIf($this->form->hasCountry(),'country',$this->form->getCountries()->toArray());
            $search->search()->add(array('city'=>$this->form->getCity(),'title'=>$this->form->getQuery()));            
            $search->getSearches()->push(__('search "%s"',$this->form->getSearch()->implode()));       
            $request->addRequestParameter('search', $search);   
            $this->node_i18n=$this->form->hasCategory()?$this->form->getCategory()->getI18n():null;                        
        }     
        else
        {
           // var_dump($this->form->getErrorSchema()->getErrorsMessage());
        }    
    }
    
   
}

