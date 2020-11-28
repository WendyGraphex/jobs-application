<?php

class EmployeeUserGraduateDiplomaI18nFormatter extends mfFormatter
{
    
    function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    
    function getDiploma()
    {
        return new mfString($this->getValue()->get('diploma'));
    }
    
    function getLocation()
    {
        return new mfString($this->getValue()->get('location'));
    }
    
    function getCity()
    {
        return new mfString($this->getValue()->get('city'));
    }
    
    
}
