<?php


class MicrosoftDocxExtractor  {
   
    protected $options=null,$file=null,$output=null;
    function __construct(File $file,File $output=null,File $output_text=null,$options=array())
    {
        $this->file=$file;       
        if ($output===null && $file!=null)      
            $this->output=new File($file->getDirectory()."/docx/output.txt");
        else
        {                
            $this->output=$output;
        }    
        if ($this->output)
            mfFileSystem::mkdirs($this->output->getDirectory());           
       $this->output_text=($output_text===null)?new File($this->getOutput()->getDirectory()."/text.txt"):$output_text;
       if ($this->output_text)
            mfFileSystem::mkdirs($this->output_text->getDirectory());  
       $this->options= new mfArray($options);     
       $this->errors=new mfArray();
    }
    
    function getFile()
    {
        return $this->file;
    }
    
    function getOutput()
    {
        return $this->output;
    }
    
    function getPictures()
    {
        if ($this->pictures===null)
        {
            $this->pictures=new mfArray();
            foreach (glob($this->getOutput()->getDirectory()."/word/media/*") as $img)
                $this->pictures[]=basename($img); 
        }   
        return $this->pictures;
    }
    
    function getDirectoryPictures()
    {
        return $this->getOutput()->getDirectory()."/word/media";
    }
    
    function getTextFile()
    {
        return $this->output_text;
    }
    
    function getText()
    {       
        if ($this->text===null)
        {    
            $this->text="";
            $dom = new DOMDocument( '1.0', 'utf-8' );        
            if ($dom->load( $this->getOutput()->getDirectory()."/word/document.xml")===false)
            {           
                    return false;
            }        
            for($i = 0, $list = $dom->getElementsByTagNameNS( '*', 't' ); $i < $list->length; $i++ )
            {                
                    $this->text.= $list->item($i)->nodeValue;               
            }
            if ($this->getOption('text',false))
            {                                     
                file_put_contents($this->getTextFile()->getFile(), $this->text);
            }    
        }
        return $this->text;
    }
    
    function execute()
    {
        $zip = new ZipArchive();
	$zip_result = $zip->open( $this->getFile()->getFile());
        if ( $zip_result !== true )
            return false;       
        $zip->extractTo($this->getOutput()->getDirectory());
        $zip->close();
        return $this;
    }
    
    function getOption($name,$default=null)
    {
        return isset($this->options[$name])?$this->options[$name]:$default;
    }
}

