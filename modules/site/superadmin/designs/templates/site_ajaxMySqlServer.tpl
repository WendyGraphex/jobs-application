{component name="/dashboard/sublink"} 
{messages class="errors"}
<h3>{__("MySql Server")|capitalize}</h3>
<fieldset>
    <table>
        <tr>
            <td>{__("database server")|capitalize}
            </td>
            <td>           
               <input type="text"  size="48" class="MySql Server" name="host" value=""/>*
            </td>
        </tr>
        <tr>
            <td>{__("login")|capitalize}
            </td>
            <td>
                <input type="text"  size="48" class="MySql Server" name="login" value=""/>
            </td>
        </tr>
        <tr>
            <td>{__("password")|capitalize}
            </td>
            <td>
                <input type="text"  size="48" class="MySql Server" name="password" value=""/>
            </td>
        </tr>
    </table>
</fieldset>
<fieldset>
    <table>
        <tr>
            <td>{__("ping")|capitalize}
            </td>
            <td>           
               <a href="#" id="PingServer"><i class="fa fa-refresh"></i></a>
            </td>
        </tr>
        <tr>
            <td>{__("created database")|capitalize}
            </td>
            <td>
                <input type="text"  size="48" class="MySql" name="database" value=""/>
                <a href="#" id="CreateDatabase"><i class="fa fa-plus"></i></a>
            </td>
        </tr>        
    </table> 
</fieldset>            
<script type="text/javascript">      
    
    $('#PingServer').click(function(){    
           var params= { PingMySql : {  token :'{mfForm::getToken('PingMySqlForm')}' } };       
           $("input.MySql.Server[type=text]").each(function() { params.PingMySql[this.name]=$(this).val(); });        
           return $.ajax2({ data : params,
                            url: "{url_to('site_ajax',['action'=>'PingMySqlServer'])}",
                            success: function (resp)
                                     {
                                         
                                     }
                }); 
         });
         
     $('#CreateDatabase').click(function(){    
           var params= { CreateDatabaseMySql : {  token :'{mfForm::getToken('CreateDatabaseMySqlForm')}' } };       
           $("input.MySql[type=text]").each(function() { params.CreateDatabaseMySql[this.name]=$(this).val(); });        
           return $.ajax2({ data : params,
                            url: "{url_to('site_ajax',['action'=>'CreateDatabaseMySqlServer'])}",
                            success: function (resp)
                                     {
                                         
                                     }
                }); 
         });
    
</script>