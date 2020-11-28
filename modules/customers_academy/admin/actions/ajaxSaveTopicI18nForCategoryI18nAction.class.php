<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyTopicForCategoryI18nViewForm.class.php";
 
class  customers_academy_ajaxSaveTopicI18nForCategoryI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new CustomerAcademyTopicForCategoryI18nViewForm($request->getPostParameter('CustomerAcademyTopicI18n'));                 
        try
        {                        
            $this->item_i18n=new CustomerAcademyTopicI18n($this->form->getDefault('topic_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerAcademyTopicI18n'),$request->getFiles('CustomerAcademyTopicI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form->getValuesForTopicI18n());
                $this->item_i18n->getTopic()->add($this->form->getValuesForTopic());  
                if ($this->item_i18n->getTopic()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Topic already exists"));                 
                $this->item_i18n->getTopic()->setIcon($this->form->getIcon());             
                $this->item_i18n->getTopic()->save();
                $this->item_i18n->save();
                $messages->addInfo(__('Topic has been updated.'));              
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $request->addRequestParameter('node',$this->item_i18n->getTopic()->getCategory());                                           
                $this->forward($this->getModuleName(),'ajaxListPartialTopicForCategoryI18n');
            }   
            else
            {                    
                 var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getTopic()->add($this->form->getValuesForTopic());
               $this->item_i18n->add($this->form->getValuesForTopicI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

