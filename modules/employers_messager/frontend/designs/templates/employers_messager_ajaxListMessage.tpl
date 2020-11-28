<div class="row RowTop">
    <div class="col-md-12 grid-margin classConducteurTop">
      <div class="d-flex justify-content-between flex-wrap">
        <div class="d-flex align-items-end flex-wrap">
          <div class="mr-md-3 mr-xl-5 styleWidth">
            <h2>{__('My messages')}</h2>                   
          </div>
          <div class="d-flex">
            <i class="mdi mdi-home text-muted hover-cursor"></i>
            <p class="text-muted mb-0 hover-cursor">&nbsp;/&nbsp;{__('Dashboard')}&nbsp;/&nbsp;</p>
            <p class="text-primary mb-0 hover-cursor">{__('My messages')}</p>
          </div>
        </div> 
          {component name="/site_help/help" help="employer-list-message"}
      </div>
    </div>
</div>

<div id="actions">
    {include file="./employers_messager_ajaxListPartialMessage.tpl"}
</div>