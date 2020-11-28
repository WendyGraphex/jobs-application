<?php

require_once __DIR__."/../locales/Forms/AddUserGroupsForm.class.php";

class users_ajaxAddGroupsSaveAction extends mfAction {
    
    
     function execute(mfWebRequest $request) {   
      $messages = mfMessages::getInstance();  
     
      try 
      {
          $form=new AddUserGroupsForm($request->getPostParameter('Groups'),'admin');
          $form->bind($request->getPostParameter('Groups'));
          if ($form->isValid())
          {
              $user=new User($form->getValue('user_id'),'admin',$this->site);
              if ($user->isLoaded())
              {   
                $userGroups = new UserGroupCollection($form->getValue('groups'));  
                $userGroups->save();
                $messages->addInfo(__("Groups added on user [%s].",(string)$user));
                $request->addRequestParameter('User', $user);
                $this->forward('users','ajaxGroupsList');   
              }  
          }    
          else
          {
            //  var_dump($form->getErrorSchema());
              $messages->addError(__("Form has some errors."));
          }    
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      $this->forward('users','ajaxList');  
    }

}
