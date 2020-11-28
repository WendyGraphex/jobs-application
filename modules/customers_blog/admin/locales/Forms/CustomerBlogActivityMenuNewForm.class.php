<?php


 class CustomerBlogActivityMenuNewForm extends mfForm {
         
     protected $language=null;
    
    function __construct($language='en',$defaults=array())
    {              
        $this->language=$language;             
        parent::__construct(array_merge(array('menu_i18n'=>array('lang'=>$language)),$defaults));
    }
          
     function getLanguage()
    {          
        if ($this->isValid())
            return $this['menu_i18n']['lang']->getValue(); 
        return new Language($this->defaults['menu_i18n']['lang']);
    }
    
    function configure()
    {       
        $this->embedForm('menu', new CustomerBlogActivityMenuForm($this->getDefault('menu')));
        $this->embedForm('menu_i18n', new CustomerBlogActivityMenuI18nForm($this->getDefault('menu_i18n')));     
        $this->menu->setValidator('activity_id',new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false,'required'=>false,'empty_value'=>null)));
        if ($this->defaults['menu']['name'])
            $this->menu_i18n['title']->setOption('required',false);
        unset($this->menu_i18n['id'],$this->menu['id']);       
    }
       
    
}

