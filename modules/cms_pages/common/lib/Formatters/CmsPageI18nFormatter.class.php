<?php


class CmsPageI18nFormatter extends mfFormatter {
   
   
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
      
    
      function getLanguage()
    {
        return new LanguageFormatter($this->getValue()->get('lang'));
    }
    
   
     function getMetaTitle()
    {
        return new mfString($this->getValue()->get('meta_title'));
    }
    
     function getMetaDescription()
    {
        return new mfString($this->getValue()->get('meta_description'));
    }
    
    function getMetaKeywords() 
    {
        return new mfString($this->getValue()->get('meta_keywords'));
    }
    
      function getIdentity()
    {
        if ($this->getValue()->get('meta_title'))
            $identity=$this->getValue()->get('meta_title');
        elseif ($this->getValue()->getPage()->get('name'))
            $identity=$this->getValue()->getPage()->get('name');
        elseif ($this->getValue()->hasUrl())
            $identity=$this->getValue()->get('url');
        
        return new mfString($identity);
    } 
}
