<?php

class Pager2 extends Pager {
    
    
    function getKeys()
    {
        return new mfArray(parent::getKeys());
    }
}
