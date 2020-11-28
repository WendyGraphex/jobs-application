<?php

 class CustomerBlogArticleI18nForm extends CustomerBlogArticleI18nBaseForm {
    
   
     function configure()
    {
        parent::configure();
        $this->setValidator('article_id', new mfValidatorInteger());
    }
}


