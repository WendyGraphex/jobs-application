<?php

class AddProductToCartForm extends mfForm {
    
    protected $item=null;
    
    function configure()
    {
        $this->setValidators(array(
            'id'=>new ObjectExistsValidator('Product',array('key'=>false)),
            'in_at'=>new mfValidatorI18nDate(array('date_format'=>'a')),
            'out_at'=>new mfValidatorI18nDate(array('date_format'=>'a')),
            'quantity'=>new mfValidatorInteger(array('min'=>1)),
            'comments'=>new mfValidatorString(array('required'=>false))
        ));
    }       
    
    function getProduct()
    {
        return $this['id']->getValue();
    }
    
    function getValues()
    {
        $values=parent::getValues();
        $values['product_id']=$this->getProduct();
        $values['supplier_id']=$this->getProduct()->get('supplier_id');
        return $values;
    }
    
    function getCartProduct()
    {
        if ($this->item===null)
        {    
            $this->item=new CartProduct();
            $this->item->add($this->getValues());
            $this->item->setSignature();
        }
        return  $this->item;
    }
}

class cart_ajaxAddProductToCartAction extends mfAction {
    
   function execute(mfWebRequest $request) { 
        $messages = mfMessages::getInstance();   
        try 
        {         
            if ($this->getUser()->isAuthenticated() && !$this->getUser()->isCustomerUser())          
                $this->forwardTo401Action();
            $response = array("action"=>"AddProductToCart");      
            $form =new AddProductToCartForm();
            $form->bind($request->getPostParameter('AddProductToCart'));
            if ($form->isValid())
            {
                 if (!$cart=$this->getUser()->getStorage()->read('cart'))                    
                    $cart = Cart::create($this->getUser(),$request);
                 $cart->addProduct($form->getCartProduct());
                 $cart->getEngine()->process();
                 
                 $response['number_of_items']=$cart->getCartProducts()->count();
                 //var_dump($response['number_of_items']);
            }
            else
            {
               $response['errors']=$form->getErrorSchema()->getErrorsMessage();
            }                        
        } 
        catch (mfException $e) {
            $messages->addError($e);
        }    
        return $messages->hasErrors()?array("error"=>$messages->getDecodedErrors()):$response;
      }
   
}
