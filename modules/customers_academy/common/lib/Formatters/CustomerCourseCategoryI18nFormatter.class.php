<?php


class CustomerCourseCategoryI18nFormatter extends mfFormatter {
   
   
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
    
     function getTitle()
    {
        return new mfString($this->getValue()->get('title'));
    }
    
     function getMetaTitle()
    {
        return new mfString($this->getValue()->get('meta_title'));
    }
    
     function getMetaDescription()
    {
        return new mfString($this->getValue()->get('meta_description'));
    }
        
    
}
