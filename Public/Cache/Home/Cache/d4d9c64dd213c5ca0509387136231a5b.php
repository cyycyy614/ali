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
<link href="../Public/../Alizi/simple/assets/style.css?v=<?php echo (ALIZI_VERSION); ?>" rel="stylesheet" type="text/css" />	<link href="../Public/../Order/css/bellows-theme.css" rel="stylesheet" type="text/css" />	<script type="text/javascript" src="__PUBLIC__/Alizi/seajs/jquery/jquery.min.js"></script><?php if(!empty($aliziConfig["lazyload"])): ?><script type="text/javascript">seajs.use(['jquery/lazyload'], function() {	$(".alizi-detail-content img").lazyload({ placeholder : "__PUBLIC__/Alizi/alizi.gif",effect : "fadeIn",threshold:500})});</script><?php endif; ?><!--[if lt IE 9]><style>.header h1{color:#666;}</style><![endif]--><style>.alizi-foot-nav ul{max-width:<?php echo $template['width']; ?>;padding-left:<?php echo $template['extend']['padding']; ?>;;padding-right:<?php echo $template['extend']['padding']; ?>}</style>

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
<div class="wrapper alizi-detail-wrap" id="aliziTop">		<div class="alizi-page">		<h1 class="alizi-brief"><?php echo ($info["name"]); ?></h1>		<div class="alizi-detail-content">		<?php if(strstr($info['content'],'{[AliziOrder]}')){ $aliziOrder = true; $info['content'] = str_replace('{[AliziOrder]}','',$info['content']); } echo $info['content']; ?>		</div>				<div class="alizi-detail-title">			<div class="alizi-detail-header clearfix">				<?php if(!empty($info["image"])): ?><div class="box-content">						<?php if($info["is_ppt"] == 1): if(!empty($info["pptlist"])): ?><div class="newbanner">									<div class="newflexslider">										<ul class="newslides">											<?php if(is_array($info["pptlist"])): $i = 0; $__LIST__ = $info["pptlist"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a href="javascript:;"><img src="<?php echo (imageurl($vo)); ?>" /></a></li><?php endforeach; endif; else: echo "" ;endif; ?>										</ul>									</div>								</div>								<script type="text/javascript">									seajs.use(['jquery/newflexslider'], function(){ $('.newflexslider').newflexslider({ directionNav: true, pauseOnAction: false });});								</script><?php endif; ?>							<?php else: ?>							<img src="<?php echo (imageurl($info["image"])); ?>" class="image" /><?php endif; ?>					</div><?php endif; ?>				<dl>					<dt class="ellipsis"><?php echo ($info["brief"]); ?></dt>					<dd class="ellipsis"><?php echo ($info["tags"]); ?></dd>				</dl>			</div>		</div>	</div>		
<div class='alizi-remark'><?php echo ($info['remark']); ?></div>
<div class="alizi-footer"><?php echo ($aliziConfig["footer"]); ?></div>
<?php $showNav = (int)$template['extend']['bottom_nav']; if(!empty($showNav)){ if($showNav==1){ $style = "style='width:100%'"; }elseif($showNav==2){ $style = "style='width:49%'"; }else{ $style = '';} $html = '<div class="alizi-foot-nav"><a class="alizi-up" href="#">'.lang('top').'</a><ul>'; for($i=1;$i<=$showNav;$i++){ $nav = explode('||',$template['extend']['bottom_nav_list'][$i]); $class = isset($nav[2])?'icon '.$nav[2]:''; $html .= '<li class="foot-nav-'.$i.'" '.$style.'><a href="'.$nav[1].'"><strong class="'.$class.'">'.$nav[0].'</strong></a></li>'; } echo $html.'</ul></div>'; } ?>
<?php if(isMobile() == false): ?><div id="qrcode"><div class="qrcode"><img src="<?php echo C('ALIZI_ROOT');?>Api/qrcode.php?margin=2&data=http://<?php echo ($_SERVER['HTTP_HOST']); echo (urlencode($_SERVER['REQUEST_URI'])); ?>"><span><?php echo lang('qrcodeAddress');?></span></div></div><?php endif; ?>

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
</script>	<div style="padding-bottom: 10px;border-bottom:1px solid #ddd;fONT-SIZE: 1.2REM;"><center><span>//</span>&nbsp;&nbsp;用戶須知&nbsp;&nbsp;<span>//</span><p></p></center></div>
<!-- 代码 开始 -->
<div style="background:#fff; height:100%;    margin: 0 10px;">
  <div class="bellows single" style="">
    <div class="bellows__item">
      <div class="bellows__header">
        關於我們
      </div>
      <div class="bellows__content-wrapper" aria-hidden="true" style="display: none;"><div class="bellows__content">
        我們是一家以互聯網技術為核心的跨境電子商務公司，專注於跨境出口電商業務，涵蓋12大品類，20餘萬SKU,包括服裝、鞋帽、箱包、數碼、家電、美妝、戶外產品等。
        <br>
        本產品的實際使用效果根據個人情況決定，不保證每位用戶都能享受到所宣傳的效果。若有疑問請諮詢在線客服或通過電子郵箱聯絡我們，本公司享有最終解釋權。
      </div></div>
    </div>

    <div class="bellows__item">
      <div class="bellows__header">
        聯繫我們
      </div>
      <div class="bellows__content-wrapper" aria-hidden="true" style="display: none;"><div class="bellows__content">
        <p style="text-indent: 2em;">我們全天在這為你提供服務，電子郵箱：<a href="<?php echo ($info["email"]); ?>" style="text-decoration:none;outline:0;color:blue;"><?php echo ($info["email"]); ?></a></p>
        <p style="text-indent: 2em;">如果你有任何關於產品的問題，請及時聯絡我們</p>
      </div></div>
    </div>
    <div class="bellows__item">
      <div class="bellows__header">
        關於物流
      </div>
      <div class="bellows__content-wrapper" aria-hidden="true" style="display: none;"><div class="bellows__content">
        <p>·關於發貨方式</p>
        <p style="text-indent: 2em;">由黑貓或者新竹配送（貨到付款）</p>
        <p style="text-indent: 2em;">支持超商取貨，7-11或全家（貨到付款）</p>
        <p style="text-indent: 2em;">黑貓/新竹。以下地區：需加收NT$300運費(澎湖，綠島，金門，連江，小琉球)</p>
        <p style="text-indent: 2em;">超商取貨。以下地區：澎湖，綠島，金門，連江,不提供超商取貨服務</p>
        <p>·關於配送時間</p>
        <p style="text-indent: 2em;"> 配送時間：從訂購日起大約7-10個工作日送達</p>
      </div></div>
    </div>
    <div class="bellows__item">
      <div class="bellows__header">
        關於售後
      </div>
      <div class="bellows__content-wrapper" aria-hidden="true" style="display: none;"><div class="bellows__content">
        <p>·如何申請退換貨</p>
        <p style="text-indent: 2em;">1.由於個人原因產生的退換貨：至收到商品之日起7天內，在不影響二次銷售的情況下向售後服務中心發送郵件，售後客服會在收到郵件後的1-3個工作日內受理您的請求，退換貨所產生的運費需自行承擔。</p>
        <p style="text-indent: 2em;">2.由於質量原因產生的退換貨：至收到商品之日起7天內，向售後服務中心發送郵件至<a href="<?php echo ($info["email"]); ?>" style="text-decoration:none;outline:0;color:blue;"><?php echo ($info["email"]); ?></a>,，客服會在收到郵件後的1-3個工作日內受理 您的請求，退換貨所產生的運費由我方承擔。</p>
        <p>·如何取消訂單</p>
        <p style="text-indent: 2em;">取消訂單需要向售後服務中心發送郵件并注明相关原因，邮件内容应註明您的訂單號、姓名、電話。</p>
        <p style="text-indent: 2em;">收到商品後有任何疑問請聯繫在線客服或發郵件至<a href="<?php echo ($info["email"]); ?>" style="text-decoration:none;outline:0;color:blue;"><?php echo ($info["email"]); ?></a>,同時請告知您的姓名及聯繫方式及訂單編號，我們能快速的給您及時處理唷</p>

      </div></div>
    </div>
    <div class="bellows__item">
      <div class="bellows__header">
        隱私條款
      </div>
      <div class="bellows__content-wrapper" aria-hidden="true" style="display: none;"><div class="bellows__content">
        <p>·我們收集什麼信息？</p>
        <p style="text-indent: 2em;">個人信息是可用於直接或間接識別您身份的信息。個人信息還包括與可用於直接或間接識別您的信息相關聯的匿名信息。個人信息不包括已被不可逆轉地匿名或匯總的信息，因此無論是與其他信息相結合還是其他信息，它都無法使我們識別您的身份。</p>
        <p style="text-indent: 2em;">我們僅收集和使用必要的個人信息，以履行我們的法律義務，並協助我們管理我們的業務並為您提供您所要求的服務。</p>
        <p style="text-indent: 2em;">在我們的網站上訂購時，可能會要求您輸入以下信息：您的姓名，電子郵件地址，郵寄地址和電話號碼您也可以匿名訪問我們的網站。</p>
        <p>·我們將您的信息用於什麼？</p>
        <p style="text-indent: 2em;">我們將您提供給我們的信息用於您提供信息的特定目的，如收集時所述，以及法律允許的其他信息我們從您那裡</p>
        <p>·收集的信息可能會以下列方式使用：</p>
        <p style="text-indent: 2em;">●個性化您的體驗（您的信息有助於我們更好地滿足您的個人需求）</p>
        <p style="text-indent: 2em;">●改善我們的網站和您的購物體驗（我們會根據您收到的信息和反饋不斷努力改進我們的網站產品）</p>
        <p style="text-indent: 2em;">●改善客戶服務（您的信息有助於我們更有效地響應您的客戶服務請求和支持需求）</p>
        <p style="text-indent: 2em;">●處理交易，包括執行付款和交付所購買的產品或服務。管理比賽，特別促銷，調查，活動或其他網站功能</p>
        <p style="text-indent: 2em;">●發送定期電子郵件。除了偶爾接收公司新聞，更新，相關產品或服務信息等之外，您提供的用於訂單處理的電子郵件地址可用於向您發送與您的訂單相關的重要信息和更新。</p>
        <p>·你的權利</p>
        <p style="text-indent: 2em;">我們採取合理措施確保您的個人信息準確，完整和最新。您有權訪問，更正或刪除我們收集的個人信息。您還有權隨時限制或反對進一步處理您的個人信息。您有權以結構化和標準格式接收您的個人信息，並且在技術上可行的情況下，您有權將您的個人信息直接傳送給第三方。您可以向主管數據保護機構提出有關處理您的個人信息的投訴。</p>
        <p style="text-indent: 2em;">為了保護您的個人信息的隱私和安全，我們可能會要求您提供信息，以便我們確認您的身份和訪問此類信息的權利，以及搜索並向您提供我們維護的個人信息。在某些情況下，適用的法律或法規要求允許或要求我們拒絕提供或刪除我們維護的部分或全部個人信息。</p>
        <p style="text-indent: 2em;">您可以發送電子郵件至<a href="<?php echo ($info["email"]); ?>" style="text-decoration:none;outline:0;color:blue;"><?php echo ($info["email"]); ?></a>以行使您的權利。我們將在合理的時間範圍內回复您的請求。我們將採取一切合理措施確保您的個人數據正確且最新。</p>
        <p>·我們如何保護您的信息？</p>
        <p style="text-indent: 2em;">也就是說，我們確實實施了各種安全措施，包括提供安全服務器的使用。所有提供的敏感/信用信息都通過安全套接字層（SSL）技術傳輸，然後加密到我們的支付網關提供商數據庫中，只有獲得此類系統特殊訪問權限的人才能訪問，並且需要對信息保密。</p>
      </div></div>
    </div>
  </div>
  <script src="../Public/../Order/js/velocity.min.js"></script>
  <script src="../Public/../Order/js/bellows.min.js"></script>
  <script>

    $('.bellows').bellows({
      singleItemOpen: true,
      easing: 'ease-in-out',
      duration: 60
    })</script>
  <!-- 代码 结束 -->

  <div style="text-align:center;margin:5px;font-size:74%">
    <img src="../Public/../Order/img/sjbz.png" style="    width: 40px;">
    <p></p>
    <span style="font-size:130%">買家保障</span>
    <p></p>
    如果您未收到商品全額退款！
    <p></p>
    如果您購買的商品與描述不符，全額或部分退款！
    <p></p>
    <img src="../Public/../Order/img/buttom.jpg" width="100%">44
    @2015-2025 . All rights reserved
  </div>
</div>

<script type="text/javascript" src="__PUBLIC__/Alizi/seajs/jquery/jquery.min.js"></script></div><?php if(!empty($template["extend"]["bottom_nav"])): ?><div class="alizi-detail-wrap">	<div class="alizi-footer-nav">		<ul>			<li class="gotop"><a href="#aliziTop">宝贝详情</a></li> 			<li class="booking"><a href="<?php echo U('Order/spu',array('id'=>$info['sn']));?>"><?php echo lang('bookingNow');?></a></li>		</ul>	</div></div><?php endif; ?><?php if(isMobile() == false): ?><div id="qrcode"><div class="qrcode"><img src="<?php echo C('ALIZI_ROOT');?>Api/qrcode.php?margin=2&data=http://<?php echo ($_SERVER['SERVER_NAME']); echo (urlencode($_SERVER['REQUEST_URI'])); ?>"><span><?php echo lang('qrcodeAddress');?></span></div></div><?php endif; ?><div id="aliziUp"></div><script type="text/javascript">seajs.use(['jquery/scrollup'], function(){ $.scrollUp({scrollName: 'aliziUp'}); });</script><?php if(isWeixin()): ?><script type="text/javascript">
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


</body>
</html>