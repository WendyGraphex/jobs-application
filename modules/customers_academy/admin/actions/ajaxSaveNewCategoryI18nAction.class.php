<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerCourseCategoryNewForm.class.php";
 
class  customers_academy_ajaxSaveNewCategoryI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();    
         $this->node=new CustomerCourseCategory($request->getPostParameter('CustomerCourseCategory'));
        if ($this->node->isNotLoaded())
            return ;
        $this->form = new CustomerCourseCategoryNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerCourseCategoryI18n'));                    
        try
        {            
            $this->item_i18n=new CustomerCourseCategoryI18n() ; //$this->form->getDefault('category_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerCourseCategoryI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['category_i18n']->getValues());                 
                $this->item_i18n->set('category_id',$this->node->create());                
                $this->item_i18n->getCategory()->add($this->form['category']->getValues());                 
                if ($this->item_i18n->getCategory()->isExist() || $this->item_i18n->isExist())
                    throw new mfException (__("Category already exists"));                                                                                      
                $this->item_i18n->getCategory()->save();
                $this->item_i18n->set('category_id',$this->item_i18n->getCategory());                      
                $this->item_i18n->save(); 
                $messages->addInfo(__('Category has been saved.'));             
                $request->addRequestParameter('node',$this->node);
                $request->addRequestParameter('lang',(string)$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialCategory');
            }   
            else
            {                    
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getCategory()->add($this->form['category']->getValues());
               $this->item_i18n->add($this->form['category_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

