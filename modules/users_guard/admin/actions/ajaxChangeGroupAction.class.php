<?php

class users_guard_ajaxChangeGroupAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
        $messages = mfMessages::getInstance();
        try {
            $group = new mfValidatorInteger();
            $value = new mfValidatorBoolean();
            $group_id = $group->isValid($request->getPostParameter('id'));
            $value = $value->isValid($request->getPostParameter('value')) ? "NO" : "YES";
            $group = new Group($group_id, array('frontend', 'admin'));
            if ($group->isLoaded()) {
                $group->set('is_active', $value);
                $group->save();
                $response = array("action" => "ChangeGroup", "id" => $group_id, "state" => $value);
            }
        } catch (mfException $e) {
            $messages->addError($e);
        }
        return $messages->hasErrors() ? array("error" => $messages->getDecodedErrors()) : $response;
    }
    
    
//    function execute(mfWebRequest $request) {       
//      $messages = mfMessages::getInstance();   
//      try 
//      {         
//          $form= new ChangeForm();
////          $form->bind($request->getPostParameter('value'));
//          if (!$form->isValid())
//               throw new mfException(__('Form has some errors.')) ;
//          $group=new Group($form->getValue('id')) ;
//          if ($group->isNotLoaded())
//              throw new mfException(__('Currency is invalid.')) ;
//          $group->set('is_active',$form->getToggle())->save();          
//             $response = array("action"=>"ChangeGroup",
//                               "id"=>$group->get('id'),
//                               "value" =>$group->get('is_active'));
//          
//      } 
//      catch (mfException $e) {
//          $messages->addError($e);
//      }
//      return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
//    }

}

