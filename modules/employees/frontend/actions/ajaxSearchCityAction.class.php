<?php

class EmployeeSearchCityForm extends mfForm {
    
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
class employees_ajaxSearchCityAction extends mfAction {
    
     
    function execute(mfWebRequest $request) {           
      $messages = mfMessages::getInstance();            
        try 
        {       
            $response=array('action'=>'SearchCity' );                   
            $form=new EmployeeSearchCityForm();
            $form->bind($request->getPostParameter('EmployeeSearchLocation'));
            if ($form->isValid())
            {                
                $response['items']=EmployeeAdvertUtils::getSearchCity($form->getSearch())->toArray();
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


