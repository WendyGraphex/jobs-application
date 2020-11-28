<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerAcademyTopicForCategoryI18nNewForm.class.php";

class customers_academy_ajaxSaveNewTopicI18nForCategoryI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->category_i18n=new CustomerCourseCategoryI18n($request->getPostParameter('CustomerCourseCategoryI18n')); 
            if ($this->category_i18n->getCategory()->isNotLoaded())
                return ;
            $this->form= new CustomerAcademyTopicForCategoryI18nNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerAcademyTopicI18n'));             
            $this->item_i18n=new CustomerAcademyTopicI18n();
            $this->form->bind($request->getPostParameter('CustomerAcademyTopicI18n'),$request->getFiles('CustomerAcademyTopicI18n'));
            if ($this->form->isValid())
            {
                $this->item_i18n->getTopic()->add($this->form['topic']->getValues());
                $this->item_i18n->getTopic()->set('category_id',$this->category_i18n->getCategory());
                $this->item_i18n->add($this->form['topic_i18n']->getValues());
                 if ($this->item_i18n->getTopic()->isExist())
                    throw new mfException (__("Name already exists"));   
                if ($this->item_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
                 $this->item_i18n->getTopic()->setIcon($this->form->getIcon());                
                $this->item_i18n->getTopic()->save();                                                                      
                $this->item_i18n->set('topic_id',$this->item_i18n->getTopic());                                                                                                                                                                                  
                $this->item_i18n->save(); 
                $messages->addInfo(__("Academy Topic has been saved."));
                $request->addRequestParameter('lang',$this->item_i18n->get('lang'));
                $request->addRequestParameter('node',$this->category_i18n->getCategory());                
                $this->forward($this->getModuleName(),'ajaxListPartialTopicForCategoryI18n');
            }   
            else
            {               
                //var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->item_i18n->add($this->form['topic_i18n']->getValues());
                $this->item_i18n->getTopic()->add($this->form['topic']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
