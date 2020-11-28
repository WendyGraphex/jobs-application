<?php


class projects_ajaxChangeIsActiveTaskAction extends mfAction {
   
    function execute(mfWebRequest $request) {
       $messages = mfMessages::getInstance();
      
       try 
      {        
                if (!$this->getUser()->isEmployee() && !$this->getUser()->isEmployerUser())             
            $this->forwardTo401Action();
          $form=new ChangeForm();
          $form->bind($request->getPostParameter('ProjectTask'));
          if ($form->isValid())
          {
             $item= new ProjectTask($form->getValue('id'),$this->getUser()->getGuardUser());    
             if ($item->isLoaded())
             {                  
               $value=((string)$form['value']=='YES')?"NO":"YES"; 
                $item->set('is_active',$value);
                $item->save();                
                $response = array("action"=>"ChangeIsActiveTask",
                                  "info"=>__("State has been changed"),
                                  "id"=>$item->get('id'),"state" =>$value);
                
             }
          }                          
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
   }
}


