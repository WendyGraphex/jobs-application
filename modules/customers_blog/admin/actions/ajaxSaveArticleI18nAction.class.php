<?php


 require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogArticleViewForm.class.php";
 
class  customers_blog_ajaxSaveArticleI18nAction extends mfAction {
    
          
    function execute(mfWebRequest $request) {                    
        $messages = mfMessages::getInstance();     
        $this->form = new CustomerBlogArticleViewForm($request->getPostParameter('CustomerBlogArticleI18n'));                 
        try
        {   
                     
            $this->article_i18n=new CustomerBlogArticleI18n($this->form->getDefault('article_i18n'));               
            $this->form->bind($request->getPostParameter('CustomerBlogArticleI18n'),$request->getFiles('CustomerBlogArticleI18n'));                            
            if ($this->form->isValid())
            {              
                $this->article_i18n->add($this->form->getValuesForArticleI18n());
                $this->article_i18n->getArticle()->add($this->form->getValuesForArticle());  
                 if ($this->article_i18n->isExist())
                    throw new mfException (__("Article already exists"));                 
             //   $this->article_i18n->getArticle()->setIcon($this->form->getIcon());             
                $this->article_i18n->getArticle()->setPicture($this->form->getPicture());        
                $this->article_i18n->getArticle()->save();
                $this->article_i18n->save(); 
                
              //  $this->article_i18n->getArticle()->updateCategories();
                
                $messages->addInfo(__('Article has been saved.'));
                $request->addRequestParameter('lang',$this->article_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialArticle');
            }   
            else
            {                    
              //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
               $messages->addError(__('Form has some errors.'));              
               $this->article_i18n->getArticle()->add($this->form->getValuesForArticle());
               $this->article_i18n->add($this->form->getValuesForArticleI18n());   
            } 
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }
   }

}

