<?php

require_once dirname(__FILE__)."/../locales/Forms/CustomerBlogArticleNewForm.class.php";

class customers_blog_ajaxSaveNewArticleI18nAction extends mfAction {
    
        
            
    function execute(mfWebRequest $request) {                       
        $messages = mfMessages::getInstance();                                  
        try
        {      
            $this->form= new CustomerBlogArticleNewForm($this->getUser()->getLanguage(),$request->getPostParameter('CustomerBlogArticleI18n'));             
            $this->article_i18n=new CustomerBlogArticleI18n();
            $this->form->bind($request->getPostParameter('CustomerBlogArticleI18n'),$request->getFiles('CustomerBlogArticleI18n'));
            if ($this->form->isValid())
            {                
                $this->article_i18n->add($this->form['article_i18n']->getValues());                 
                $this->article_i18n->set('article_id',$this->form->getArticle());                
                $this->article_i18n->getArticle()->add($this->form->getValuesForArticle());                   
                if ($this->article_i18n->isExist())
                    throw new mfException (__("Title already exists"));                                       
              //  $this->article_i18n->getArticle()->setIcon($this->form->getIcon());                
                $this->article_i18n->getArticle()->setPicture($this->form->getPicture());           
                $this->article_i18n->getArticle()->create();                                                                      
                $this->article_i18n->set('article_id',$this->article_i18n->getArticle());                                                                                                                                                                                  
                $this->article_i18n->save();                              
                
                $messages->addInfo(__("Article has been saved."));
                $request->addRequestParameter('lang',$this->article_i18n->get('lang'));
                $this->forward($this->getModuleName(),'ajaxListPartialArticle');
            }   
            else
            {               
               //  var_dump($this->form->getErrorSchema()->getErrorsMessage());
                // Repopulate
                $this->article_i18n->add($this->form['article_i18n']->getValues());
                $this->article_i18n->getArticle()->add($this->form['article']->getValues());
                $messages->addError(__("Form has some errors.")); 
            }    
        }
        catch (mfException $e)
        {
            $messages->addError($e);
        }    
    }

}
