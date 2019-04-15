<?php  
defined('THINK_PATH') OR exit();
class IndexAction extends AliziAction {

    public function _initialize(){
        parent::_init();
        parent::systemStatus(MODULE_NAME);
        $this->tpl = '';//'Single/'.ACTION_NAME;
//        $this->tpl = 'Single/'.ACTION_NAME;
        $url = "/index.php?m=Item&a=index";
        $this->redirect($url,array());
    }

    public function index(){
//        $url = $this->aliziHost."index.php?m=Item&&a=index";
//        $this->redirect($url,array());
		$Model = D('Item');
		if($this->aliziConfig['slider_show']==1 && $this->aliziConfig['slider_num']>0){
			$slider  = M('Advert')->where(array('status'=>1))->order('sort_order ASC,id DESC')->limit($this->aliziConfig['slider_num'])->select();
		}
		$this->assign('slider',$slider);
		$this->assign('hot',$Model->hotList());
		$this->display($this->tpl);
    }

    public function order(){
        $url = $this->aliziHost."index.php?m=Item&&a=index";
        $this->redirect($url,array());
      $id = trim($_GET['id']);
      $info = getCache('Item',array('sn'=>$id));
      if(empty($info) || $info['status']==0){  $this->display('Order/404');exit; }
      $this->assign('info',$info);
      $this->display($this->tpl);
    }

    public function article(){
        $url = $this->aliziHost."index.php?m=Item&&a=index";
        $this->redirect($url,array());
      $Model = D('Article');
      $where = array('is_delete'=>0);
      if(isset($_GET['id'])) $where['category_id'] = (int)$_GET['id'];

       import('ORG.Util.Page');
      $count = $Model->where($where)->count();
      $page  = new Page($count,10);
      $list = $Model->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('sort_order ASC,id ASC')->select();
      $category = M('Category')->where('type=2')->order('sort_order ASC,id ASC')->select();

      $this->assign('page',$page->show());
      $this->assign('category',$category);
      $this->assign('list',$list);
      $this->display($this->tpl);
    }
    public function detail(){
        $url = $this->aliziHost."index.php?m=Item&&a=index";
        $this->redirect($url,array());
      $id = (int)$_GET['id'];
      $info = getCache('Article',array('id'=>$id));
      $category = M('Category')->where('type=2')->order('sort_order ASC,id ASC')->select();
      $this->assign('category',$category);
      $this->assign('info',$info);
      $this->display($this->tpl);
    }

    public function category(){
          	$category = M('Category')->where('type=1')->order('sort_order ASC')->select();

          	$Model = D('Item');
		$kw = addslashes(str_replace(' ', '', $_GET['kw']));
		$where = 'status=1 AND is_delete=0';
		if(!empty($_GET['id'])) $where .= " AND category_id=".intval($_GET['id']);
		if(!empty($kw)) $where .= " AND name LIKE '%{$kw}%' ";

            import('ORG.Util.Page');
            $count = $Model->where($where)->count();
            $page  = new Page($count,10);
            $show  = $page->show();
		$list = $Model->field('id,sn,name,original_price,price,image,brief')->where($where)->limit($page->firstRow . ',' . $page->listRows)->order('is_hot desc,sort_order ASC,id DESC')->select();
	       
            $this->assign('page',$page->show());
          	$this->assign('category',$category);
          	$this->assign('list',$list);
		$this->display($this->tpl);
    }
    public function getCategoryList(){
         $Model = D('Item');
         $kw = addslashes(str_replace(' ', '', $_GET['kw']));
         $where = 'status=1 AND is_delete=0';
         if(!empty($_GET['id'])){
             $where .= " AND category_id=".intval($_GET['id']);
         }else{
            $category = M('Category')->field('id')->where('type=1')->select();
            foreach ($category as $cid) { $category_id[] = $cid['id']; }
            $where .= " AND category_id IN(".implode(',', $category_id).")";
         }
         if(!empty($kw)) $where .= " AND name LIKE '%{$kw}%' ";
          $list = $Model->field('id,name,price,image,brief')->where($where)->order('sort_order ASC,id DESC')->select();
          foreach($list as &$li){
             $li['url'] = U('Item/show',array('id'=>$li['id']));
             $li['image'] = imageUrl($li['image']);
          }
          $this->ajaxReturn($list,'success',$list?1:0);
    }

    public function delivery(){
      $aliziConfig = cache('aliziConfig');
      if(IS_POST){
        $url = "http://www.aikuaidi.cn/rest/";
        $data = array(
          'key' => $aliziConfig['delivery_key'],
          'order' => $_POST['order'],
          'id' => $_POST['id'],
          'ord' => 'asc',
          'show' => 'json',
        );
        echo http($url,'GET',$data);
      }else{
        $delivery = C('delivery');
        $name = $delivery[$_GET['id']];
        $this->assign('name',$name);
        $this->display();
      }
    }

    public function query(){
       $this->display();
    }
    public function pay(){
      R('Order/pay');
    }

    public function payWxPayJsApi($order=array()){
         R('Order/payWxPayJsApi',array('order'=>$order));
    }

    public function result(){
        R('Order/result');
    }

}?><?php 