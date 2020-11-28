<?php


 require_once __DIR__."/../locales/Forms/PermissionViewForm.class.php";
 
class  users_guard_ajaxSavePermissionI18nAction extends mfAction {
    
   
    
   
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new PermissionViewForm($request->getPostParameter('PermissionI18n'));                    
        try
        {            
            $this->item_i18n=new PermissionI18n($request->getPostParameter('PermissionI18n'));               
            $this->form->bind($request->getPostParameter('PermissionI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesI18n());
                $this->item_i18n->getPermission()->add($this->form->getValues());  
                if ($this->item_i18n->getPermission()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Permission already exists"));                                                      
                if ($this->item_i18n->isNotLoaded())                
                {                           
                    $this->item_i18n->set('permission_id',$this->item_i18n->getPermission());                                                                                                                                                                 
                }         
                $this->item_i18n->getPermission()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Permission has been saved.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward('users_guard','ajaxListPartialPermission');
            }   
            else
            {           
                echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
               $messages->addError(__('Form has some errors.'));              
             //  $this->item_i18n->getStatus()->add($this->form['status']->getValues());
             //  $this->item_i18n->add($this->form['status_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

