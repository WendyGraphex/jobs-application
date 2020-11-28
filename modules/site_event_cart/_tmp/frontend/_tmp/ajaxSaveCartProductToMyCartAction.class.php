<?php
 //require_once __DIR__ . "/../locales/Forms/CartProductViewForm.class.php";


class cart_ajaxSaveCartProductToMyCartAction extends mfAction
{

    function execute(mfWebRequest $request)
    {
              
        $this->item=new CartProduct($request->getPostParameter('CartProduct'));   
        //$this->event = new CartEvent($request->getPostParameter('CartEvent'));
        $this->item->add($request->getPostParameter('CartProduct'));
         //var_dump($this->item->getCart()->getEvent());
       // $this->event=$this->item->getCart()->getEvent();     
        // $this->event->add($request->getPostParameter('CartEvent'));
        // var_dump($this->event);
       // $this->event->save();
        $this->item->save();
        $this->forward('cart','ajaxMyCart');
        
     /*         
        $this->item=new CartProduct($request->getPostParameter('CartProduct'));   
        $this->form = new CartProductViewForm();     
        $this->form->bind($request->getPostParameter('CartProduct'));
        if ($this->form->isValid()) {
            var_dump('hi');
            $this->item->add($this->form->getValues());
            $this->item->save();
            
            $this->forward('cart','ajaxMyCart',$this->item->get('id'));
            
        } else {
                var_dump($this->form->getErrorSchema()->getErrorsMessage());
                
            //$messages->addError(__("Form has some errors."));
            $this->item->add($this->form->getDefaults());
        } */
          
                  

    }

}


