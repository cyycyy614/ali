<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<title><?php if(empty($info["name"])): echo ($aliziConfig["title"]); else: echo ($info["name"]); endif; ?></title>
<meta charset="utf-8" />
<meta content="yes" name="apple-mobile-web-app-capable"/>
<meta content="yes" name="apple-touch-fullscreen"/>
<meta content="telephone=no" name="format-detection"/>
<link rel="dns-prefetch" href="http://<?php echo ($_SERVER['SERVER_NAME']); ?>">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0,minimum-scale=1.0, user-scalable=no" name="viewport">
<meta name="description" content="<?php if(empty($info["brief"])): echo ($aliziConfig["description"]); else: echo ($info["brief"]); endif; ?>">
<meta name="keywords" content="<?php if(!empty($info["tags"])): echo str_replace('#',' ',$info['tags']); endif; ?> <?php echo ($aliziConfig["keywords"]); ?>">
<meta name="author" content="<?php echo lang('author');?>">
<link rel="shortcut icon" href="__PUBLIC__/Assets/img/alizi.ico" />
<link href="__PUBLIC__/Alizi/alizi-order.css?v=<?php echo (ALIZI_VERSION); ?>" rel="stylesheet">
<!--[if lt IE 9]><link href="__PUBLIC__/Alizi/alizi-ie.css?v=<?php echo (ALIZI_VERSION); ?>" rel="stylesheet"><![endif]-->
<script type="text/javascript" src="__PUBLIC__/Alizi/seajs/seajs/sea.js"></script>
<script type="text/javascript">
var aliziHost = "<?php echo ($aliziHost); ?>",aliziRoot = "<?php echo C('ALIZI_ROOT');?>",aliziVersion="<?php echo (ALIZI_VERSION); ?>-<?php echo C('ALIZI_KEY');?>",lang="<?php echo C('DEFAULT_LANG');?>";
seajs.config({ base: '__PUBLIC__/Alizi/seajs/',alias: {'jquery': 'jquery/jquery','alizi': 'alizi/alizi','lang': 'alizi/lang-'+lang}, map: [['.css', '.css?v=' + aliziVersion],['.js', '.js?v=' + aliziVersion]],});
</script>

