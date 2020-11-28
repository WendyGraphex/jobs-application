<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogActivityMenuNewForm.class.php";
 
class  customers_blog_ajaxSaveNewActivityMenuI18nAction extends mfAction {
    
   
        
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();    
         $this->node=new CustomerBlogActivityMenu($request->getPostParameter('CustomerBlogActivityMenu'));
        if ($this->node->isNotLoaded())
            return ;
        $this->form = new CustomerBlogActivityMenuNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerBlogActivityMenuI18n'));                    
        try
        {            
            $this->item_i18n=new CustomerBlogActivityMenuI18n() ; //$this->form->getDefault('menu_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerBlogActivityMenuI18n'));                            
            if ($this->form->isValid())
            {              
                $this->item_i18n->add($this->form['menu_i18n']->getValues());                 
                $this->item_i18n->set('menu_id',$this->node->create());                
                $this->item_i18n->getMenu()->add($this->form['menu']->getValues());                 
                if ($this->item_i18n->getMenu()->isExist())
                    throw new mfException (__("Menu item already exists"));                                                                                      
                $this->item_i18n->getMenu()->save();
                $this->item_i18n->set('menu_id',$this->item_i18n->getMenu());                      
                $this->item_i18n->save(); 
                $messages->addInfo(__('Menu item has been saved.'));             
                $request->addRequestParameter('node',$this->node);
                $request->addRequestParameter('lang',(string)$this->item_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialActivityMenu');
            }   
            else
            {                    
             //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->item_i18n->getMenu()->add($this->form['menu']->getValues());
               $this->item_i18n->add($this->form['menu_i18n']->getValues());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

