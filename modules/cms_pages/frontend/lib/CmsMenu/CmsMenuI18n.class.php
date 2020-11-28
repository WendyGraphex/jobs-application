<?php

class CmsMenuI18n extends CmsMenuI18nBase {
    
    function isLink()
    {
        return ($this->get('is_link')=='YES');
    }
    
}

