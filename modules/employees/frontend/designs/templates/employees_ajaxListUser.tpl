<div class="row">
    <div class="col-md-12 grid-margin">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5">
            <h2>{__('My users')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
            <p class="text-primary mb-0 hover-cursor">{__('My users')}</p>
          </div>
        </div>      
      </div>
    </div>
</div>
<div id="actions">
    {include file="./employees_ajaxListPartialUser.tpl"}
</div>