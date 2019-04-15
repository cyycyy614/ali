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

    <link href="../Public/../Alizi/alizi/assets/style.css?v=<?php echo (ALIZI_VERSION); ?>" rel="stylesheet" type="text/css" />
    <?php if(!empty($aliziConfig["lazyload"])): ?><script type="text/javascript">
            seajs.use(['jquery/lazyload'], function() {
                $(".alizi-detail-content img").lazyload({ placeholder : "__PUBLIC__/Alizi/alizi.gif",effect : "fadeIn",threshold:500})
            });
        </script><?php endif; ?>
    <!--[if lt IE 9]>
    <style>.header h1,.footer{color:#666;}</style>
    <![endif]-->


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

    <div class="wrapper alizi-detail-wrap">
        <div class="" data-key="{[AliziOrder]}">
                              <?php $aliziOrder = true; if(strstr($info['content'],'{[AliziOrder]}')){ $aliziOrder = true; $info['content'] = str_replace('{[AliziOrder]}','',$info['content']); } ?>

        </div>

        <?php if(!empty($aliziOrder)): ?><div class="box">
                <div class="box-content">
                    <?php echo W('Order',array_merge($_GET,array('page'=>'single_detail','id'=>$info['sn']),$options));?>
                </div>
            </div><?php endif; ?>

        <?php if(!empty($template["show_comments"])): ?><div class="box">
                <h2 class="title">客户评价</h2>
                <div  class="box-content">
                    <?php $comments = array( '张先生：是真皮的，皮料柔软，穿着舒服。', '薛先生：尺码标准，按平常穿皮鞋尺码选刚刚好。', '高宝国：有头层牛皮的质感，柔软透气，穿起来效果不错！', '陈超盖：价格很实惠，比实体店买的质量还好。', '杨吴用：朋友正好是懂皮的，看过摸过说确实是头层牛皮的，橡胶底质地也不错。', '温骏义：材质不错，是真皮的，有质感，蛮好搭配裤子的，尺码标准皮鞋码，很合脚', '周小姐：给老公买的，呵呵刚好到外地还好赶上了，很好，很满意！', '杨文斌：又是一次快乐的购物，无论大小还是颜色都非常满意，物美价廉。', '李丽：男朋友很喜欢！', );shuffle($comments); ?>
<div id="alizi-comments">
   <ul class="list">
	<?php if(is_array($comments)): $i = 0; $__LIST__ = $comments;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="<?php if($i%2==0): ?>l<?php else: ?>r<?php endif; ?>">
		<div class="text"><?php echo ($vo); ?></div>
		<span class="corner"></span>
		<span class="avatar"></span>
	</li><?php endforeach; endif; else: echo "" ;endif; ?>
	</ul>
</div>	
<script type="text/javascript">
seajs.use(['alizi'],function(alizi){
	alizi.scroll('alizi-comments',3000);
});
</script>
                </div>
            </div><?php endif; ?>
    </div>


    
<div class='alizi-remark'><?php echo ($info['remark']); ?></div>
<div class="alizi-footer"><?php echo ($aliziConfig["footer"]); ?></div>

<script type="text/javascript">
seajs.use(['alizi','jquery/form','lang'],function(alizi){
	window.alizi = alizi;
	alizi.quantity(0);
	var btnSubmit = $('.alizi-submit');
	$('#aliziForm').ajaxForm({
		cache: true,
		timeout: 50000,
		dataType: 'json',
		error:function(){ layer.closeAll(); alert(lang.ajaxError); btnSubmit.attr('disabled',false).val(lang.submit); },
		beforeSubmit:function(){
			if(checkForm('#aliziForm')==false) return false;
			layer.closeAll();layer.load();
			btnSubmit.attr('disabled',true).val(lang.loading);
		},
		success:function(data){
			layer.closeAll();layer.closeAll();
			if(data.status=='1'){
				var redirect = "<?php echo U('Order/pay',array('order_no'=>'__orderNo__'));?>";
				top.window.location.href = redirect.replace('__orderNo__',data.data.order_no);
			}else{
				btnSubmit.attr('disabled',false).val(lang.submit);
				layer.msg(data.info);
			}
		}
	});
});
</script>
    </div>



</body>
</html>