<?php

class widgetFunctionAlerts extends widgetBase {

    // Create structure for messages even for javascript for component
   protected function renderComponent($parameters=array())
  {
     $messages=$this->context->getComponentStack()->getLastEntry()->getComponentInstance()->getMessage()->getMessages();
     //var_dump($messages);
     $componentName=$this->context->getComponentStack()->getLastEntry()->getComponentName('_');
     $class=isset($parameters['class']) ? $parameters['class']:"component_errors_".$componentName;   
        $id = isset($parameters['id']) ? $parameters['id'] : "errors";            
        $html = '<div id="'.$id.'" class="alert-container '.$class.'">'; 
        foreach (array( 'error'=>'alert-danger', 'warning'=>'alert-warning','info'=>'alert-info') as $type=>$class) {    
            $html_error = "";
            if (isset($messages[$type])) {
                foreach ($messages[$type] as $message)
                {                                        
                    $html_error.= '<span class="' . $type . "_" . $class . '">' . $message->getMessage() . '</span><br/>';
                }    
            }
            $html.= '<div class="alert w-auto '.$class.' '.$type.'" id="' . $type . '" role="alert" style="display:' . ($html_error ? 'block' : 'none') . ';">';              
            $html.= $html_error;
            $html.="</div>";            
        }
        $html.="</div>";       
        return $html;  
  } 
  
  // Create structure for messages even for javascript for module
  protected function  renderModule($parameters=array())
  {
        $error_manager = $this->context->get('errorManager');
        $messages = $error_manager ? $error_manager->getMessages() : array();        
        $class = isset($parameters['class']) ? $parameters['class'] : "errors";
        $id = isset($parameters['id']) ? $parameters['id'] : "errors";            
        $html = '<div id="'.$id.'" class="alert-container '.$class.'">'; 
        foreach (array( 'error'=>'alert-danger', 'warning'=>'alert-warning','info'=>'alert-info') as $type=>$class) {    
            $html_error = "";
            if (isset($messages[$type])) {
                foreach ($messages[$type] as $message)
                {                                        
                    $html_error.= '<span class="' . $type . "_" . $class . '">' . $message->getMessage() . '</span><br/>';
                }    
            }
            $html.= '<div class="alert w-auto '.$class.' '.$type.'" id="' . $type . '" role="alert" style="display:' . ($html_error ? 'block' : 'none') . ';">';              
            $html.= $html_error;
            $html.="</div>";            
        }
        $html.="</div>";       
        return $html;  
  }
  
    function render($parameters,$smarty)
    {     
        if ($this->context->getComponentStack()->getSize())
            return $this->renderComponent($parameters);
        return $this->renderModule($parameters);
        
    }

}
