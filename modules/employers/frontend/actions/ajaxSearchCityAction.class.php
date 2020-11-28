<?php

class EmployerSearchCityForm extends mfForm {
    
    function configure() {
        $this->setValidators(array(           
            'search'=>new mfValidatorString(),
        ));
    }
    
    function getSearch()
    {
        return $this['search']->getValue();
    }
}

class employers_ajaxSearchCityAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
        $messages = mfMessages::getInstance();            
        try 
        {       
            $response=array('action'=>'SearchCity' );                   
            $form=new EmployerSearchCityForm();
            $form->bind($request->getPostParameter('EmployerSearchLocation'));
            if ($form->isValid())
            {                
                $response['items']=EmployerAdvertUtils::getSearchCity($form->getSearch())->toArray();
            }
            else
            {             
                $response['errors']=$form->getErrorSchema()->getCodes();
            }    
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }
    
   
}


