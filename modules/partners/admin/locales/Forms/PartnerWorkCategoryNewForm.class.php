<?php


 class PartnerWorkCategoryNewForm extends mfForm {
         
     protected $language=null,$node=null,$_category=null;
    
    function __construct(PartnerWorkCategory $node,$language='en',$defaults=array())
    {     
        $this->node=$node;
        $this->language=$language;             
        parent::__construct(array_merge(array('category_i18n'=>array('lang'=>$language)),$defaults));
    }
    
    function getNode()
    {
        return $this->node;
    }
          
     function getLanguage()
    {          
        if ($this->isValid())
            return $this['category_i18n']['lang']->getValue(); 
        return new Language($this->defaults['category_i18n']['lang']);
    }
    
    function configure()
    {       
        $this->embedForm('category', new PartnerWorkCategoryBaseForm($this->getDefault('category')));
        $this->embedForm('category_i18n', new PartnerWorkCategoryI18nBaseForm($this->getDefault('category_i18n')));     
        $this->category_i18n->setValidator('category_id',new ObjectExistsValidator('PartnerWorkCategory',array('key'=>false,'empty_value'=>null,'required'=>false)));
        unset($this->category_i18n['id'],$this->category['id']);       
    }
       
    function hasCategory()
    {
        return (boolean)$this['category_i18n']['category_id']->getValue();
    }
    
    function getCategory()
    {
        if ($this->_category===null)
        {    
            if ($this->isValid())         
                $this->_category= $this->hasCategory()?$this['category_i18n']['category_id']->getValue():$this->getNode()->create();            
            else            
                $this->_category=new PartnerWorkCategory($this->defaults['category_i18n']['category_id']);         
            $this->_category->set('state',null);
        }
        return $this->_category;
    }
}

