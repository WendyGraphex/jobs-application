<?php

// http://www.project55.net/module/employee/portfolio/admin/MoveDocument

require_once __DIR__."/../locales/Forms/EmployeePortfolioDocumentMoveForm.class.php";

class employees_portfolio_ajaxMoveDocumentAction extends mfAction
{

    function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();         
      try 
        {       
            if (!$this->getUser()->isAuthenticated() || !$this->getUser()->isEmployee()) 
                $this->forwardTo401Action();
            $form=new EmployeePortfolioDocumentMoveForm($this->getUser()->getGuardUser());
            
            $post=array(
              // 'id'=>30,
                 'id'=>34, 'sibling'=>28,
                'token'=>$form->getCSRFToken()
            );
            
            $form->bind($request->getPostParameter('EmployeePortfolioDocumentMove',$post));
            if (!$form->isValid())    
            {
              // var_dump($form->getErrorSchema()->getErrorsmessage());
                throw new mfException(__('Form has some errors'));                
            } 
            
               $form->getDocument()->moveTo($form->getSibling())
                            ->asPrevSibling()
                            ->save();
             
            $response=array('action'=>'MoveDocument',   
                         //   "value" =>$form->getDocument()->get('is_active'),
                            'id'=>$form->getDocument()->get('id')
                        );                   
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
    }

}

