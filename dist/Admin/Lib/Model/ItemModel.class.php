<?php  
class ItemModel extends Model {

	protected $_validate = array(
		array('name', 'require', '标题不能为空！',1,'',1),
	);
	protected $_auto = array(
		array('add_time', 'time', 1, 'function'),
		array('update_time', 'time', 2, 'function'),
	);

	function _before_update(&$data,$options){
		$list = $extend = $color = array();
		foreach($_POST['title'] as $k=>$v){
			if(!empty($v)) $list[] = array('title'=>$v,'price'=>$_POST['params_price'][$k],'cnum'=>$_POST['params_cnum'][$k],'image'=>$_POST['params_image'][$k],'qrcode'=>$_POST['params_qrcode'][$k]);
		}
		foreach($_POST['extend_title'] as $k=>$v){
			if(!empty($v)) $extend[] = array('title'=>$v,'value'=>$_POST['extend_value'][$k],'type'=>$_POST['extend_type'][$k]);
		}
		foreach($_POST['color_title'] as $k=>$v){
			if(!empty($v)) $color[] = array('title'=>$v,'value'=>$_POST['color_value'][$k],'type'=>$_POST['color_type'][$k]);
		}

		$data['extends'] = empty($extend)?'':json_encode($extend);
		$data['colors'] = empty($color)?'':json_encode($color);
		$data['payment'] = empty($_POST['payment'])?'':json_encode($_POST['payment']);
		$data['is_hot'] = intval($_POST['is_hot']);
		$data['is_big'] = intval($_POST['is_big']);
		$data['is_auto_send'] = intval($_POST['is_auto_send']);
		$data['qrcode_pay'] = intval($_POST['qrcode_pay']);
		$data['params'] = json_encode($list);
		$data['sms_send'] = json_encode($_POST['sms_send']);
	}
	function _before_insert(&$data,$options){
		$data['sn'] = $data['sn']?$data['sn']:randCode(8,'abcdevghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
		$this->_before_update($data);
	}

	function _after_insert($data,$options){

		$aliziConfig = cache('aliziConfig');
		$tdata = array();
		$options = $aliziConfig['order_options'];
		if($aliziConfig['URL_MODEL']==2){
			$url = "http://".$_SERVER['HTTP_HOST'].C('ALIZI_ROOT')."single/".$data['sn']."-".$data['user_id'].".html";
		}else{
			$url ="http://".$_SERVER['HTTP_HOST'].C('ALIZI_ROOT')."index.php?m=Order&a=spu&id=".$data['sn']."&uid=".$data['user_id']."";
		}
		$extend = array(
			""=>"",
			'padding'=>"0",
			'bottom_nav'=>"2",
			'bottom_nav_list'=>array(
				"",
				"订单查询||http://".$_SERVER['HTTP_HOST'].C('ALIZI_ROOT')."?m=Order&a=query||query",
				"立即下单||".$url."||edit",
				""
			),
		);

		$Model = M('ItemTemplate');
		$tdata = $Model->create();
		$tdata['id'] = $data["id"];
		$tdata['color'] = json_encode(C('DEFAULT_COLOR'));
		$tdata['options'] = $options;
		$tdata['extend'] = serialize($extend);
		$tdata['show_notice'] = "1";
		$tdata['width'] = '750px';
		$tdata['template'] = $aliziConfig['system_template'];
		foreach ($tdata as &$v) { $v=(!get_magic_quotes_gpc())?addslashes($v):$v; }

		$Model->query("REPLACE INTO __TABLE__(`".implode('`,`',array_keys($tdata))."`) VALUES('".implode("','",array_values($tdata))."')");

		cache('ItemTemplate'.$data['id'],$tdata);
	}

	function _after_delete($data,$options){
		$ItemTemplate = M('ItemTemplate');
		$where = array('item_id'=>$data['id']);
		$ItemTemplate->where($where)->delete();
	}
	
	
}
?><?php 