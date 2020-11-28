<?php

require_once __DIR__."/EmployerAdvertI18nNewForm.class.php";


class EmployerAdvertI18nMultipleNewForm extends mfForm {
    
    protected $languages=null,$user=null,$advert=null;
    
    function __construct(EmployerUser $user,$defaults = array(), $options = array()) {
        $this->user=$user;
        parent::__construct($defaults, $options);
    }
    
    function getUser()
    {
        return $this->user;
    }
           
    
    function configure() {           
        $this->setValidators(array(
             'id'=>new ObjectExistsValidator('EmployerAdvert',array('key'=>false,'required'=>false)),  
             'budget'=>new mfValidatorI18nNumber(array('min'=>0)),
             'categories'=>new mfValidatorSchemaForEach(new mfValidatorInteger(),count($this->getDefault('categories')),array('required'=>false)),
        ));
        $this->createEmbedFormForEach('adverts', 'EmployerAdvertI18nNewForm', $this->getLanguages()->count());    
        $this->setAdvertsI18nRequired();       
        foreach ($this->adverts->getFields() as $index)                   
        {            
            if ($this->getAdvert()->getAdvertsI18n()->hasItemByKey($index))
               continue ;
            $item= new EmployerAdvertI18n();
            $this->getAdvert()->getAdvertsI18n()->set($index,$item->add($this->defaults['adverts'][$index]));               
        }
        $this->validatorSchema->setPostValidator(new mfValidatorCallback(array('callback' => array($this, 'reorganize'))));              
    }        
    
    function reorganize($validator,$values)
    {
        if ($this->hasErrors())
            return $values;
        foreach ($this->adverts->getFields() as $index)                   
        {             
            if ($this->getAdvert()->getAdvertsI18n()->hasItemByKey($index))
            {
               $this->getAdvert()->getAdvertsI18n()->getItemByKey($index)->add($this['adverts'][$index]->getValues());          
            }
            else
            {    
                $item= new EmployerAdvertI18n();
                $this->getAdvert()->getAdvertsI18n()->set($index,$item->add($this['adverts'][$index]->getValues()));               
            }             
        }    
        $this->getAdvert()->setCategories($this->getCategories());
        return $values;
    }  
           
    function setAdvertsI18nRequired()
    {              
        $this->empties=new mfArray();
        foreach ($this->getDefault('adverts') as $index=>$i18n)
        {         
            $empty=true;
            foreach ($i18n as $name=>$value)
            {                    
                if ($name=='lang') continue;
                if ($value)                                
                   $empty=false;          
            }   
            if ($empty)
              $this->empties[]=$index;                
        }       
        if ($this->empties->count() == $this->getLanguages()->count())
            return $this;        
        foreach ($this->empties as $index)
        {           
             foreach ($this->adverts[$index]->getSchema() as $name=>$field)                     
                 $field->setOption('required',false);                         
        }           
        return $this;
    }
         
    function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }
    
    function getCategories()
    {
        return PartnerWorkCategory::getCategoriesFromSelection($this['categories']->getArray());
    }
  
     function getAdvert()
    {                      
       if ($this->advert===null)
       {    
          $this->advert=new EmployerAdvert($this->getDefault('id')?$this->getDefault('id'):null,$this->getUser());
          $this->advert->add($this->isValid()?$this->getValues():$this->getDefaults());
       }
       return $this->advert;       
    }
}

