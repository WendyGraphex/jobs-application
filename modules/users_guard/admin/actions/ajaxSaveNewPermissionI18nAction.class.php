<?php

require_once __DIR__."/../locales/Forms/PermissionsI18nNewForm.class.php";

class users_guard_ajaxSaveNewPermissionI18nAction extends mfAction {
  
     
     
    function execute(mfWebRequest $request) {      
        $messages = mfMessages::getInstance();                                    
        $this->form = new PermissionsI18nNewForm($this->getUser()->getCountry(),$request->getPostParameter('PermissionsI18n'),array());  
            if ($request->isMethod('POST') && $request->getPostParameter('PermissionsI18n'))
            {    
                $this->form->bind($request->getPostParameter('PermissionsI18n'));
                if ($this->form->isValid()) {
                   $collection=new PermissionCollection(null,'admin');
                   foreach ($this->form->getValue('collection') as $permission)
                   {                     
                       $item=new Permission(null,'admin');                       
                       $collection[$permission['name']]=$item->set('name',$permission['name']);                       
                   }   
                   $collection->save();
                   $collection_i18n=new PermissionI18nCollection();
                   foreach ($this->form->getValue('collection') as $permission)
                   {
                       $item=new PermissionI18n();   
                       $item->add($permission);                      
                       $item->set('permission_id',$collection[$permission['name']]);
                       $collection_i18n[]=$item;    
                   }    
                   $collection_i18n->save();                 
                   $messages->addInfo(__("Permissions have been saved."));
                   $this->forward("users_guard","ajaxListPartialPermission");
                }
                else
                {
                   $messages->addError(__("Form has some errors."));  
                }
            }
    }

}
