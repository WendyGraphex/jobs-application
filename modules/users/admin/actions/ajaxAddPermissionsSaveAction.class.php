<?php

require_once __DIR__."/../locales/Forms/AddPermissionsUserForm.class.php";


class users_ajaxAddPermissionsSaveAction  extends mfAction {
    
  
     function execute(mfWebRequest $request) {   
       $messages = mfMessages::getInstance();                     
       try 
       {
          $form=new AddPermissionsUserForm($request->getPostParameter('permissions'),'admin');          
          $form->bind($request->getPostParameter('permissions'));
          if ($form->isValid())
          {
              $user=new User($form->getValue('user_id'),'admin',$this->site);
              if ($user->isLoaded())
              {   
                $userPermissions = new UserPermissionCollection($form->getValue('permissions'));  
                $userPermissions->save();
                $messages->addInfo(__("Permissions added on user [%s].",(string)$user));
                $request->addRequestParameter('User', $user);
                $this->forward('users','ajaxPermissionsList');   
              }  
          }             
      } 
      catch (mfException $e) {
          $messages->addError($e);
      }
      $this->forward('users','ajaxList');   
    }

}
