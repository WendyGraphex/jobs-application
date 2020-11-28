{if $model && $model->getI18n()->isLoaded()}
    {eval $model->getI18n()->get('text')}
{else}
    <html>
    <head>
    <meta charset="UTF-8" />
    <style>
        .listUl{
            list-style-type: none;
            padding-left: 0px;
        }
        .listUl li{
            display: inline-block;
        }
    </style>
    </head>
    <body style="width: 90%;margin: 0 auto;">
        <div style="font-family: Helvetica, Arial, sans-serif;">
            <div style="text-align: center;">
                <img style="width: 150px;text-align: center;margin-top: 20px;" src="http://www.project55.net/web/pictures/graphexImage.jpg"/>
            </div>
            <div style="margin-top: 100px;margin-bottom: 50px;">
                <ul class="listUl">
                    <li style="width: 60%;">
                        <label>{__('Invoice to :')} </label>
                        <label>{$employer.firstname} {$employer.lastname}</label>
                    </li>
                    <li>
                        <label>{__('Invoice Number :')} </label>
                        <label>{$order.reference}</label>
                    </li>
                </ul>
                <ul class="listUl">
                    <li style="width: 60%;">
                        <label>{__('Address :')} </label>
                        <label>{$employer.address1}</label>
                    </li>
                    <li>
                        <label>{__('Date:')} </label>
                        <label>{format_date($order.created_at,['d','q'])}</label>
                    </li>
                </ul>
            </div>
            <table border="1" style="width: 100%;border-collapse: collapse;text-align: center;height: 180px;margin-bottom: 50px;">
                <tr>
                    <th>{__('N°:')}</th>
                    <th>{__('Product Description:')}</th>
                    <th>{__('Qty:')}</th>
                    <th>{__('Price:')}</th>
                    <th>{__('Total:')}</th>
                </tr>
                {foreach $order.products as $item} 
                    <tr>
                        <td><span style="color: rgb(3, 161, 74);font-weight: bold;font-size: 20px;">{$item.iteration}</span></td>
                        <td>{$item.quotation.advert_title}</td>
                        <td>{$item.quantity}</td>
                        <td>{$item.sale_price_with_tax}</td>
                        <td>{$item.total_sale_price_with_tax}</td>
                    </tr>
                {/foreach}
            </table>
            <span style="width: 60%;display: inline-block;text-align: center;">
                <label>{__('thank you for tou business')}</label><br/>
                <label>{__('Graphex Technology Team')} !</label>
            </span>
            <span style="display: inline-block;width: 25%;">
                <ul class="listUl">
                    <li style="width: 50%;">{__('Products Total')} :</li>
                    <li>{$order.total}</li>
                </ul>
                <ul class="listUl">
                    <li style="width: 50%;">{__('Commision')} :</li>
                    <li>{$order.commission_with_tax}</li>
                </ul>
                <ul class="listUl">
                    <li style="width: 50%;">{__('Sub Total')} :</li>
                    <li>{$order.global_sale_price_with_tax}</li>
                </ul>
                <ul class="listUl">
                    <li style="width: 50%;">{__('Tax')} :</li>
                    <li>to be defined</li>
                </ul>
            </span>
            <div style="height: 50px;line-height: 50px;background-color: #ead632;color: #222;font-size: 25px;font-weight: bold;margin-top: 50px;">
                <label style="margin-right: 100px;float: right;right: 50px;">{__('Total')} : {$order.general_sale_price_with_tax}</label>
            </div>    
            <div style="margin-top: 50px;position: relative;">
                <div style="width: 40%;display: inline-block;position: absolute;top: 20%;">
                    <h3>{__('Payment info')} :</h3>
                    <div>
                        <div>{__('Your bank name')}: <label>{$order.method.i18n}</label></div>
                    </div>
                </div>
                <div style="width: 30%;display: inline-block;position: absolute;left: 36%;top: 20px;">
                    <div>
                        <div>{__('Company name')}: <label>{$company.name}</label></div>
                    </div>
                </div>
                <div style="width: 28%;display: inline-block;position: absolute;right: 2%;top: -10px;">
                    <img src="http://www.project55.net/admin/web/pictures/sign.png"/>
                </div>
            </div>
        </div>
    </body>
</html>
{/if}    
           
