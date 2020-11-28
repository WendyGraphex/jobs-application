<?php


class CustomerBlogArticleNewForm extends mfForm {
         
    protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {       
        $this->language=$language;        
        parent::__construct(array_merge(array('article_i18n'=>array('lang'=>$this->getLanguage())),$defaults),array());
    }
           
    function getLanguage()
    {
        return $this->language;
    }       
    
    function configure()
    {
        $this->embedForm('article', new CustomerBlogArticleForm($this->getDefault('article')));
        $this->embedForm('article_i18n', new CustomerBlogArticleI18nForm($this->getDefault('article_i18n')));
        $this->setValidator('activities',new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('activities')),array('required'=>false)));
        unset($this->article_i18n['id'],$this->article['id']);
        $this->article_i18n->setValidator('article_id',new ObjectExistsValidator('CustomerBlogArticle',array('key'=>false,'empty_value'=>null,'required'=>false)));
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'check'))));
    }
    
    function check($validator,$values)
    {
        if ($this->getErrorSchema()->hasErrors())
            return $values;
        
        
        
      //  $this->getErrorSchema()->addError(new mfValidatorError($validator,'invalid',__("dddddd.")),'password');          
        return $values;
    }
    
    function getIcon()
    {
        return $this['article']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['article']['icon']->hasValue();
    }
    
    function getPicture()
    {
        return $this['article']['picture']->getValue();
    }
    
    function hasPicture()
    {
        return $this['article']['picture']->hasValue();
    }
    
    function hasArticle()
    {
        return (boolean)$this['article_i18n']['article_id']->getValue();
    }
    
    function getArticle()
    {
        if ($this->_article===null)
        {    
            if ($this->isValid())         
                $this->_article= $this['article_i18n']['article_id']->getValue();            
            else            
                $this->_article=new CustomerBlogArticle($this->defaults['article_i18n']['article_id']);                 
        }
        return $this->_article;
    }
    
     function getActivities()
    {
        return CustomerBlogActivity::getActivitiesFromSelection($this['activities']->getArray());
    }
    
    function getValuesForArticle()
    {
        $values=$this['article']->getValue();
        $values['activities']=$this->getActivities();
        return $values;
    }
}

