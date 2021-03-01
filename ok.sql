/*
MySQL Backup
Source Server Version: 5.7.17
Source Database: myshop
Date: 2019/10/18 09:53:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `tbguestbook`
-- ----------------------------
DROP TABLE IF EXISTS `tbguestbook`;
CREATE TABLE `tbguestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `createtime` varchar(255) DEFAULT NULL,
  `isshow` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbmember`
-- ----------------------------
DROP TABLE IF EXISTS `tbmember`;
CREATE TABLE `tbmember` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `truename` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbnews`
-- ----------------------------
DROP TABLE IF EXISTS `tbnews`;
CREATE TABLE `tbnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `contents` text,
  `createtime` varchar(100) DEFAULT NULL,
  `typeid` varchar(11) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tborderhead`
-- ----------------------------
DROP TABLE IF EXISTS `tborderhead`;
CREATE TABLE `tborderhead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `stel` varchar(255) DEFAULT NULL,
  `saddress` varchar(255) DEFAULT NULL,
  `sumprice` decimal(11,0) DEFAULT '0',
  `memberid` int(11) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tborderitems`
-- ----------------------------
DROP TABLE IF EXISTS `tborderitems`;
CREATE TABLE `tborderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `proid` int(11) DEFAULT NULL,
  `proname` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `procount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbpiclist`
-- ----------------------------
DROP TABLE IF EXISTS `tbpiclist`;
CREATE TABLE `tbpiclist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbproduct`
-- ----------------------------
DROP TABLE IF EXISTS `tbproduct`;
CREATE TABLE `tbproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proname` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `brief` varchar(255) DEFAULT NULL,
  `descriptions` text,
  `address` varchar(255) DEFAULT NULL,
  `istop` int(11) DEFAULT '0',
  `isstar` int(11) DEFAULT '0',
  `imgurl` varchar(255) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbregisters`
-- ----------------------------
DROP TABLE IF EXISTS `tbregisters`;
CREATE TABLE `tbregisters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbshoppingcar`
-- ----------------------------
DROP TABLE IF EXISTS `tbshoppingcar`;
CREATE TABLE `tbshoppingcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionid` varchar(32) DEFAULT NULL,
  `proname` varchar(255) DEFAULT NULL,
  `proid` int(11) DEFAULT NULL,
  `procount` int(11) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tbusers`
-- ----------------------------
DROP TABLE IF EXISTS `tbusers`;
CREATE TABLE `tbusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `truename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `tbguestbook` VALUES ('2','121212','12112','121212','2018-10-14 11:07:12','1'), ('3','121212','121','1212121','2018-10-14 11:21:35','1'), ('6','1212','1212','1212','2018-10-21 13:12:18','1');
INSERT INTO `tbmember` VALUES ('1','user1','123456','王刚','1590000111x','重庆市巴南区学堂湾'), ('2','user2','123456','李冰','1590000112x','重庆市巴南区渔胡路'), ('3','user3','123456','霄凌','1590000113x','重庆市巴南区九公里'), ('4','user5','123456','伍思凯','15900000001','成都市高新区XX路3-3-2');
INSERT INTO `tbnews` VALUES ('97','“三减三健，迈向健康”主题宣传活动于我校举行','王五','为营造全民健康生活的良好氛围，进一步向我校师生普及健康文明的生活方式，传授健康生活的技能，2018年9月28日中午，由我校后勤保障处主办、大学生自我管理与服务委员会（以下简称“大自委”）学生后勤服务中心承办的“三减三健，迈向健康”主题宣传活动于我校食堂、教学楼顺利举行。','2018-10-10','1','校团委'), ('98','关于2018年度留学基金委国家公派出国留学项目申报工作的通知','李四','2018年国家公派高级研究学者、访问学者、博士后项目、国际区域问题研究机外语高层次人才培养项目录取人员的留学资格保留至2018年12月31日。即当年选拔当年派出；西部地区人才培养特别项目被录取人员的留学资格保留至2019年9月30日（统一安排成班派出项目除外）。请计划申请上述项目的人员提前做好准备，在联系邀请函时，明确派出时间在结果公布日期和留学资格有效期之间。同一时段内仅限申报一个国家攻来出国留学项目，在申报项目未公布录取结果之前，不得申请其他项目。','2018-10-08','1','招生就业处'), ('99','2018级迎新晚会“梦想开始的地方”在学校操场顺利举行','张三','向信仰看齐，向梦想致敬，向未来出发。9月28日晚6点半，重庆工商大学融智学院2018年消防文艺巡演暨2018级迎新晚会“梦想开始的地方”在学校操场顺利举行。此次晚会旨在庆祝建国69周年，歌颂改革开放40周年取得的各项成绩，也表达出我校对2018级新生的热烈欢迎。莅临本次晚会的嘉宾有：重庆工商大学融智学院党委丁广龙书记，重庆工商大学融智学院党委陈龙国副书记，党政办公室主任王晓云，教务处处长崔中山，思政部主任常晓薇，图书馆副馆长梁彦博，保卫处副处长欧英前，基础部副主任吕福起，学生处处长唐川川，学生处副处长兼团委书记李刚，商务学院党总支副书记宋湘琴，经济学院党总支副书记乐晓勇，以及物流学院党总支副书记李喆。\r\n此次晚会以“梦想开始的地方”为主题，向18级新生展现了一幅完整的青春画卷。舞蹈《永远的红门》拉开了表演的序幕，重庆消防艺术团的表演者们身着消防服，用灵活的身体和昂扬的斗志表达了对消防战士崇高的敬意和真挚的感谢；“把光荣写在军旗上，战火青春最风流”，男声独唱《当祖国召唤的时候》澎湃了大家的激情，使全场观众热血沸腾；讲述《我们的故事》也深入人心，四周万籁俱寂，有人潸然泪下；除此之外，还有女声独唱《从前慢》，话剧《我们的理想在希望的田野上》，舞蹈《守护》等精彩绝伦的节目。最后，舞蹈《骄傲的少年》将晚会拉向了最后的高潮，晚会也在一片欢声笑语中圆满结束。\r\n以梦为马，不负韶华，我们来自各地，有缘相聚于融智。这里是梦想的新起点。在这新的起跑线上，我们扬帆起航，向着美好未来大步前进。筑梦的路上有你有我。愿你我在追求梦想的道路上深沉而又执着。\r\n让我们一起筑梦融智，不忘初心，不负青春好时光!','2018-09-29','2','校团委'), ('100','我校的国家奖学金公示','王五','全校师生：\r\n经本人申请，所在班级、学院认定，学生处审核，且经过现场答辩和学生工作委员会讨论，我校XXX等9名同学通过了我校的国家奖学金初审环节，现对全校师生进行公示，公示时间2018年10月9日—15日，如对公示结果有疑义，请于公示日期内联系学生处。  \r\n联系电话：88968681 联系人：王老师\r\n','2018-10-10','1','融智学院'), ('101','“石榴哥”走红背后的原因是什么','张三','丽江“石榴哥”火了，背后的原因是什么？网友：其实他不傻！\r\n这几天在某短视频平台上，突然走红了一位卖石榴的小哥。\r\n一开始不少网友认为这位卖石榴的小哥是自闭症，不少网友纷纷留言，称买他的石榴也算是在帮这位小哥。\r\n可是最近这位石榴哥好像变样儿了。\r\n长相憨厚老师，穿着简单质朴，在丽江卖石榴的这位小哥莫名其妙的走红了，有不少网友还不远万里的去丽江看这位卖石榴的小哥。\r\n为什么这样一个卖石榴的人会突然的火了呢？我们从网上的视频来看，石榴哥特别有才，懂很多国家的语言。\r\n我们一般人卖石榴，应该是吆喝且夸自己的产品，而这位丽江小哥卖石榴，就一句话，我要回家了，你买我的石榴吗？我的石榴很好吃，你可以来尝一尝，不要钱的。\r\n许多网友可能也是被这位石榴哥的真诚打动了。\r\n这位石榴哥是一位英语老师，利用下班的时间卖石榴，他的英语说的是相当的不错，可能也是这种反差，让这位卖石榴的小哥在短时间内一下子走红了。\r\n在走红之后，不少网友才知道，这位石榴哥其实他一点也不傻，由于说话方式和自己独特的推销方式，石榴哥才走红了。\r\n石榴哥一点儿也不傻，最近还有个重庆的小姐姐非常喜欢他，专门从重庆飞到丽江去看他，还给他送了件衣服。\r\n石榴哥英语说的那么好，还走桃花运，还真让人有点小羡慕呢。','2018-10-12','6','新闻网');
INSERT INTO `tborderhead` VALUES ('9','20181127085617282','王刚','1590000111x','重庆市巴南区学堂湾X-3-36','4524','1','2018-11-27 08:56:17'), ('10','20181127092921877','王刚','1590000111x','重庆市巴南区学堂湾','2422','1','2018-11-27 09:29:21');
INSERT INTO `tborderitems` VALUES ('16','20181127085617282','4','小米 max3','100','3'), ('17','20181127085617282','8','惜艾蜜','2112','2'), ('18','20181127092921877','14','小米 max3  1','2222','1'), ('19','20181127092921877','2','小米 max3','100','2');
INSERT INTO `tbpiclist` VALUES ('9','图1','20181021173243296.png','图1'), ('10','图2','20181021173302314.jpg','图2'), ('11','图3','20181021173311096.jpg','图3'), ('12','图4','20181021173320054.jpg','图4'), ('13','图5','20181021173328386.jpg','图5'), ('14','图6','20181021173338259.jpg','图6'), ('15','','20181123100956628.jpeg','');
INSERT INTO `tbproduct` VALUES ('1','小米 max3','100','【32GB牛逼得很。赠送支架和自拍干 现在购买送30元话费。赠送支架和自拍干 现在购买送30元话费。6.44寸大屏幕，送苹果8plus】.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.充电两小时，通话5分钟。','<p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233478326098897.png\" title=\"1543233478326098897.png\" alt=\"proviewlist.png\"/></p><p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233488019095037.png\" title=\"1543233488019095037.png\" alt=\"proviewpromi.png\"/></p>','产地','0','1','20181126174440769.png','1'), ('2','小米 max3','100','【32GB牛逼得很。赠送支架和自拍干 现在购买送30元话费。赠送支架和自拍干 现在购买送30元话费。6.44寸大屏幕，送苹果8plus】.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.充电两小时，通话5分钟。','<p>1212</p>','产地','0','1','20181126174428720.png','1'), ('3','小米 max3','100','【32GB牛逼得很。赠送支架和自拍干 现在购买送30元话费。赠送支架和自拍干 现在购买送30元话费。6.44寸大屏幕，送苹果8plus】.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.充电两小时，通话5分钟。','<p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233501043035474.png\" title=\"1543233501043035474.png\" alt=\"proviewlist.png\"/></p><p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233508850030193.png\" title=\"1543233508850030193.png\" alt=\"proviewpromi.png\"/></p>','产地','0','1','20181126174415576.png','1'), ('4','小米 max3','100','【32GB牛逼得很。赠送支架和自拍干 现在购买送30元话费。赠送支架和自拍干 现在购买送30元话费。6.44寸大屏幕，送苹果8plus】.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.充电两小时，通话5分钟。','<p>内容内容内容</p><p><br/></p>','产地','0','1','20181126174338036.png','1'), ('5','小米 max31111','32002','nice nice3333','<p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233535135014351.png\" title=\"1543233535135014351.png\" alt=\"proviewlist.png\"/></p><p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233543646099009.png\" title=\"1543233543646099009.png\" alt=\"proviewpromi.png\"/></p>','北京444','0','1','20181126174510396.png','1'), ('6','小米 max3','3200','nice nice','<p>小米 max3小米 max3小米 max3</p>','北京','1','0','20181126174552242.png','1'), ('7','小米 max3','3200','nice nice','<p>小米 max3小米 max3小米 max3小米 max3小米 max3小米 max3</p>','北京','1','0','20181126174604385.png','1'), ('8','惜艾蜜','2112','nice','<p>nice</p>','北京','0','1','20181126174643280.png','1'), ('9','1212','121212','12121','<p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233428310073401.png\" title=\"1543233428310073401.png\" alt=\"proviewlist.png\"/></p><p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543233453557036583.png\" title=\"1543233453557036583.png\" alt=\"proviewpromi.png\"/></p>','1212','0','0','20181126183706437.png','1'), ('14','小米 max3  1','2222','3333','<p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181126/1543228738392086879.png\" title=\"1543228738392086879.png\" alt=\"proviewlist.png\"/></p>','北京5555','1','0','20181126174617876.png','1'), ('15','红米7plus','1980','【64GB牛逼得很。赠送支架和自拍干 现在购买送30元话费。赠送支架和自拍干 现在购买送30元话费。6.44寸大屏幕，送苹果8plus】.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.6.44寸大屏幕，送苹果8plus.充电两小时，通话5分钟。','<p><img src=\"http://localhost:9090/myshop/ueditor/jsp/upload/image/20181127/1543276923250058775.png\" title=\"1543276923250058775.png\" alt=\"QQ截图20181127080007.png\"/></p><p>后置<span style=\"color: rgb(255, 0, 0);\">1200万+500</span>万AI双摄，拍照更出色全新12nm八核处理器抢红包快人一步5.45英寸全面屏高清高屏占比，震撼视野小“杨柳腰”机身优雅弧度，爱不释手AI 人像模式 实时背景虚化，凸显你的美</p><p>AI人脸解锁 抬手亮屏，刷脸解锁更便捷AI 语音助理 一句话搞定手机复杂操作</p><p>3选2 卡槽最高可扩展 256GB定制5.45英寸18:9高清全面屏，80.5%高屏占比，圆角屏幕设计，圆润、优雅。</p><p>小“杨柳腰”机身，精致纤薄，爱不释手。</p><p>* 业界通常将窄边框和高屏占比的手机称为全面屏手机，本手机沿用业界的通用概念。红米6屏占比算法为显示区面积除以正面玻璃总面积；</p><p>* 抢红包功能针对微信红包进行测试，对比机型为骁龙450处理器且同价位机型，且在同一网络环境同一微信群中进行；</p><p>* 前置背景虚化功能会通过后续 OTA 支持，更新进度最终以 MIUI官网公布、MIUI 稳定版功能更新为准；</p><p>* 红米6 产品站非特别指出，均为我司实验室数据、设计技术参数及供应商提供数据。全站数据实际情况会因测试软件版本、具体测试环境、具体版本不同，而略有差异。全站所展示结构图片，均为功能示意图，并非绝对实际结构，产品实际情况最终以实物为准。</p><p><br/></p><p><br/></p>','北京','0','0','20181127080215310.png','2');
INSERT INTO `tbregisters` VALUES ('1','111','222','3333'), ('2','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('3','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('4','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('5','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('6','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('7','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('8','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('9','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('10','duanyihong','1234567890','我承认我自卑,我真的很怕黑!'), ('11','username','tel','msg');
INSERT INTO `tbshoppingcar` VALUES ('58','A92876B4BBF3A9E38E00D40D883063EA','小米 max3','7','1','2018-11-26 17:17:17','20181123124629005.png','3200'), ('59','6D445F5710B427EF7C34043BAF3FB126','小米 max3','4','1','2018-11-26 17:41:09','20181123101820838.jpeg','100'), ('60','EB28D917D7249D0C8AB032C62201B80D','小米 max3  1','14','1','2018-11-26 20:15:44','20181126174617876.png','2222');
INSERT INTO `tbusers` VALUES ('1','admin','123456','管理员3'), ('2','user','123456','张三'), ('3','test','123456','测试员'), ('4','test2','123456','测试员2'), ('5','admin','123456','管理员');
