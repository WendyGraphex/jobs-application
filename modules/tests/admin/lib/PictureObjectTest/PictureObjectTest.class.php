<?php


class PictureObjectTest extends PictureObject3 {
           
                
    function resize($newwidth, $newheight,$prefix="",$suffix="",$path="")
    {
            switch($this->getExtension())
            {
                default:
                    $function_image_create = "ImageCreateFromJpeg";
                    $function_image_new = "ImageJpeg"; 
                break;
                case "jpg":
                    $function_image_create = "ImageCreateFromJpeg";
                    $function_image_new = "ImageJpeg";                   
                case "jpeg":
                    $function_image_create = "ImageCreateFromJpeg";
                    $function_image_new = "ImageJpeg";                   
                break;
                case "png":
                    $function_image_create = "ImageCreateFromPng";
                    $function_image_new = "ImagePNG";                    
                break;
                case "gif":
                    $function_image_create = "ImageCreateFromGif";
                    $function_image_new = "ImagePNG";                   
                break;
            }                       
            list($width, $height) = getimagesize($this->getFile());                                               
            $newwidth = (int) (($width* $newheight)/$height);
            $thumb = ImageCreateTrueColor($newwidth,$newheight);
            
            imagealphablending($thumb, false);
            imagesavealpha($thumb, true);
                        
            $source = @$function_image_create($this->getFile());  
            
            imagealphablending($source, true);
            imagesavealpha($source, true);

            ImageCopyResized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);  
            if ($path=="")
            {    
                mfFileSystem::mkdirs($this->getPath()."/".$suffix);           
                @$function_image_new($thumb,$this->getPath()."/".$suffix.$this->getName().$prefix.".".$this->getExtension());  
            }
            else
            {
                mfFileSystem::mkdirs($path);           
                @$function_image_new($thumb,$path.$this->getName().".".$this->getExtension());  
            }    
            imagedestroy($source);
           imagedestroy($thumb);
    }
    
     function getFilename()
    {
       return $this->getPath()."/".$this->file;
    }
}

/*
    function resize($newwidth, $newheight,$prefix="")
    {
            switch($this->getExtension())
            {
                default:
                    $function_image_create = "ImageCreateFromJpeg";
                    $function_image_new = "ImageJpeg"; 
                break;
                case "jpg":
                    $function_image_create = "ImageCreateFromJpeg";
                    $function_image_new = "ImageJpeg";                   
                case "jpeg":
                    $function_image_create = "ImageCreateFromJpeg";
                    $function_image_new = "ImageJpeg";                   
                break;
                case "png":
                    $function_image_create = "ImageCreateFromPng";
                    $function_image_new = "ImagePNG";                    
                break;
                case "gif":
                    $function_image_create = "ImageCreateFromGif";
                    $function_image_new = "ImagePNG";                   
                break;
            }                       
             $newwidth = (int) (($width* $newheight)/$height);
            $dest_img = ImageCreateTrueColor($newwidth,$newheight);    
            imagealphablending($dest_img, false);
            imagesavealpha($dest_img, true);
            
            $source = @$function_image_create($this->getFile()); 
            imagealphablending($source, true);
            imagesavealpha($source, true);
          //  imagecopy($dest_img, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);        
          //  $transparent = imagecolorallocatealpha($dest_img, 255, 255, 255, 127); //seting transparent background
          //  imagefilledrectangle($dest_img, 0, 0, $newwidth,$newheight, $transparent);
           //  ImageCopySampled($dest_img, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);          
            ImageCopyResized($dest_img, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);        
            
            var_dump($this->getPath()."/".$this->getName()."_".$prefix.".".$this->getExtension());
            
            @$function_image_new($dest_img,$this->getPath()."/".$this->getName()."_".$prefix.".".$this->getExtension());
    }
    
  */
                

