<?php


class EmailerSpoolerCollection extends mfObjectCollection3 {
    
    
     
    function updateEmailStateInProgress()
    {              
        $emails=new mfArray();
        foreach ($this->collection as $item)       
            $emails[]=$item->get('id');  
        EmailerSpooler::updateStateInProgressForEmails($emails);  
        return $this;        
    }
    
    
    function in(EmailerSpooler $email)
    {
        foreach ($this->collection as $item)
        {
            if ($email->get('to')==$item->get('to') && $email->get('from')==$item->get('from'))
                return true;
        }   
        return false;
    }
}

