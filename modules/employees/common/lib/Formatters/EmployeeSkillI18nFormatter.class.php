<?php


class EmployeeSkillI18nFormatter extends mfFormatter {
   
    
    
     function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
   
    function getTitle()
    {
        return new mfString($this->getValue()->get('title'));
    }
    
     function getDescription()
    {
        return new mfString($this->getValue()->get('meta_description'));
    }
    
     function getMetaKeyword()
    {
        return new mfString($this->getValue()->get('meta_keyword'));
    }
    
     function getContent()
    {
        return new mfString($this->getValue()->get('content'));
    }
}
