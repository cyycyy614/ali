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
<link href="../Public/../Alizi/alizi/assets/style.css?v=<?php echo (ALIZI_VERSION); ?>" rel="stylesheet" type="text/css" /><?php if(!empty($aliziConfig["lazyload"])): ?><script type="text/javascript">seajs.use(['jquery/lazyload'], function() {	$(".alizi-detail-content img").lazyload({ placeholder : "__PUBLIC__/Alizi/alizi.gif",effect : "fadeIn",threshold:500})});</script><?php endif; ?><!--[if lt IE 9]><style>.header h1,.footer{color:#666;}</style><![endif]-->

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
</head>
<body>
<?php if(!empty($aliziConfig["notice"])): ?><div class="aliziAlert"><a class="close" onclick="$('.aliziAlert').slideUp(500);">×</a><?php echo ($aliziConfig["notice"]); ?></div><?php endif; ?>
<div class="wrapper alizi-detail-wrap">	<div class="header">		<h1><?php echo ($info["name"]); ?>			<?php if(!empty($info["tags"])): $_result=explode('#',$info['tags']);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><span class="alizi-badge"><?php echo ($vo); ?></span><?php endforeach; endif; else: echo "" ;endif; endif; ?>		</h1>	</div>			<div class="alizi-page">		<?php if(!empty($info["image"])): ?><div class="box box-image">			<h2 class="title">商品图片</h2>			<div class="box-content">				<?php if($info["is_ppt"] == 1): if(!empty($info["pptlist"])): ?><div class="newbanner">							<div class="newflexslider">								<ul class="newslides">									<?php if(is_array($info["pptlist"])): $i = 0; $__LIST__ = $info["pptlist"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="javascript:;"><img src="<?php echo (imageurl($vo)); ?>" /></a></li><?php endforeach; endif; else: echo "" ;endif; ?>								</ul>							</div>						</div>						<script type="text/javascript">							seajs.use(['jquery/newflexslider'], function(){ $('.newflexslider').newflexslider({ directionNav: true, pauseOnAction: false });});						</script><?php endif; ?>				<?php else: ?>					<img src="<?php echo (imageurl($info["image"])); ?>" class="image" /><?php endif; ?>			</div>		</div><?php endif; ?>		<div class="box">			<h2 class="title">限时抢购</h2>			<div class="box-content">				<div class="alizi-plug clearfix">					<div class="price" <?php if(empty($info["timer"])): ?>style="width:100%;"<?php endif; ?>>						<span class="symbol"><?php echo lang('symbol');?></span>						<span class="current-price"><?php echo (floatval($info["price"])); ?></span>						<span class="group">							<del class="original-price"><?php echo ($info["original_price"]); echo lang('yuan');?></del>							<span class="salenum"><?php echo ($info["salenum"]); ?> 件已售</span>						</span>					</div>					<?php if(!empty($info["timer"])): ?><div class="timer">						<p class="tt">活动倒计时</p>						<div id="alizi-timer" class="alizi-timer">00天01时00分00秒</div>						<script type="text/javascript">							seajs.use(['alizi'],function(alizi) {								alizi.timer('#alizi-timer', '<?php echo ($info["timer"]); ?>');							})						</script>					</div><?php endif; ?>				</div>								<div class="alizi-content-title">					<h1><?php if($info['is_hot'] == 1){ echo '<span class="alizi-badge">HOT</span>'; } echo ($info["name"]); ?></h1>					<p><?php echo ($info["brief"]); ?></p>				</div>				<div class="baoyou">					<span class="by">顺丰包邮</span>					<span class="huo">货到付款</span>					<span class="tui">七天无理由退款</span>				</div>				<div class="gou"><a href="#aliziOrder">立即抢购</a></div>							</div>		</div>					<div class="box">			<h2 class="title">商品描述</h2>			<div class="box-content alizi-detail-content">				<?php if(!!$info['videoremark']){ echo '<div class="videoShow"><div class="videoTitle">视频展示</div>'.$info['videoremark'].'</div>'; } ?>				<?php if(strstr($info['content'],'{[AliziOrder]}')){ $aliziOrder = true; $info['content'] = str_replace('{[AliziOrder]}','',$info['content']); } echo $info['content']; ?>			</div>		</div>	</div>	</div><?php if(isWeixin()): ?><script type="text/javascript">
seajs.use(['jquery'], function($) {
	$(function(){
	  $('body').delegate('.alizi-btn-share','click',function(){
		wxShare();
	  })
  })
});
function wxShare(){
	window.location.href = "<?php echo U('Order/wx',array('id'=>$info['sn'],'uid'=>$_GET['uid'],'c'=>$_GET['c']));?>";
}
</script><?php endif; ?>
	<div class="alizi-foot-nav">		<a class="alizi-up" href="#"><?php echo lang('top');?></a>		<ul>			<li class="foot-nav-1" style="width:50%"><a href="<?php echo U('Order/spu',array('id'=>$info['sn']));?>"><strong class="icon cart"><?php echo lang('bookingNow');?></strong></a></li>			<li class="foot-nav-2" style="width:50%"><a href="<?php echo U('Item/query');?>"><strong class="icon query"><?php echo lang('order_query');?></strong></a></li>		</ul>	</div>

</body>
</html>