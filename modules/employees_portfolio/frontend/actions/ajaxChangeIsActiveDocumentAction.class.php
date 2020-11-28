<?php

require_once __DIR__."/../locales/Forms/EmployeePortfolioDocumentChangeForm.class.php";

class employees_portfolio_ajaxChangeIsActiveDocumentAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
      try 
        {       
            if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $form=new EmployeePortfolioDocumentChangeForm($this->getUser()->getGuardUser());
            $form->bind($request->getPostParameter('EmployeePortfolioDocument'));
            if (!$form->isValid())            
                throw new mfException(__('Form has some errors'));                
            $form->getDocument()->set('is_active',$form->getToggle())->save();  
            $response=array('action'=>'ChangeIsActiveDocument',   
                            "value" =>$form->getDocument()->get('is_active'),
                            'id'=>$form->getDocument()->get('id'));                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

