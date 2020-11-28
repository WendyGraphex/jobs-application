{messages}
{if $item->isLoaded()}
<div class="content-header row">
  <div class="content-header-left col-md-6 col-12 mb-2">
      <h3 class="content-header-title mb-0">{__("Edition du modèle")}</h3>
    </div>
    <div class="content-header-right col-md-6 col-12">
      <div class="media width-250 float-right">
        <div class="media-left media-middle">
          <div id="sp-bar-total-sales"></div>
        </div>
        <div class="media-body media-right text-right">
          <a href="#" id="Save" class="btn btn-primary">
            <i class="fa fa-save"></i> {__('Enregistrer')}
          </a>
          <a href="#" id="Cancel" class="btn btn-primary">
              <i class="fa fa-times"></i> {__('Annuler')}</a>
        </div>
      </div>
    </div>
</div>
<div class="row">
  <div class="col-12">
    <div class="card">
      <div class="card-header">
        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
    </div>
    <div class="card-content collapse show">
        <div class="card-body">
          <div class="row">
            <div class="col-6">
              <div class="form-group">
                  <label>{__("Nom")}{if $form->name->getOption('required')}*{/if}</label>
                  <div> 
                      <div class="error-form">{$form.name->getError()}</div> 
                      <input type="text" class="ProductModel Input form-control" name="name" value="{$item->get('name')|escape}" size="30"/>
                  </div>
              </div>
            </div>
              <div class="col-6">
                  <div class="form-group">
                      <label>{__("Couleur")}{if $form->color->getOption('required')}*{/if}</label>
                      <div>
                          <div class="error-form">{$form.color->getError()}</div>
                          <input type="hidden" class="ProductModel Input Color form-control" name="color" value="{$item->get('color')|escape}"/>
                      </div>
                  </div>
              </div>
          </div>
          <div class="row">            
            <div class="col">
              <div class="form-group">    
                  <label>{__("Contenu")}{if $form->content->getOption('required')}*{/if}</label>
                  <div> 
                      <div class="error-form">{$form.content->getError()}</div> 
                      <textarea cols="" rows="100" class="ProductModel Input form-control" name="content">{$item->get('content')}</textarea>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

    

<script type="text/javascript">

    $(".Color").minicolors();
        $('#Cancel').click(function(){  return $.ajax2({ 
                        url: "{url_to('services_smsbox_ajax',['action'=>'ListPartialModel'])}",
                         target: "#actions" }); 
        });
         
        $(".ProductModel").click(function() { $("#Save").show(); });
                       
        $('#Save').click(function(){ 
              var params= { SmsBoxModel: {
                                    id : '{$item->get('id')}',
                                    token :'{$form->getCSRFToken()}' } };
              $(".ProductModel.Input").each(function() { params.SmsBoxModel[this.name]=$(this).val(); });
          //    console.log(params);
              return  $.ajax2({  data: params,                              
                                url: "{url_to('services_smsbox_ajax',['action'=>'SaveModel'])}",
                                 target: "#actions"
                               }); 
        });  
    
    
</script>

{else}
    {__('Le rapport est invalide.')}
{/if}    