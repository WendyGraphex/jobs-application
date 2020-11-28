<?php

require_once __DIR__."/../locales/Forms/EmployerSearchQueryForm.class.php";
require_once __DIR__."/../locales/Forms/EmployerSearchFilterParameters.class.php";

class employers_ajaxSearchAdvertAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();                    
        $this->form=new EmployerSearchQueryForm();
        $this->form->bind($request->getPostParameter('Search'));
        if ($this->form->isValid())
        {
            $search = new EmployerSearchFilterParameters($this->form->getValues());             
            $search->in()->setIf($this->form->hasCountry(),'country',$this->form->getCountries()->toArray());
            $search->search()->add(array('city'=>$this->form->getCity(),'title'=>$this->form->getQuery()));            
            $search->getSearches()->push(__('search "%s"',$this->form->getSearch()->implode()));       
            $request->addRequestParameter('search', $search);   
            $this->node_i18n=$this->form->hasCategory()?$this->form->getCategory()->getI18n():null;
            return ;
        }      
        $response=array('errors'=>$this->form->getErrorSchema()->getCodes(),'action'=>'SearchAdvert');
        $this->getController()->setRenderMode(mfView::RENDER_JSON);
        return $messages->hasMessages('error')?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}



