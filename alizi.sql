-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-04-11 18:56:51
-- 服务器版本： 5.5.57-log
-- PHP Version: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alizi`
--

-- --------------------------------------------------------

--
-- 表的结构 `alizi_advert`
--

CREATE TABLE IF NOT EXISTS `alizi_advert` (
  `id` int(11) unsigned NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `target` enum('_blank','_self') NOT NULL,
  `description` mediumtext NOT NULL,
  `sort_order` mediumint(5) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL,
  `type` enum('幻灯片','广告') NOT NULL DEFAULT '幻灯片'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告幻灯片表-alizi.net';

--
-- 转存表中的数据 `alizi_advert`
--

INSERT INTO `alizi_advert` (`id`, `pid`, `name`, `banner`, `image`, `link`, `status`, `target`, `description`, `sort_order`, `create_time`, `type`) VALUES
(1, 0, '云南贡茶', '/201509/56bf544bdb9cd.jpg', '/201509/5607ef1848e42.jpg', 'javascript:;', 1, '_self', '', 0, 1443360670, '幻灯片'),
(2, 0, '台湾美食', '/201509/56bf54a7f3738.jpg', '/201509/5607ef23d8713.jpg', 'javascript:;', 1, '_self', '', 0, 1443360670, '幻灯片');

-- --------------------------------------------------------

--
-- 表的结构 `alizi_alipay_log`
--

CREATE TABLE IF NOT EXISTS `alizi_alipay_log` (
  `id` bigint(20) unsigned NOT NULL,
  `pay_type` tinyint(1) NOT NULL DEFAULT '1',
  `discount` mediumint(5) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `trade_no` varchar(64) NOT NULL,
  `buyer_email` varchar(32) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `notify_type` varchar(50) DEFAULT NULL,
  `quantity` mediumint(5) DEFAULT NULL,
  `out_trade_no` varchar(32) NOT NULL,
  `seller_id` varchar(30) DEFAULT NULL,
  `notify_time` datetime NOT NULL,
  `trade_status` varchar(50) NOT NULL DEFAULT '',
  `is_total_fee_adjust` char(1) DEFAULT NULL,
  `total_fee` decimal(8,2) NOT NULL,
  `gmt_payment` datetime DEFAULT NULL,
  `seller_email` varchar(32) NOT NULL DEFAULT '',
  `price` decimal(10,2) DEFAULT NULL,
  `buyer_id` varchar(30) DEFAULT NULL,
  `notify_id` varchar(32) DEFAULT NULL,
  `use_coupon` char(1) DEFAULT NULL,
  `sign_type` varchar(32) DEFAULT NULL,
  `sign` varchar(50) DEFAULT NULL,
  `body` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付宝支付记录-alizi.net';

-- --------------------------------------------------------

--
-- 表的结构 `alizi_article`
--

CREATE TABLE IF NOT EXISTS `alizi_article` (
  `id` bigint(20) unsigned NOT NULL,
  `category_id` int(12) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `brief` text,
  `tags` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL,
  `add_time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品表-alizi.net';

--
-- 转存表中的数据 `alizi_article`
--

INSERT INTO `alizi_article` (`id`, `category_id`, `name`, `brief`, `tags`, `image`, `status`, `sort_order`, `content`, `is_delete`, `is_frozen`, `update_time`, `add_time`) VALUES
(1, 3, 'PHP订单系统', '1、自适应电脑和手机界面，不必再多此一举区分两个版本。\r\n2、独立后台方便管理，产品可在后台上传修改，订单可导出Excel表。\r\n3、集成多种支付方式：①支付宝即时到账；②微信支付；③个人二维码付款；④货到付款；⑤银行转账。\r\n4、精美的模板，非市面上粗俗烂作的模板与之可比；模板可随意切换且能自定义样式，让您的页面总是与众不同。\r\n5、防刷单防丢单，邮件即时通知。\r\n6、可计算运费，设置推广渠道，物流查询等等……', '', '/201509/56e2dad3193a5.jpg', 1, 0, '<span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">1、自适应电脑和手机界面，不必再多此一举区分两个版本。</span><br />\r\n<span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">2、独立后台方便管理，产品可在后台上传修改，订单可导出Excel表。</span><br />\r\n<span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">3、集成多种支付方式：①支付宝即时到账；②微信支付；③个人二维码付款；</span><span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">④货到付款；⑤银行转账。</span><br />\r\n<span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">4、精美的模板，非市面上粗俗烂作的模板与之可比；</span><span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">模板可随意切换且能自定义样式，让您的页面总是与众不同。</span><br />\r\n<span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">5、防刷单防丢单，邮件即时通知。</span><br />\r\n<span style="font-family:''Microsoft YaHei'', tahoma, Simsun, ''Arial Unicode MS'', Mingliu, Arial, Helvetica;font-size:18px;line-height:2;">6、可计算运费，设置推广渠道，物流查询等等……</span>', 0, 0, 1459237118, 1459236989);

-- --------------------------------------------------------

--
-- 表的结构 `alizi_category`
--

