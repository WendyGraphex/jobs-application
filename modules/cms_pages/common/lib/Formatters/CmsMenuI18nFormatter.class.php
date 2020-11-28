<?php


class CmsMenuI18nFormatter extends mfFormatter {
   
   
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
         
    
}
