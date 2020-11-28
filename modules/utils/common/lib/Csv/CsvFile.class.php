<?php


class CsvFile extends File {
    
    function getNumberOfLines()
   {
       $this->options="r";
       $this->open();
       $count=0;
       if ($this->handler)
       {                            
           while (fgetcsv($this->handler,0,$this->getOption('separator',';')) !== false) 
                $count++;           
           return $count;
       }    
   }
}

