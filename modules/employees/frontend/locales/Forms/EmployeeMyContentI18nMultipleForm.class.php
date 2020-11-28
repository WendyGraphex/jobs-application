<?php

require_once __DIR__."/EmployeeContentI18nMultipleForm.class.php"; 

class EmployeeMyContentI18nMultipleForm extends mfForm {
        
    protected $user=null;
    
     function __construct(Employee $user,$defaults=array())
    {                                
        $this->user=$user;
        parent::__construct($defaults);
    } 
    
    function getUser()
    {        
        return $this->user;
    }
                   
    function configure() {
          $this->createEmbedFormForEach('contents', 'EmployeeContentI18nMultipleForm', $this->getLanguages()->count());   
           foreach ($this->contents->getFields() as $index)                   
        {                    
            if ($this->getUser()->getContents()->hasItemByKey($index))
               continue ;
            $item= new EmployeeContentI18n();            
            $this->getUser()->getContents()->set($index,$item->add($this->defaults['contents'][$index]));               
        }  
    }         
    
    
     function getLanguages()
    {
        return $this->languages=$this->languages===null?LanguageUtils::getActiveLanguagesFrontendByPosition():$this->languages;
    }
    
    function isValid()
    {
        if (!parent::isValid())
            return false;
         $content=new EmployeeContent($this->getUser());
         $content->save();        
         foreach ($this->contents->getFields() as $index)
         {             
            if ($this->getUser()->getContents()->getItemByKey($index)->isNotLoaded())
                $this->getUser()->getContents()->getItemByKey($index)->set('content_id',$content);          
             $this->getUser()->getContents()->getItemByKey($index)->add($this['contents'][$index]->getValue());     
         }    
        $this->getUser()->getContents()->save();              
        return true;
    }
     
}
