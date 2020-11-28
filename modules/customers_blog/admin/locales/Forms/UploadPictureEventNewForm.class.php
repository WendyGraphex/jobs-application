<?php

require_once __DIR__."/UploadPictureArticleForm.class.php";

class UploadPictureArticleNewForm extends UploadPictureArticleForm {
    
    protected $article =null;
    
    function configure() {
        parent::configure();
        $this->addValidators(array(            
            'id'=>new ObjectExistsValidator('CustomerBlogArticle',array('key'=>false,'empty_value'=>new CustomerBlogArticle(),'required'=>false)),           
        ));                
    }
    
    
    function hasArticle()
    {
        return (boolean)$this['id']->getValue();
    }
    
    function getArticle()
    {       
        return  $this['id']->getValue();      
    }
}
 