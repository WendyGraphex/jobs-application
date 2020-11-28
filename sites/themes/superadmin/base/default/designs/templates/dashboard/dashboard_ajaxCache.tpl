{component name="/dashboard/sublink"}   
{messages class="errors-dashboard-superadmin"}
    <table cellpadding="0" spacepadding="0">
         <tr>
            <td>{__('all cache')}</td>
            <td>
                <a href="#" id="ClearCache"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/></a>
            </td>
        </tr>
        <tr>
            <td>{__('superadmin')}</td>
            <td>
                <a href="#" id="ClearCacheSuperAdmin"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/></a>
            </td>
        </tr>
        <tr>
            <td>{__('host')}</td>
            <td>
                <a href="#" id="ClearHostCache"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/></a>
            </td>
        </tr>
        <tr>
            <td>{__('databases')}</td>
            <td>
                <a href="#" id="Databases"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/></a>
            </td>
        </tr>
        <tr>
            <td>{__('autoload')}</td>
            <td>
               <a href="#" id="Autoload"><img  src="{url('/icons/cache.gif','picture')}" alt="{__('Clear cache')}"/></a> 
            </td>
        </tr>
    </table>
<script type="text/javascript">
{JqueryScriptsReady}

    $('#ClearCacheSuperAdmin').click(function () { 
            return $.ajax2({ loading: "#tab-dashboard-superadmin-loading",
                        target: "#tab-panel-dashboard-superadmin-actions",
                        errorTarget: ".errors-dashboard-superadmin", 
                        url: "{url_to('site_ajax',['action'=>'ClearCacheSuperAdmin'])}"});
    });

    $('#ClearHostCache').click(function () { 
        return $.ajax2({ loading: "#tab-dashboard-superadmin-loading",
                        target: "#tab-panel-dashboard-superadmin-actions",
                        errorTarget: ".errors-dashboard-superadmin", 
                        url: "{url_to('site_ajax',['action'=>'ClearHostCache'])}"});
    });

    $('#ClearCache').click(function () { 
          return $.ajax2({ data: { Host : "ALL" }, 
                        loading: "#tab-dashboard-superadmin-loading",
                        target: "#tab-panel-dashboard-superadmin-actions",
                        errorTarget: ".errors-dashboard-superadmin", 
                        url: "{url_to('site_ajax',['action'=>'ClearCache'])}"});
    });

    $('#Databases').click(function () { 
        return $.ajax2({ loading: "#tab-dashboard-superadmin-loading",
                        target: "#tab-panel-dashboard-superadmin-actions",
                        errorTarget: ".errors-dashboard-superadmin", 
                        url: "{url_to('site_ajax',['action'=>'ClearDatabasesCache'])}"});
    });

     $('#Autoload').click(function () { 
        return $.ajax2({ loading: "#tab-dashboard-superadmin-loading",
                        target: "#tab-panel-dashboard-superadmin-actions",
                        errorTarget: ".errors-dashboard-superadmin", 
                        url: "{url_to('site_ajax',['action'=>'ClearAutoloadCache'])}"});
    });
{/JqueryScriptsReady}
</script>