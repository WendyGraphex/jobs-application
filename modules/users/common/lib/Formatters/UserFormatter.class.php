<?php


class UserFormatter extends mfFormatter {
    
    
    function getLastname()
    {
        return new mfString($this->getValue()->get('lastname'));
    }
    
    function getFirstname()
    {        
        return new mfString($this->getValue()->get('firstname'));
    }
    
    function getCreatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('created_at'));
    }
    
    function getLastlogin()
    {
        return new DateTimeFormatter($this->getValue()->get('lastlogin'));
    }
    function getUpdatedAt()
    {
        return new DateTimeFormatter($this->getValue()->get('updated_at'));
    }
    function getLastPassword()
    {
        return new DateTimeFormatter($this->getValue()->get('last_password_gen'));
    }
}