CREATE TABLE IF NOT EXISTS `alizi_category` (
  `id` int(12) unsigned NOT NULL,
  `name` varchar(25) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` mediumint(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='产品分类表-alizi.net';

--
-- 转存表中的数据 `alizi_category`
--

INSERT INTO `alizi_category` (`id`, `name`, `type`, `sort_order`) VALUES
(1, '特产美食', 1, 0),
(2, '精美礼品', 1, 0),
(3, '关于阿狸子', 2, 0),
(4, '服飾', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `alizi_comments`
--

CREATE TABLE IF NOT EXISTS `alizi_comments` (
  `id` bigint(20) NOT NULL,
  `item_id` int(12) NOT NULL,
  `name` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `add_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表-alizi.net';

-- --------------------------------------------------------

--
-- 表的结构 `alizi_item`
--

CREATE TABLE IF NOT EXISTS `alizi_item` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` int(12) unsigned NOT NULL DEFAULT '1',
  `sn` varchar(15) NOT NULL,
  `category_id` int(12) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `brief` varchar(255) NOT NULL DEFAULT '',
  `tags` varchar(100) NOT NULL DEFAULT '',
  `original_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `price` decimal(12,2) NOT NULL COMMENT '价格',
  `salenum` int(12) NOT NULL DEFAULT '0',
  `qrcode_pay` tinyint(1) NOT NULL DEFAULT '0',
  `qrcode_pay_info` text,
  `qrcode` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `is_big` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COMMENT '套餐属性',
  `params_type` enum('radio','select') DEFAULT 'select',
  `options` text,
  `extends` text,
  `content` longtext,
  `payment` varchar(255) DEFAULT '',
  `shipping_id` int(12) NOT NULL DEFAULT '0',
  `remark` text,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0',
  `is_auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `send_content` text,
  `sms_send` text,
  `timer` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL,
  `add_time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='产品表-alizi.net';

--
-- 转存表中的数据 `alizi_item`
--

INSERT INTO `alizi_item` (`id`, `user_id`, `sn`, `category_id`, `name`, `brief`, `tags`, `original_price`, `price`, `salenum`, `qrcode_pay`, `qrcode_pay_info`, `qrcode`, `image`, `thumb`, `status`, `is_hot`, `is_big`, `sort_order`, `params`, `params_type`, `options`, `extends`, `content`, `payment`, `shipping_id`, `remark`, `is_delete`, `is_sent`, `is_auto_send`, `send_content`, `sms_send`, `timer`, `update_time`, `add_time`) VALUES
(2, 1, '2uaXmYzy', 2, '东港杏仁夹心海苔', '台湾风味 香脆可口 小朋友最爱', '纯天然#香脆可口', '0.00', '0.01', 65, 0, '请使用微信扫描二维码进行支付<br>这是说明信息', '/201510/562ce2f947edd.png', '/201509/56080d00b7b11.jpg', '/201509/56080d00b7b11.jpg', 1, 0, 0, 0, '[{"title":"250g\\u5305\\u88c5","price":"10","image":"","qrcode":"\\/201510\\/562ce2f947edd.png"},{"title":"500g\\u5305\\u88c5","price":"20","image":"","qrcode":"\\/201510\\/562ce2f947edd.png"}]', 'radio', '', '[{"title":"\\u5957\\u9910\\u9009\\u62e9","value":"\\u301001\\u3011\\u9177\\u777f\\u9ed1#\\u301002\\u3011\\u72c2\\u91ce\\u6a59#\\u301003\\u3011\\u4f18\\u96c5\\u767d#\\u301004\\u3011\\u9999\\u69df\\u91d1","type":"radio"}]', '<p>\r\n	<img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010135936_37956.jpg" alt=""/><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010135945_51764.jpg" alt=""/><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010135950_61870.jpg" alt=""/> </p><h2>\r\n	订购说明</h2><p>{[AliziOrder]}</p>', '', 0, '', 0, 0, 0, '这是自动发货内容\r\norder.chmzw.com', 'null', 3600, 1464066860, 1443368205),
(3, 1, 'u3aXmYzy', 1, '补气血黑糖玫瑰四物', '台湾进口-调经补血-四物饮', '推荐#满100元免运费', '0.00', '23.00', 9, 0, '', '', '/201509/56080e15a27f3.jpg', '', 1, 0, 0, 0, '[]', 'radio', '', '[{"title":"\\u9009\\u62e9\\u989c\\u8272","value":"\\u7ea2\\u8272#\\u767d\\u8272#\\u7d2b\\u8272","type":"checkbox"}]', '<p>\r\n	<img alt="" src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140114_75095.jpg"/> </p><p>\r\n	<br/></p><p>\r\n	<img alt="" src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140110_73688.jpg"/><img alt="" src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140120_41243.jpg"/> </p><p>\r\n	<span>&nbsp;{[AliziOrder]}</span> </p>', '', 0, '', 0, 0, 1, 'alizi.net\r\n这是自动发货信息\r\n\r\n', 'null', 86500, 1464067026, 1443368471),
(4, 1, '4uaXmYzy', 2, '2015年新货 吐鲁番野生黑桑椹干', '2015新货 特级黑桑葚子 新疆特产', '新疆特产#天然食品', '0.00', '32.00', 0, 0, '', '', '/201509/56081c9aae76b.jpg', '', 1, 0, 0, 0, '[]', 'radio', '', '', '<p>\r\n	<img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140507_52499.jpg" alt=""/><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140516_25149.jpg" alt=""/><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140524_14560.jpg" alt=""/> </p><p>\r\n	&nbsp;{[AliziOrder]}</p>', '', 0, '', 0, 0, 0, '', 'null', 0, 1464067125, 1443372198),
(5, 1, '5uaXmYzy', 2, '和田大马士革玫瑰花', '无任何加工 药用品质', '满100元免运费#25元起售', '0.00', '25.00', 1291, 0, '', '/201510/562ce2f947edd.png', '/201509/56081cbf499f2.jpg', '', 1, 0, 0, 0, '[]', 'radio', '', '[{"title":"\\u5fae\\u4fe1\\u6635\\u79f0","value":"\\u6ce8\\u610f\\u662f\\u3010\\u5fae\\u4fe1\\u6635\\u79f0\\u3011\\u800c\\u4e0d\\u662f\\u5fae\\u4fe1\\u8d26\\u53f7","type":"text"}]', '<p><br/></p><h2>商品描述</h2><p>\r\n	<img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010135602_46221.jpg" alt=""/> </p><p>\r\n	<br/></p><p>\r\n	<img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010135620_39002.jpg" alt=""/> </p><p>\r\n	<br/></p><p>\r\n	<img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010135720_94870.jpg" alt=""/> </p><p><br/></p><h2>在线下单</h2><p>\r\n	{[AliziOrder]}</p>', '', 0, '\r\n<script src="http://hm.baidu.com/hm.js?58d0df5a2df91e0d74f6d2b371edebda"></script>', 0, 0, 0, '自动发货\r\norder.chmzw.com', 'null', 0, 1466670235, 1443372229),
(6, 1, '6uaXmYzy', 1, '阿克苏温185纸皮核桃sms', '2015新货 个大壳薄 无任何添加', '原味生核桃#限时抢购', '0.00', '55.00', 15, 0, '', '', '/201509/56081cda457b4.jpg', '', 1, 0, 0, 0, '[{"title":"\\u9999\\u69df\\u91d1","price":"50","image":"","qrcode":""},{"title":"\\u5496\\u5561\\u8272","price":"100","image":"","qrcode":""}]', 'radio', '', '[{"title":"\\u5c3a\\u7801","value":" S\\/165\\uff08\\u9002\\u5408100\\u65a4-125\\u65a4\\uff09# M\\/170\\uff08\\u9002\\u5408125\\u65a4-140\\u65a4\\uff09# L\\/175\\uff08\\u9002\\u5408140\\u65a4-155\\u65a4\\uff09#XL\\/180\\uff08\\u9002\\u5408155\\u65a4-170\\u65a4\\uff09","type":"checkbox"},{"title":"\\u989c\\u8272","value":"\\u7ea2\\u8272#\\u767d\\u8272#\\u7d2b\\u8272","type":"radio"},{"title":"\\u5f71\\u7247\\u7f16\\u53f7","value":"","type":"text"}]', '<p>\r\n	<span style="color:#333333;font-family:Arial, Helvetica, sans-serif，, 宋体;line-height:25px;background-color:#FFFFFF;">&nbsp;<a href="#aliziOrder" class="alizi-btn">立即下单</a><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140356_49453.jpg" alt=""/><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140409_83321.jpg" alt=""/><img src="http://alizi.5hi.cn/Public/Uploads/201510/20151010140415_33013.jpg" alt=""/></span> </p><p>{[AliziOrder]}</p><p><br/></p>', '', 0, '', 0, 0, 0, '', 'null', 800, 1466832126, 1443372259),
(7, 1, '3k1zdcee', 4, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '', '熱賣！', '1288.00', '481.00', 2147483647, 0, '', '', '/201904/5caa7d58a29b7.jpg', '/201904/5caa7d58a29b7.jpg', 1, 1, 0, 0, '[{"title":"\\u3010\\u5169\\u689d\\/\\u5747\\u8ce3\\uff1aNT$644\\u3011\\u73fe\\u8ce3\\uff1aNT$1288","price":"1288","image":"","qrcode":""},{"title":"\\u3010\\u4e09\\u689d\\/\\u5747\\u8ce3\\uff1aNT$562\\u3011\\u73fe\\u8ce3\\uff1aNT$1688","price":"1688","image":"","qrcode":""},{"title":"\\u3010\\u56db\\u689d\\/\\u5747\\u8ce3\\uff1aNT$522\\u3011\\u73fe\\u8ce3\\uff1aNT$2088","price":"2088","image":"","qrcode":""},{"title":"\\u3010\\u4e94\\u689d\\/\\u5747\\u8ce3\\uff1aNT$497\\u3011\\u73fe\\u8ce3\\uff1aNT$2488","price":"2488","image":"","qrcode":""},{"title":"\\u3010\\u516d\\u689d\\/\\u5747\\u8ce3\\uff1aNT$481\\u3011\\u73fe\\u8ce3\\uff1aNT$2888","price":"2888","image":"","qrcode":""}]', 'radio', NULL, '', '<div class="wttl" style="margin: 0px; padding: 0px; color: rgb(85, 85, 85); font-family: " helvetica="" microsoft="" font-size:="" white-space:=""><h2 style="margin-top: 8px; margin-bottom: 8px; margin-left: -4px; padding: 5px 34px 11px 24px; font-size: 16px; background-image: url(" background-position-x:="" background-size:="" display:="" color:="">商品屬性</h2></div><div class="box-content alizi-detail-content" style="margin: 0px; padding: 0px; overflow: hidden; color: rgb(85, 85, 85); font-family: " helvetica="" microsoft="" font-size:="" white-space:=""><div style="margin: 0px; padding: 0px; text-align: center;" span="" strong="" div=""><span style="margin: 0px; padding: 0px; font-size: 16px; color: rgb(229, 51, 51);"><strong style="margin: 0px; padding: 0px; font-size: 19.2px;">【YPL 瘦身褲第三代】瑜珈款</strong></span></div><div style="margin: 0px; padding: 0px; text-align: center;" span="" strong="" one="" size="" p="" div=""><span style="margin: 0px; padding: 0px; font-size: 16px; color: rgb(229, 51, 51);"><strong style="margin: 0px; padding: 0px; font-size: 19.2px;">美麗的你該擁有第三代“瑜珈款”瘦身褲</strong></span></div><p style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" strong="" img="" src="http://pt.twbkll.com/item_info/image/20190319/20190319131259_32346.jpg" alt="" p=""><span style="margin: 0px; padding: 0px; font-size: 18px; color: rgb(229, 51, 51); background-color: rgb(255, 229, 0);"><strong style="margin: 0px; padding: 0px; font-size: 21.6px;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0); font-family: 微软雅黑; font-size: 18px;">三代全新升级，現價：</span></strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;"><strong style="margin: 0px; padding: 0px; font-size: 16.8px;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0); font-family: 微软雅黑; font-size: 24px;"><span style="margin: 0px; padding: 0px; font-size: 18px;">【兩條/均賣：NT$644】現賣：<span style="text-decoration:underline;margin: 0px; padding: 0px;">NT$1288</span></span></span></strong></p><span style="margin: 0px; padding: 0px; font-size: 16px; color: rgb(229, 51, 51); background-color: rgb(255, 229, 0);"><div style="margin: 0px; padding: 0px; text-align: center;"><strong style="margin: 0px; padding: 0px; font-size: 19.2px;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0); font-family: 微软雅黑; font-size: 24px;"><span style="margin: 0px; padding: 0px; font-size: 18px;">【三條/均賣：NT$562】現賣：<span style="text-decoration:underline;margin: 0px; padding: 0px;">NT$1688</span></span></span></strong></div><strong style="margin: 0px; padding: 0px; font-size: 19.2px;"><div style="margin: 0px; padding: 0px; text-align: center;"><strong style="margin: 0px; padding: 0px; font-size: 23.04px;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0); font-family: 微软雅黑; font-size: 24px;"><span style="margin: 0px; padding: 0px; font-size: 18px;">【四條/均賣：NT$522】現賣：<span style="text-decoration:underline;margin: 0px; padding: 0px;">NT$2088</span></span></span></strong></div><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0); font-family: 微软雅黑; font-size: 24px;"><div style="margin: 0px; padding: 0px; text-align: center;"><strong style="margin: 0px; padding: 0px; font-size: 28.8px;"><span style="margin: 0px; padding: 0px; font-family: 微软雅黑; font-size: 24px;"><span style="margin: 0px; padding: 0px; font-size: 18px;">【五條/均賣：NT$497】現賣：<span style="text-decoration:underline;margin: 0px; padding: 0px;">NT$2488</span></span></span></strong></div><span style="margin: 0px; padding: 0px; font-size: 18px;"><div style="margin: 0px; padding: 0px; text-align: center;"><strong style="margin: 0px; padding: 0px; font-size: 21.6px;"><span style="margin: 0px; padding: 0px; font-family: 微软雅黑; font-size: 24px;"><span style="margin: 0px; padding: 0px; font-size: 18px;"><span style="margin: 0px; padding: 0px; color: rgb(229, 51, 51);">【六條/均賣：NT$481】</span>現賣：<span style="text-decoration:underline;margin: 0px; padding: 0px;">NT$2888<img src="http://pt.twbkll.com/item_info/image/20190319/20190319115425_17684.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319115454_89076.gif" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/></span></span></span></strong></div></span></span></strong></span><strong style="margin: 0px; padding: 0px; font-size: 16.8px;"><span style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" p=""><img src="http://pt.twbkll.com/item_info/image/20190319/20190319140037_52890.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319140038_27410.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319140039_70147.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319140040_27523.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><p style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" br="" p="" helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" text-align:=""><span style="margin: 0px; padding: 0px; font-size: 20px;">YPL燃脂褲以遠紅外燃脂錦綸為面料</span></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" text-align:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" p=""><span style="margin: 0px; padding: 0px; font-size: 20px;">反射回皮膚組織，<span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);">使體內熱能提高</span>，<span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);">進而有效燃燒脂肪</span></span></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" text-align:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" p=""><span style="margin: 0px; padding: 0px; font-size: 18px;"><span style="margin: 0px; padding: 0px; font-family: SimHei; color: rgb(51, 51, 51);">在瘦身燃脂的同時潤養肌膚，增強皮膚彈性</span><strong style="margin: 0px; padding: 0px; font-size: 21.6px;"><span style="margin: 0px; padding: 0px; color: rgb(51, 51, 51);">。</span></strong></span></p><div style="margin: 0px; padding: 0px; text-align: center;"><strong style="margin: 0px; padding: 0px; font-size: 20.16px;"><img src="http://pt.twbkll.com/item_info/image/20181009/20181009104253_33889.gif" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/></strong></div><div style="margin: 0px; padding: 0px;" span="" div=""></div></span><div style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" div="" p=""><img src="http://pt.twbkll.com/item_info/image/20181009/20181009124334_76492.gif" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" text-align:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" p=""><span style="margin: 0px; padding: 0px; font-size: 20px;"><span style="margin: 0px; padding: 0px; color: rgb(255, 0, 0);">釋放瘦身因子，</span></span></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" text-align:="" style="margin: 0px; padding: 0px;" span="" div="" strong="" img="" src="http://obotw.com/item_info/image/20181208/20181208162550_55609.gif" p=""></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" img="" src="http://pt.twbkll.com/item_info/image/20181009/20181009105054_82875.gif" alt="" p=""><span style="margin: 0px; padding: 0px; font-size: 18px;">②</span></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" img="" src="http://pt.twbkll.com/item_info/image/20181009/20181009105056_15811.gif" alt="" p=""><span style="margin: 0px; padding: 0px; font-size: 18px;">③</span></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" img="" src="http://pt.twbkll.com/item_info/image/20181009/20181009105101_58218.gif" alt="" p="" text-align:="" br=""><span style="margin: 0px; padding: 0px; font-size: 24px; background-color: rgb(255, 204, 0);">藝人小嫻大力推薦</span></p><p helvetica="" microsoft="" font-size:="" white-space:="" background-color:="" text-align:="" style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" span="" div="" strong="" b="" img="" src="http://pt.twbkll.com/item_info/image/20181009/20181009095043_15660.gif" alt="" p=""><br style="margin: 0px; padding: 0px;"/></p><p style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em; text-align: center;" br="" p=""><img src="http://uaa.tw/item_info/image/20181009/20181009095003_62575.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><strong style="margin: 0px; padding: 0px;"><img src="http://pt.twbkll.com/item_info/image/20181009/20181009095254_72215.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20181009/20181009095254_92655.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20181009/20181009095256_36619.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/></strong></p><pre class="prettyprint lang-html"><strong style="margin: 0px; padding: 0px;"><video class="lib-video" webkit-playsinline="webkit-playsinline" playsinline="playsinline" poster="http://pt.twbkll.com/Public/Uploads/201903/5c89f33504fda.jpg" src="http://pt.twbkll.com/Public/Uploads/201903/5c89f36d116ad.mp4" width="100%" height="auto" controls="controls" type="video/mp4" style="margin: 0px; padding: 0px;"></video></strong></pre><strong style="margin: 0px; padding: 0px;"><img src="http://pt.twbkll.com/item_info/image/20190314/20190314143738_65299.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/></strong><span style="margin: 0px; padding: 0px; font-size: 24px;">YPL 一代到三代的<span style="margin: 0px; padding: 0px; color: rgb(229, 51, 51);">不斷進化</span>過程</span><p style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em;"><br style="margin: 0px; padding: 0px;"/></p><pre class="prettyprint lang-html"><video class="lib-video" webkit-playsinline="webkit-playsinline" playsinline="playsinline" poster="http://pt.twbkll.com/Public/Uploads/201903/5c89f094089bc.jpg" src="http://pt.twbkll.com/Public/Uploads/201903/5c89f0c617604.mp4" width="100%" height="auto" controls="controls" type="video/mp4" style="margin: 0px; padding: 0px;"></video></pre><img src="http://pt.twbkll.com/item_info/image/20190214/20190214134010_72514.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20181020/20181020113931_50602.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626.023px;"/><img src="http://uaa.tw/item_info/image/20181009/20181009095006_56494.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><p style="margin-top: 0px; margin-bottom: 0px; vertical-align: middle; line-height: 2em;"><br style="margin: 0px; padding: 0px;"/></p><p></p></div></strong><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085423_18017.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085425_96687.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085427_22749.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085429_35298.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085430_73682.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085432_48932.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085433_86140.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085435_69567.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085436_38874.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085438_72965.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085440_97324.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085441_11337.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085442_62072.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085444_54425.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313093411_70877.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319115325_17465.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313093412_39311.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085446_40022.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085447_41225.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085516_40717.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319114848_56321.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319114948_76250.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085517_11483.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085519_86692.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313085520_59188.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313095549_32925.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313095606_17069.gif" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319112148_79337.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319113134_71196.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313095649_10425.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190313/20190313095607_85772.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://uaa.tw/item_info/image/20181009/20181009095351_26883.jpg" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319112038_57109.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/><img src="http://pt.twbkll.com/item_info/image/20190319/20190319135901_18410.jpg" alt="" style="margin: 0px; padding: 0px; max-width: 100%; width: 626px;"/></div><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>{[AliziOrder]}</p>', '', 2, '', 0, 0, 0, '', 'null', 516515, 1554727133, 1554677038);

-- --------------------------------------------------------

--
-- 表的结构 `alizi_item_template`
--

CREATE TABLE IF NOT EXISTS `alizi_item_template` (
  `id` bigint(20) NOT NULL COMMENT '产品id',
  `template` varchar(25) NOT NULL,
  `options` text NOT NULL,
  `width` varchar(20) NOT NULL DEFAULT '1',
  `show_notice` tinyint(1) NOT NULL DEFAULT '0',
  `show_comments` tinyint(1) NOT NULL DEFAULT '0',
  `info` text,
  `color` varchar(255) NOT NULL,
  `redirect_uri` varchar(255) DEFAULT NULL,
  `extend` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品模板表-alizi.net';

--
-- 转存表中的数据 `alizi_item_template`
--

INSERT INTO `alizi_item_template` (`id`, `template`, `options`, `width`, `show_notice`, `show_comments`, `info`, `color`, `redirect_uri`, `extend`) VALUES
(6, 'Alizi/alizi', '["quantity","price","name","mobile","region","address","remark","payment"]', '750px', 0, 0, '', '{"body_bg":"3d000f","form_bg":"FFFFFF","title_bg":"666666","button_bg":"EE3300","font":"333333","border":"666666","nav_bg":"EE3300"}', '', 'a:3:{s:7:"padding";s:1:"0";s:10:"bottom_nav";s:1:"0";s:15:"bottom_nav_list";a:3:{i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";}}'),
(7, 'Alizi/alizi', '["quantity","price","name","mobile","region","address","remark","payment"]', '750px', 0, 0, '', '{"body_bg":"3d000f","form_bg":"FFFFFF","title_bg":"666666","button_bg":"EE3300","font":"333333","border":"666666","nav_bg":"EE3300"}', '', 'a:3:{s:7:"padding";s:1:"0";s:10:"bottom_nav";s:1:"0";s:15:"bottom_nav_list";a:3:{i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";}}');

-- --------------------------------------------------------

--
-- 表的结构 `alizi_order`
--

CREATE TABLE IF NOT EXISTS `alizi_order` (
  `id` bigint(20) unsigned NOT NULL,
  `user_id` int(12) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `order_no` varchar(25) NOT NULL,
  `channel_id` varchar(20) NOT NULL DEFAULT '',
  `item_id` int(12) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_params` varchar(255) NOT NULL,
  `item_extends` varchar(255) NOT NULL DEFAULT '',
  `item_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `order_price` decimal(12,2) NOT NULL,
  `shipping_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `quantity` mediumint(5) NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '',
  `region` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(50) NOT NULL,
  `zcode` varchar(10) NOT NULL DEFAULT '',
  `qq` varchar(20) NOT NULL,
  `mail` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(100) NOT NULL,
  `payment` tinyint(1) NOT NULL DEFAULT '1',
  `payment_num` varchar(20) NOT NULL,
  `delivery_name` varchar(20) NOT NULL,
  `delivery_no` varchar(25) NOT NULL,
  `device` tinyint(1) NOT NULL DEFAULT '1',
  `add_ip` varchar(15) NOT NULL DEFAULT '',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_sent` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `referer` varchar(255) DEFAULT NULL,
  `add_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='产品订单表-alizi.net';

--
-- 转存表中的数据 `alizi_order`
--

INSERT INTO `alizi_order` (`id`, `user_id`, `status`, `order_no`, `channel_id`, `item_id`, `item_name`, `item_params`, `item_extends`, `item_price`, `order_price`, `shipping_price`, `total_price`, `quantity`, `datetime`, `name`, `mobile`, `phone`, `region`, `address`, `zcode`, `qq`, `mail`, `remark`, `payment`, `payment_num`, `delivery_name`, `delivery_no`, `device`, `add_ip`, `is_delete`, `is_sent`, `url`, `referer`, `add_time`, `update_time`) VALUES
(1, 0, 0, '190408470328', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【兩條/均賣：NT$644】現賣：NT$1288', 'null', '481.00', '1288.00', '0.00', '1288.00', 1, '0000-00-00 00:00:00', 'adsg', '13485858585', '', '台北市 100 中正區', 'adsgasdgdsag', '', '', '', '', 7, '', '', '', 1, '117.26.243.54', 0, 0, 'http://4insport.com/index.php?m=Index&a=order&id=3k1zdcee', 'http://4insport.com/', 1554732868, 0),
(2, 0, 0, '190409266618', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【兩條/均賣：NT$644】現賣：NT$1288', 'null', '481.00', '1288.00', '0.00', '1288.00', 1, '0000-00-00 00:00:00', 'asdgasdg', '13489184908', '', '台北市 100 中正區', 'adsgasdgasdg', '', '', '', '', 7, '', '', '', 1, '117.26.243.54', 0, 0, 'http://4insport.com/index.php?m=Item&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Item&a=index', 1554754152, 0),
(3, 0, 0, '190409592524', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【兩條/均賣：NT$644】現賣：NT$1288', 'null', '481.00', '1288.00', '0.00', '1288.00', 1, '0000-00-00 00:00:00', 'sdgadg', '13489562548', '', '台北市 100 中正區', 'abfasfbsdfb', '', '', '', '', 1, '', '', '', 1, '117.26.243.54', 0, 0, 'http://4insport.com/index.php?m=Item&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Order&a=pay&order_no=190409266618', 1554754173, 0),
(4, 0, 0, '190409560113', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【兩條/均賣：NT$644】現賣：NT$1288', 'null', '481.00', '1288.00', '0.00', '1288.00', 1, '0000-00-00 00:00:00', 'asdgasdg', '13488888888', '', '台北市 100 中正區', 'adsgadsg', '', '', '', '', 1, '', '', '', 1, '117.26.243.54', 0, 0, 'http://4insport.com/index.php?m=Item&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Order&a=pay&order_no=190409592524', 1554796636, 0),
(5, 0, 0, '190409486184', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【兩條/均賣：NT$644】現賣：NT$1288', 'null', '481.00', '1288.00', '0.00', '1288.00', 1, '0000-00-00 00:00:00', '123131 123123', '0213123', '', '台北市 100 中正區', '123123', '', '', '', '', 1, '', '', '', 1, '27.159.200.115', 0, 0, 'http://4insport.com/index.php?m=Index&a=order&id=3k1zdcee', 'http://4insport.com/', 1554802553, 0),
(6, 0, 0, '190409625594', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【兩條/均賣：NT$644】現賣：NT$1288', 'null', '481.00', '1288.00', '0.00', '1288.00', 1, '0000-00-00 00:00:00', '123131 123123', '0213123', '', '台北市 100 中正區', '123123', '', '', '', '', 1, '', '', '', 1, '27.159.200.115', 0, 0, 'http://4insport.com/index.php?m=Index&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Order&a=pay&order_no=190409486184', 1554804047, 0),
(7, 0, 0, '190409173594', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【六條/均賣：NT$481】現賣：NT$2888', 'null', '481.00', '519840000.00', '0.00', '519840000.00', 180000, '0000-00-00 00:00:00', '123131 123123', '0213123', '', '台北市 100 中正區', '123123', '', '', '', '', 1, '', '', '', 1, '27.159.200.115', 0, 0, 'http://4insport.com/index.php?m=Index&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Order&a=pay&order_no=190409625594', 1554804075, 0),
(8, 0, 0, '190409778090', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【六條/均賣：NT$481】現賣：NT$2888', 'null', '481.00', '288797112.00', '0.00', '288797112.00', 99999, '0000-00-00 00:00:00', '123131 123123', '0213123', '', '台北市 100 中正區', '123123', '', '', '', '', 1, '', '', '', 1, '27.159.200.115', 0, 0, 'http://4insport.com/index.php?m=Index&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Order&a=pay&order_no=190409173594', 1554804099, 0),
(9, 0, 0, '190409437506', '', 7, '【官方站】“澳洲第一神褲 YPL” 第三代 上市啦 !!! 一穿即瘦4CM 科學塑型沒難題！', '【六條/均賣：NT$481】現賣：NT$2888', 'null', '481.00', '9999999999.99', '0.00', '9999999999.99', 8388607, '0000-00-00 00:00:00', '123131 123123', '0213123', '', '台北市 100 中正區', '123123', '', '', '', '', 1, '', '', '', 1, '27.159.200.115', 0, 0, 'http://4insport.com/index.php?m=Index&a=order&id=3k1zdcee', 'http://4insport.com/index.php?m=Order&a=pay&order_no=190409778090', 1554804121, 0);

-- --------------------------------------------------------

--
-- 表的结构 `alizi_order_log`
--

CREATE TABLE IF NOT EXISTS `alizi_order_log` (
  `id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `user_id` int(12) NOT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='产品订单记录表-alizi.net';

--
-- 转存表中的数据 `alizi_order_log`
--

INSERT INTO `alizi_order_log` (`id`, `order_id`, `status`, `add_time`, `user_id`, `remark`) VALUES
(1, 1, 0, 1554732868, 0, ''),
(2, 2, 0, 1554754152, 0, ''),
(3, 3, 0, 1554754173, 0, ''),
(4, 4, 0, 1554796636, 0, ''),
(5, 5, 0, 1554802553, 0, ''),
(6, 6, 0, 1554804047, 0, ''),
(7, 7, 0, 1554804075, 0, ''),
(8, 8, 0, 1554804099, 0, ''),
(9, 9, 0, 1554804121, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `alizi_setting`
--

CREATE TABLE IF NOT EXISTS `alizi_setting` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品系统设置表-alizi.net';

--
-- 转存表中的数据 `alizi_setting`
--

INSERT INTO `alizi_setting` (`name`, `value`) VALUES
('title', 'PHP订单管理系统'),
('keywords', 'PHP订单管理系统'),
('logo_pc', ''),
('logo', ''),
('description', 'PHP订单管理系统'),
('footer', 'Copyright © 2016 <a href="http://order.chmzw.com"  target="_blank">order.chmzw.com</a> All Rights Reserved'),
('contact_tel', '13800000000'),
('contact_qq', ''),
('system_status', '1'),
('system_close_info', 'http://order.chmzw.com'),
('URL_MODEL', '0'),
('theme_color', 'ED145B'),
('system_template', 'thin'),
('order_options', '["price","quantity","payment","name","mobile","region","address","remark"]'),
('show_notice', '0'),
('record_order', '0'),
('repeat_order', '1'),
('slider_show', '1'),
('slider_num', '5'),
('item_hot_show', '1'),
('item_hot_num', '8'),
('item_category_show', '1'),
('item_category_num', '6'),
('item_category_id', '1,2'),
('show_header', '1'),
('show_bottom_nav', '1'),
('payment_global', '1'),
('payOnDelivery_status', '1'),
('payOnDelivery_fee', '0'),
('payOnDelivery_info', '选择货到付款，安全放心'),
('bankpay_status', '0'),
('bankpay_discount', '0'),
('bankpay_info', '请联系在线客服获取银行账号'),
('alipay_status', '0'),
('alipay_type', '["1","2","3"]'),
('alipay_mail', ''),
('alipay_pid', 'admin'),
('alipay_key', '123456'),
('alipay_discount', '1'),
('alipay_discount_info', '支付宝万岁'),
('wxpay_status', '0'),
('wxpay_appid', 'wxd4c21c6036a8844b'),
('wxpay_mchid', '1286703301'),
('wxpay_key', '7686861380843208f9ca8552ab2d1044'),
('wxpay_secret', 'ad84f25864bb7c489230df778016ca77'),
('wxpay_type', '["1"]'),
('wxpay_discount', '1'),
('wxpay_discount_info', '使用微信支付'),
('mail_send', '0'),
('mail_proxy', '0'),
('mail_send_status', '["0","1","3"]'),
('mail_smtp', 'smtp.163.com'),
('mail_port', '25'),
('mail_account', ''),
('mail_password', ''),
('mail_to', 'admin@alizi.net'),
('mail_title', '[AliziStatus]：[AliziTitle]'),
('sms_send', '0'),
('sms_admin', '0'),
('sms_admin_mobile', ''),
('sms_account', ''),
('sms_password', ''),
('weixin_status', '0'),
('weixin_appid', ''),
('weixin_appsecret', ''),
('weixin_token', ''),
('weixin_encodingaeskey', ''),
('safe_mobile_limit', '20'),
('safe_order_interval', '20'),
('safe_ip_limit', '50'),
('delivery_setting', '["disifang"]'),
('payOnseven_status', '1'),
('payOnseven_fee', '0'),
('payOnseven_info', '选择货到付款，安全放心'),
('payOnquanjia_status', '1'),
('payOnquanjia_fee', '0'),
('payOnquanjia_info', '选择货到付款，安全放心'),
('lazyload', '0');

-- --------------------------------------------------------

--
-- 表的结构 `alizi_shipping`
--

CREATE TABLE IF NOT EXISTS `alizi_shipping` (
  `id` int(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `less_num` tinyint(4) NOT NULL DEFAULT '1',
  `less_num_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `step_num` tinyint(3) NOT NULL DEFAULT '1',
  `step_num_cost` decimal(10,2) NOT NULL DEFAULT '1.00',
  `is_free_num` tinyint(1) NOT NULL DEFAULT '0',
  `is_free_cost` tinyint(1) NOT NULL DEFAULT '0',
  `free_num` mediumint(5) NOT NULL DEFAULT '0',
  `free_cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `update_time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='运费模板-alizi.net';

--
-- 转存表中的数据 `alizi_shipping`
--

INSERT INTO `alizi_shipping` (`id`, `name`, `less_num`, `less_num_cost`, `step_num`, `step_num_cost`, `is_free_num`, `is_free_cost`, `free_num`, `free_cost`, `update_time`) VALUES
(1, '满100免运费', 2, '10.00', 1, '2.00', 1, 1, 50, '100.00', 1455506416),
(2, '黑猫', 1, '0.00', 1, '0.00', 1, 0, 1, '0.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `alizi_user`
--

CREATE TABLE IF NOT EXISTS `alizi_user` (
  `id` int(11) unsigned NOT NULL,
  `pid` int(12) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `password` char(32) NOT NULL,
  `role` enum('admin','member') NOT NULL DEFAULT 'admin',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL,
  `qq` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `info` mediumtext NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `login_ip` char(16) NOT NULL,
  `login_time` datetime NOT NULL,
  `create_time` int(10) NOT NULL,
  `update_time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品用户表-alizi.net';

--
-- 转存表中的数据 `alizi_user`
--

INSERT INTO `alizi_user` (`id`, `pid`, `username`, `password`, `role`, `status`, `realname`, `mobile`, `qq`, `email`, `info`, `is_delete`, `login_ip`, `login_time`, `create_time`, `update_time`) VALUES
(1, 0, 'admin', '85dcf91c51b058b4fda7e73b37f4fd85', 'admin', 1, '', '', '', '', '', 0, '154.46.204.123', '2019-04-11 14:22:07', 1554657021, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alizi_advert`
--
ALTER TABLE `alizi_advert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_alipay_log`
--
ALTER TABLE `alizi_alipay_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `out_trade_no` (`out_trade_no`);

--
-- Indexes for table `alizi_article`
--
ALTER TABLE `alizi_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`name`) USING BTREE;

--
-- Indexes for table `alizi_category`
--
ALTER TABLE `alizi_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_comments`
--
ALTER TABLE `alizi_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_item`
--
ALTER TABLE `alizi_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sn` (`sn`),
  ADD KEY `title` (`name`) USING BTREE;

--
-- Indexes for table `alizi_item_template`
--
ALTER TABLE `alizi_item_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_order`
--
ALTER TABLE `alizi_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_order_log`
--
ALTER TABLE `alizi_order_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_setting`
--
ALTER TABLE `alizi_setting`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `alizi_shipping`
--
ALTER TABLE `alizi_shipping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alizi_user`
--
ALTER TABLE `alizi_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alizi_advert`
--
ALTER TABLE `alizi_advert`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `alizi_alipay_log`
--
ALTER TABLE `alizi_alipay_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `alizi_article`
--
ALTER TABLE `alizi_article`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `alizi_category`
--
ALTER TABLE `alizi_category`
  MODIFY `id` int(12) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `alizi_comments`
--
ALTER TABLE `alizi_comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `alizi_item`
--
ALTER TABLE `alizi_item`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `alizi_order`
--
ALTER TABLE `alizi_order`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `alizi_order_log`
--
ALTER TABLE `alizi_order_log`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `alizi_shipping`
--
ALTER TABLE `alizi_shipping`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `alizi_user`
--
ALTER TABLE `alizi_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
