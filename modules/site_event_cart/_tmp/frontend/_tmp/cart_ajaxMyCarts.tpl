<div class="row padd-r">
            <div class="col-md-12 mb-3 pt-3 pb-3 bg-color-white">
              <div class="d-flex justify-content-between flex-wrap">
                <div class=" align-items-end pb-2">
                    <div class="d-block mb-3">
                      <h2>{__('My carts')}</h2> 
                   </div>
                   <div class="d-flex">
                      <i class="fa fa-home" style="color: #4d83ff;"></i>
                      <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
                      <p class="text-primary mb-0 hover-cursor">{__('My carts')}</p>
                  </div>
                </div>
              </div>     
           </div>
</div>

<div id="actions">
    {include file="./cart_ajaxListPartialMyCarts.tpl"}
</div>
