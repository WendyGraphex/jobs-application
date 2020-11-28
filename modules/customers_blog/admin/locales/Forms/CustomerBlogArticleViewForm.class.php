<?php



class CustomerBlogArticleViewForm extends mfForm {
                 
    function configure()
    {
        $this->embedForm('article', new CustomerBlogArticleForm($this->getDefault('article')));
        $this->embedForm('article_i18n', new CustomerBlogArticleI18nForm($this->getDefault('article_i18n')));
        $this->setValidator('activities',new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('activities')),array('required'=>false)));
        unset($this->article_i18n['id'],$this->article['id']);
    }

  /*  function getIcon()
    {
        return $this['article']['icon']->getValue();
    }
    
    function hasIcon()
    {
        return $this['article']['icon']->getValue();
    }*/
    
   function getPicture()
    {
        return $this['article']['picture']->getValue();
    }
    
    function hasPicture()
    {
        return $this['article']['picture']->getValue();
    }
    
    function getValuesForArticle()
    {
        $values= $this['article']->getValue();
         if ($this->hasPicture())
            unset($values['article']['picture']);
     /*    if ($this->hasIcon())
              unset($values['article']['icon']); */
        $values['activities']=$this->getActivities();
        return $values;
    }
    
    function getValuesForArticleI18n()
    {
        return $this['article_i18n']->getValue();      
    }
    
      function getActivities()
    {
        return CustomerBlogActivity::getActivitiesFromSelection($this['activities']->getArray());
    }
    
    //  $this->getAdvert()->setCategories($this->getCategories());
}
