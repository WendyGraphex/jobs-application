<?php


 class CustomerBlogActivityNewForm extends mfForm {
         
     protected $language=null,$node=null,$_activity=null;
    
    function __construct(CustomerBlogActivity $node,$language='en',$defaults=array())
    {     
        $this->node=$node;
        $this->language=$language;             
        parent::__construct(array_merge(array('activity_i18n'=>array('lang'=>$language)),$defaults));
    }
    
    function getNode()
    {
        return $this->node;
    }
          
     function getLanguage()
    {          
        if ($this->isValid())
            return $this['activity_i18n']['lang']->getValue(); 
        return new Language($this->defaults['activity_i18n']['lang']);
    }
    
    function configure()
    {       
        $this->embedForm('activity', new CustomerBlogActivityBaseForm($this->getDefault('activity')));
        $this->embedForm('activity_i18n', new CustomerBlogActivityI18nBaseForm($this->getDefault('activity_i18n')));     
        $this->activity_i18n->setValidator('activity_id',new ObjectExistsValidator('CustomerBlogActivity',array('key'=>false,'empty_value'=>null,'required'=>false)));
        unset($this->activity_i18n['id'],$this->activity['id']);       
    }
       
    function hasActivity()
    {
        return (boolean)$this['activity_i18n']['activity_id']->getValue();
    }
    
    function getActivity()
    {
        if ($this->_activity===null)
        {    
            if ($this->isValid())         
                $this->_activity= $this->hasActivity()?$this['activity_i18n']['activity_id']->getValue():$this->getNode()->create();            
            else            
                $this->_activity=new CustomerBlogActivity($this->defaults['activity_i18n']['activity_id']);         
            $this->_activity->set('state',null);
        }
        return $this->_activity;
    }
}

