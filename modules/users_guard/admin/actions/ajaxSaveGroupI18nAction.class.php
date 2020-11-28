<?php


 require_once __DIR__."/../locales/Forms/GroupViewForm.class.php";
 
class  users_guard_ajaxSaveGroupI18nAction extends mfAction {

    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new GroupViewForm($request->getPostParameter('GroupI18n'));                    
        try
        {            
            $this->item_i18n=new GroupI18n($this->form->getDefault('group_i18n'));               
            $this->form->bind($request->getPostParameter('GroupI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['group_i18n']->getValues());
                $this->item_i18n->getGroup()->add($this->form['group']->getValues());  
                if ($this->item_i18n->getGroup()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Group already exists"));                                                      
                if ($this->item_i18n->isNotLoaded())                
                {                           
                    $this->item_i18n->set('group_id',$this->item_i18n->getGroup());                                                                                                                                                                 
                }         
                $this->item_i18n->getGroup()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Group has been updated.'));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $this->forward('users_guard','ajaxListPartialGroup');
            }   
            else
            {           
              //  echo "<pre>"; var_dump($this->form->getErrorSchema()->getErrorsMessage()); echo "</pre>";
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getGroup()->add($this->form['group']->getValues());
               $this->item_i18n->add($this->form['group_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