<style>
*{margin:0;padding:0;}
.rows-head{font-size:20px;margin-bottom:10px;border-bottom:2px solid #aaa;}
.alizi-input-text{height:28px;line-height:28px;font-size:18px;}
.alizi-query-wrap{background:#fff;padding:40px;}
.query_result li{border:1px solid #ccc;}
.query_result p{margin-bottom:0;}
.query_result tr th {padding:5px;background:#7d4707;color:#fff;text-align:left;}
.query_result tr td {padding:5px;}
.query_result h2 {color:#3a1300;font-size:16px;}
.query_result .price {color:#f60;}
.query_result .links {color:#06c;}
.query_form{margin-top:10px;}
.query_form .query_text{float:left;border:2px solid #DDD;border:2px solid #DDD;width:300px;height:36px;line-height:36px;padding:0 10px;outline:none;}
.query_form .query_button{float: left;color: #FFF;display: block;width:120px;height: 40px;background-color: #FF9934;font-size: 16px;border:none;text-align:center;cursor:pointer;transition: all 0.3s linear 0s;}
.query_form .query_button:hover{background-color: #FF6600;}
</style>


<style>
.alizi-detail-wrap{max-width:<?php echo $template['width']; ?>;}
<?php $color = $template['color'];if($color && !in_array(MODULE_NAME,array('Index','Item'))){ ?>
body{background-color:#<?php echo $color['body_bg']; ?>;}
.alizi-detail-content{padding:<?php echo $template['extend']['padding']; ?>;}
.alizi-detail-content h2{border-top-color:#<?php echo $color['body_bg']; ?>;}
.alizi-border,.alizi-side.alizi-full-row{border-color:#<?php echo $color['border']; ?>;}
.alizi-order{color:#<?php echo $color['font'] ?>;background-color:#<?php echo $color['form_bg']; ?>;}
.alizi-detail-header dt{color:#<?php echo $color['font']; ?>;}
.alizi-title{background-color:#<?php echo $color['title_bg']; ?>;}
.alizi-btn,.alizi-btn:hover, .alizi-btn:active,.alizi-badge,.alizi-params.active,.alizi-group-box input:checked + label:after{background-color:#<?php echo $color['button_bg']; ?>;border-color:#<?php echo $color['button_bg']; ?>;}
.alizi-foot-nav{background-color:#<?php echo $color['nav_bg']; ?>}
.alizi-group.alizi-params.alizi-checkbox.active:hover{background-color:#<?php echo $color['button_bg']; ?> !important;border-color:#<?php echo $color['button_bg']; ?> !important;color:#fff !important;}
<?php } ?>
</style>
</head>
<!-- Facebook Pixel Code -->
<script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
        n.callMethod.apply(n,arguments):n.queue.push(arguments)};
        if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
        n.queue=[];t=b.createElement(e);t.async=!0;
        t.src=v;s=b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t,s)}(window, document,'script',
        'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', <?php echo ($info["facebook"]); ?>);
    fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
               src="https://www.facebook.com/tr?id=<?php echo ($info["facebook"]); ?>&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
<body>
<?php if(!empty($aliziConfig["notice"])): ?><div class="aliziAlert"><a class="close" onclick="$('.aliziAlert').slideUp(500);">×</a><?php echo ($aliziConfig["notice"]); ?></div><?php endif; ?>

<div class="alizi-query clearfix">
	<div class="alizi-content">
		<form action="<?php echo U('Order/query');?>" method="post" id="aliziForm">
			<div class="alizi-rows clearfix rows-id-extends">
				<label class="rows-head"><?php echo lang('order_query');?></label>
				<div class="rows-params">
					<input type="tel" name="kw" autocomplete="off" required="required" placeholder="<?php echo lang('mobile_/_order_number');?>" class="alizi-input-text">
				</div>
			</div>
			<div class="alizi-rows alizi-id-btn clearfix">
				<input type="submit" id="alizi-query-btn" class="alizi-btn alizi-submit" value="<?php echo lang('submit_query');?>" />
			</div>
		</form>	
		<div id="alizi-query-result" class="query_result"></div>
	</div>
</div>
<script id="alizi-query" type="text/html">
{{each list as value i}}
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><th><?php echo lang('order_colon');?>{{value.order_no}}</th></tr>
	<tr>
		<td>
			<h2>{{value.title}}</h2>
			{{#value.itemExtends}}
			{{if value.address}}<?php echo lang('delivery_address_colon');?>{{value.address}}{{/if}}
			{{if value.express}}<p><?php echo lang('express_query_colon');?>{{#value.express}}</p>{{/if}}
			<p>
				<?php echo lang('order_status_colon');?>{{value.status}}
				{{if value.order_status=='0' && value.payment!='1' && value.payment!='6'}}
				<a href="<?php echo C('ALIZI_ROOT');?>index.php?m=Order&a=pay&order_no={{value.order_no}}" class="links" target="_blank">[<?php echo lang('pay');?>]</a>
				{{/if}}
			</p>
			<p><?php echo lang('quantity_price_colon');?>{{value.quantity}}/<span class="price">{{value.price}}<?php echo lang('yuan');?></span></p>
			<p><?php echo lang('booking_time_colon');?>{{value.time}}</p>
		</td>
	</tr>
</table>
{{/each}}
</script>
<script type="text/javascript">
seajs.use(['alizi','jquery/form','art/template'],function(alizi,form,template){
	$('#aliziForm').ajaxForm({
		timeout: 50000,
		dataType: 'json',
		error:function(){  layer.closeAll(); alert(lang.ajaxError); },
		beforeSubmit:function(){ layer.closeAll();layer.load(); },
		success:function(data){
			layer.closeAll();
			if(data.status=='1'){
				var html = template('alizi-query', data.data);
				document.getElementById('alizi-query-result').innerHTML = html;
			}else{ 
				layer.msg(data.info);
				document.getElementById('alizi-query-result').innerHTML = "<div class='alizi-rows'>"+data.info+"</div>";
			}
		}
	});
});
function delivery(order,id){
	var url = "<?php echo C('ALIZI_ROOT');?>index.php?m=Index&a=delivery&order="+order+"&id="+id+"&ord=asc&show=json",title="<?php echo lang('shipping_query');?>";
	layer.open({type: 2,shade: .2,shadeClose: true,title: title,area: ['600px', '60%'],content:url}); 
}
</script>


</body>
</html>