/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50010
Source Host           : localhost:3306
Source Database       : bookshop

Target Server Type    : MYSQL
Target Server Version : 50010
File Encoding         : 65001

Date: 2018-04-20 11:24:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_no` varchar(32) default NULL,
  `admin_pwd` varchar(32) default NULL,
  `admin_name` varchar(30) default NULL,
  `admin_sex` varchar(2) default NULL,
  `admin_age` int(11) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'gaohuan', '53225b8e3b702c08c9fbc5b87de8064c', '高欢', '男', '24');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL auto_increment,
  `admin_id` int(11) default NULL,
  `book_name` varchar(60) default NULL,
  `book_type` varchar(60) default NULL,
  `datetime` date default NULL,
  `price` double default NULL,
  `url` varchar(100) default NULL,
  `sales` int(255) default NULL,
  `book_type_id` int(11) default NULL,
  `down_sale` int(1) default NULL,
  `t_price` double default NULL,
  `stock` int(11) default NULL,
  PRIMARY KEY  (`book_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('2', '1', '高级C语言编程', '科技', '2017-08-09', '69.6', 'bookimages/programme02.jpg', '15', '3', '1', '60', '999999');
INSERT INTO `book` VALUES ('3', '1', '像计算机科学家一样思考Python', '计算机编程语言', '2017-08-08', '60', 'bookimages/programme03.jpg', '16', '1', '1', '56', '999994');
INSERT INTO `book` VALUES ('4', '1', 'javascript DOM编程艺术', '计算机编程语言', '2017-08-08', '60', 'bookimages/programme04.jpg', '11', '1', '0', null, '999999');
INSERT INTO `book` VALUES ('5', '1', 'java编程思想', '计算机编程语言', '2017-08-08', '60', 'bookimages/programme05.jpg', '2901', '1', '1', '53.2', '999999');
INSERT INTO `book` VALUES ('6', '1', '嵌入式C编程', '计算机编程语言', '2017-08-08', '70', 'bookimages/programme06.jpg', '11', '1', '0', null, '999999');
INSERT INTO `book` VALUES ('7', '1', '明解C语言', '计算机编程语言', '2017-08-08', '70', 'bookimages/programme07.jpg', '4906', '1', '1', '58', '999994');
INSERT INTO `book` VALUES ('8', '1', 'Go语言编程', '计算机编程语言', '2017-08-08', '70', 'bookimages/programme08.jpg', '15', '1', '0', null, '999995');
INSERT INTO `book` VALUES ('9', '1', '围城', '文学', '2017-08-09', '80', 'bookimages/letter01.jpg', '1001', '2', '1', '56', '999999');
INSERT INTO `book` VALUES ('11', '1', '你新温柔却有力量', '文学', '2017-08-09', '80', 'bookimages/letter03.jpg', '31', '2', '1', '54', '999999');
INSERT INTO `book` VALUES ('12', '1', '文学回忆录', '文学', '2017-08-09', '80', 'bookimages/letter04.jpg', '50', '2', '0', null, '1000000');
INSERT INTO `book` VALUES ('13', '1', '爱情，婚姻，恨，友谊，追求', '文学', '2017-08-09', '80', 'bookimages/letter05.jpg', '500', '2', '0', null, '1000000');
INSERT INTO `book` VALUES ('14', '1', '局外人', '文学', '2017-08-09', '80', 'bookimages/letter06.jpg', '800', '2', '1', '68', '1000000');
INSERT INTO `book` VALUES ('15', '1', '百年孤独', '文学', '2017-08-09', '80', 'bookimages/letter07.jpg', '30001', '2', '1', '64', '999999');
INSERT INTO `book` VALUES ('16', '1', '仿徨', '文学', '2017-08-09', '80', 'bookimages/letter08.jpg', '7001', '2', '0', null, '999999');
INSERT INTO `book` VALUES ('18', '1', '新一轮产业革命', '科技', '2017-08-09', '90', 'bookimages/CnTech02.jpg', '10224', '3', '1', '67', '997775');
INSERT INTO `book` VALUES ('19', '1', '科技之巅', '科技', '2017-08-09', '90', 'bookimages/CnTech03.jpg', '488', '3', '1', '80', '1000000');
INSERT INTO `book` VALUES ('20', '1', '智能极限后人类的未来', '科技', '2017-08-09', '90', 'bookimages/CnTech04.jpg', '265', '3', '1', '80', '1000000');
INSERT INTO `book` VALUES ('40', '1', '汇编', '科技', '2017-08-30', '66', 'bookimages/huibian.jpg', '8000', '3', '0', null, '90000');
INSERT INTO `book` VALUES ('41', null, '123', '科技', '2017-09-28', '45', 'bookimages/sss.png', '433', '3', '0', null, '566');

-- ----------------------------
-- Table structure for book_type
-- ----------------------------
DROP TABLE IF EXISTS `book_type`;
CREATE TABLE `book_type` (
  `bookType_id` int(11) NOT NULL auto_increment,
  `bookType_name` varchar(200) default NULL,
  `bookType_url` varchar(200) default NULL,
  PRIMARY KEY  (`bookType_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_type
-- ----------------------------
INSERT INTO `book_type` VALUES ('1', '计算机编程语言', 'bookimages/bookType01.jpg');
INSERT INTO `book_type` VALUES ('2', '文学', 'bookimages/bookType02.jpg');
INSERT INTO `book_type` VALUES ('3', '科技', 'bookimages/bookType03.jpg');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL auto_increment,
  `book_id` int(11) default NULL,
  `amount` int(11) default NULL,
  `c_price` double default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`cart_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('247', '18', '1', '67', '15');
INSERT INTO `cart` VALUES ('253', '6', '1', '70', '15');
INSERT INTO `cart` VALUES ('275', '6', '1', '70', '15');
INSERT INTO `cart` VALUES ('282', '3', '1', '50.9', '15');
INSERT INTO `cart` VALUES ('288', '4', '1', '60', '15');
INSERT INTO `cart` VALUES ('290', '6', '1', '70', '15');
INSERT INTO `cart` VALUES ('291', '7', '1', '58', '15');
INSERT INTO `cart` VALUES ('292', '8', '1', '70', '15');
INSERT INTO `cart` VALUES ('293', '3', '1', '50.9', '15');
INSERT INTO `cart` VALUES ('294', '12', '1', '80', '15');
INSERT INTO `cart` VALUES ('295', '20', '1', '80', '15');
INSERT INTO `cart` VALUES ('297', '4', '1', '60', '15');
INSERT INTO `cart` VALUES ('298', '18', '1', '67', '15');
INSERT INTO `cart` VALUES ('299', '20', '1', '80', '15');
INSERT INTO `cart` VALUES ('300', '14', '1', '68', '15');
INSERT INTO `cart` VALUES ('303', '1', '1', '55', '16');
INSERT INTO `cart` VALUES ('304', '3', '1', '50.9', '16');
INSERT INTO `cart` VALUES ('305', '4', '1', '60', '16');
INSERT INTO `cart` VALUES ('306', '5', '1', '53.2', '16');
INSERT INTO `cart` VALUES ('307', '6', '1', '70', '16');
INSERT INTO `cart` VALUES ('308', '7', '1', '58', '16');
INSERT INTO `cart` VALUES ('310', '9', '1', '56', '15');
INSERT INTO `cart` VALUES ('311', '2', '1', '60', '15');
INSERT INTO `cart` VALUES ('312', '11', '1', '54', '15');
INSERT INTO `cart` VALUES ('313', '2', '1', '60', '15');
INSERT INTO `cart` VALUES ('314', '18', '1', '67', '15');
INSERT INTO `cart` VALUES ('315', '19', '1', '80', '15');
INSERT INTO `cart` VALUES ('316', '20', '1', '80', '15');
INSERT INTO `cart` VALUES ('317', '33', '1', '99', '15');
INSERT INTO `cart` VALUES ('318', '2', '1', '60', '15');
INSERT INTO `cart` VALUES ('319', '18', '1', '67', '15');
INSERT INTO `cart` VALUES ('320', '19', '1', '80', '15');
INSERT INTO `cart` VALUES ('321', '20', '1', '80', '15');
INSERT INTO `cart` VALUES ('322', '33', '1', '99', '15');
INSERT INTO `cart` VALUES ('333', '2', '1', '60', '19');
INSERT INTO `cart` VALUES ('334', '18', '1', '67', '19');
INSERT INTO `cart` VALUES ('354', '3', '1', '50.9', '22');
INSERT INTO `cart` VALUES ('359', '8', '1', '70', '22');
INSERT INTO `cart` VALUES ('362', '2', '1', '60', '22');
INSERT INTO `cart` VALUES ('363', '4', '1', '60', '22');
INSERT INTO `cart` VALUES ('367', '20', '1', '80', '22');
INSERT INTO `cart` VALUES ('368', '5', '1', '53.2', '22');
INSERT INTO `cart` VALUES ('369', '18', '1', '67', '36');

-- ----------------------------
-- Table structure for etl_test
-- ----------------------------
DROP TABLE IF EXISTS `etl_test`;
CREATE TABLE `etl_test` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of etl_test
-- ----------------------------
INSERT INTO `etl_test` VALUES ('1', '啊啊啊啊');
INSERT INTO `etl_test` VALUES ('2', '巴巴爸爸');

-- ----------------------------
-- Table structure for eval
-- ----------------------------
DROP TABLE IF EXISTS `eval`;
CREATE TABLE `eval` (
  `eval_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `book_id` int(11) default NULL,
  `eval_content` varchar(236) default NULL,
  `eval_time` datetime default NULL,
  `eval_score` double default NULL,
  PRIMARY KEY  (`eval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eval
-- ----------------------------
INSERT INTO `eval` VALUES ('22', '15', '15', '迄今为止，我没有给过任何商家差评。但是我尽量不在天猫买东西，因为我知道如果天猫商家触怒了我，我给出的评价屁用没有。', '2017-08-23 14:27:01', '4');
INSERT INTO `eval` VALUES ('23', '15', '15', '天猫的评分体制，很难形成纵向的对比，比如某一个品牌店，他的店里的总评分是4.5，他是卖拖鞋的，另外一个卖手机的品牌店的评分是4.9，这对于买家用户来说，什么意义都没有。', '2017-08-23 14:33:54', '5');
INSERT INTO `eval` VALUES ('24', '15', '15', '天猫商家都是一个一个的个体，这样的评价体系很难让他们有动力去维护“天猫”这块牌子，“天猫”臭了，他们立刻可以抽身去找别的地方经营。', '2017-08-23 14:38:05', '5');
INSERT INTO `eval` VALUES ('27', '15', '3', '天猫商家可以不太在乎卖家给出的评分，从而避免了很多在淘宝出现的问题，比如楼上所说一个差评毁掉一个热卖商品，比如商家骚乱给差评的买家。总之，商家可以不在意这些了。与此同时，这就是这个评价体系的致命缺点所在。', '2017-08-23 15:19:25', '6');
INSERT INTO `eval` VALUES ('28', '15', '15', '用户很难在评价之中，找到差评，中评。于是商家可以不太在乎用户的评价。久而久之，这样的评价体系会慢慢的削弱天猫商家的服务水平，从而使用户丧失对这个平台的信心。', '2017-08-23 15:19:44', '3');
INSERT INTO `eval` VALUES ('29', '16', '3', '当用户以登陆身份请求服务器资源时，记录用户的最后活跃时间。接着拟定一个失效时间，统计在线人数的时候，假设某个用户的最后活跃时间和当前时间的差值大于这个失效时间，也就是说该用户这一段时间都没有和服务器交互了，那么就认为该用户已下线，否则认为他是在线的。', '2017-08-23 16:22:54', '6');
INSERT INTO `eval` VALUES ('30', '22', '8', '一般般', '2017-08-30 14:22:29', '6.5');

-- ----------------------------
-- Table structure for logetl
-- ----------------------------
DROP TABLE IF EXISTS `logetl`;
CREATE TABLE `logetl` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(100) default NULL,
  `table_name` varchar(100) default NULL,
  `result` varchar(100) default NULL,
  `module` varchar(100) default NULL,
  `operation` varchar(100) default NULL,
  `create_time` datetime default NULL,
  `visit_ip` varchar(100) default NULL,
  `local_ip` varchar(100) default NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logetl
-- ----------------------------
INSERT INTO `logetl` VALUES ('11', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 16:17:55', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('12', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-24 16:29:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('14', 'admin', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-24 16:45:23', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('16', 'admin', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-24 16:45:27', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('17', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 16:45:45', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('18', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 16:45:48', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('19', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:06:41', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('20', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:09:08', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('21', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:09:14', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('22', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:09:20', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('23', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:36:45', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('24', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:36:51', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('25', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:37:09', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('26', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:09', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('27', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:14', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('28', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-24 17:37:15', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('29', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:16', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('30', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-24 17:37:24', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('31', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:24', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('32', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:28', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('33', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:31', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('34', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-24 17:37:33', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('35', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:34', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('36', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:39', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('37', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:50', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('38', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:39:33', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('39', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:39:37', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('41', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:39:42', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('43', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:40:13', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('44', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:42:38', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('45', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:42:44', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('46', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:42:47', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('47', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:50:47', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('48', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:51:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('49', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:08', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('50', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:52:29', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('51', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:29', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('52', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:52:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('53', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('54', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-24 17:52:46', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('55', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:46', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('56', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:54:02', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('57', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:54:02', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('58', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:54:05', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('59', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:56:36', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('60', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-24 17:56:40', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('61', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:56:40', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('62', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:05:41', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('63', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 18:06:01', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('64', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:06:01', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('65', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:06:05', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('66', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '修改', '2017-08-24 18:07:00', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('69', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:10:43', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('70', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:12:23', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('73', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:17:12', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('75', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:19:57', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('77', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:21:12', '10.55.15.241', '10.55.15.14');
INSERT INTO `logetl` VALUES ('79', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:24:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('80', '未登录', '用户信息表', 'SUCCESS', '用户信息管理', '修改', '2017-08-24 18:24:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('81', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 21:43:01', '127.0.0.1', '192.168.191.1');
INSERT INTO `logetl` VALUES ('100', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-25 10:19:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('101', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-25 10:19:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('102', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-25 10:19:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('113', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 14:38:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('114', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 14:38:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('115', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 14:38:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('116', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:34:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('117', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:35:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('119', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 17:35:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('120', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:35:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('121', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:35:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('122', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 17:36:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('123', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:36:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('124', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 17:36:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('125', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:36:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('126', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:36:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('127', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('128', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-28 17:39:09', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('129', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('130', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-28 17:39:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('131', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('132', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-28 17:39:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('133', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('134', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('135', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('136', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('137', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('138', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('139', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:42:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('140', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:42:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('141', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:42:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('142', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:43:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('143', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:43:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('145', 'admin', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 17:41:08', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('146', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:41:08', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('147', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('148', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('149', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('150', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('151', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('152', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('153', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('154', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:20', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('155', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('156', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-28 17:54:24', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('157', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:54:24', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('158', 'aaaaa', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:54:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('159', 'aaaaa', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:56:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('160', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:49:53', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('161', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:01', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('162', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:06', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('167', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:58:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('168', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:58:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('169', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 17:59:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('170', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('171', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('172', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('173', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('174', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('175', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 17:59:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('176', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('177', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('178', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('179', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 18:00:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('180', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('181', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:27', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('182', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('183', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('184', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('185', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('186', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('187', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('188', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 18:01:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('189', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:01:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('190', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('191', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('192', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('193', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('194', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('195', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('196', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('197', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('198', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('199', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('200', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('201', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('202', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('203', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('204', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('205', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('206', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 18:06:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('207', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('208', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:07:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('209', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:07:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('210', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:08:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('211', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:19:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('214', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 09:21:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('215', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:21:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('216', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:21', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('217', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('218', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:25', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('219', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('220', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:53', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('221', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('222', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 09:23:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('223', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('224', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('225', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:19', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('226', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('227', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 09:24:28', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('228', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:28', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('229', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:53', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('230', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:33', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('231', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:41', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('232', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:49', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('233', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:52', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('234', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:51:48', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('236', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 09:52:24', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('237', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:52:24', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('238', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:52:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('239', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:52:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('240', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:05', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('241', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 10:36:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('242', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('243', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('244', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:38', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('245', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:18', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('246', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:40', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('247', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:41', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('248', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:48', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('249', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:03:25', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('250', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:22:17', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('251', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 11:22:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('252', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:22:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('253', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:22:40', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('254', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:35', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('255', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('256', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:43', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('257', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('258', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:49', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('259', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:24', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('260', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('261', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('262', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:58', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('263', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:42:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('264', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-29 11:42:04', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('265', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:42:04', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('266', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 11:42:16', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('267', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:42:16', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('268', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:03', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('269', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:06', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('270', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:00:10', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('271', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:10', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('272', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:54', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('273', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:55', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `logetl` VALUES ('274', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:11', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('275', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:40:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('276', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('277', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:28', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('278', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:40:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('279', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('280', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:01', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('281', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:05', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('283', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:42:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('284', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('285', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('286', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:42:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('287', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('288', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:43:41', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('289', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:43:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('290', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:43:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('291', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:44:01', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('292', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:44:03', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('293', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:44:03', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('294', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:44:57', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('295', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:45:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('296', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:45:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('297', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:45:33', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('298', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:45:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('299', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:45:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('300', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:50:43', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('301', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:50:54', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('302', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:50:54', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('303', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:50:58', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('304', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:51:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('305', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:51:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('306', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:57:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('307', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('308', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 13:00:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('309', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('310', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:26', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('311', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('312', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:40', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('313', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:44', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('314', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:00:47', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('315', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:47', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('316', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:06:33', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('317', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:06:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('318', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:06:38', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('319', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:06:38', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('320', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:12', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('321', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:19', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('322', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('323', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:30', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('324', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:11:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('325', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('326', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:14:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('327', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('328', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:17:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('329', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('330', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('331', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-29 13:17:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('332', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('333', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 13:17:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('334', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('335', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:18:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('336', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:17', '127.0.0.1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('337', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('338', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 13:30:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('339', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('340', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('341', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:52:11', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('342', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 14:06:08', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('343', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 14:06:12', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('344', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 08:58:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('346', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 08:59:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('347', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:00:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('348', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:00:51', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('349', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 09:01:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('350', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('351', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('352', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('353', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('354', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:01:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('355', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('356', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('357', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('358', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('359', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:02:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('360', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('361', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('362', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:04:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('363', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:04:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('364', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:04:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('365', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('366', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 09:05:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('367', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('368', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('369', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:05:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('370', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('371', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('372', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 09:06:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('373', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('374', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:51', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('375', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:06:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('376', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('377', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:07:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('378', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:07:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('379', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:07:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('380', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:07:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('381', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:10:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('382', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:10:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('383', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:11:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('384', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:11:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('385', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:11:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('386', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:11:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('387', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:18:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('388', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:19:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('389', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:19:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('390', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:19:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('391', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:19:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('392', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:21:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('393', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:21:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('394', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:21:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('395', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:25:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('396', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:28:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('397', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:28:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('398', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:28:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('399', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:30:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('400', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:30:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('401', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:31:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('402', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:31:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('403', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:31:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('404', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:32:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('405', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:32:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('406', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:34:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('407', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:35:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('408', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:35:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('409', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:35:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('410', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:36:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('411', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:36:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('412', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:36:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('413', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('414', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('415', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:56', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('416', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:37:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('417', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('418', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-30 09:38:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('419', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('420', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-30 09:38:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('421', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('422', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('423', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('424', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:38:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('425', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('426', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('427', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:48:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('428', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-30 09:48:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('429', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:48:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('430', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:49:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('431', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:49:09', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('432', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:49:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('434', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:50:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('435', '未登录', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:51:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('436', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:51:27', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('438', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:51:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('440', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:52:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('442', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:53:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('443', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:53:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('444', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:55:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('445', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:55:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('446', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:55:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('447', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:56:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('449', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:57:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('450', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:58:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('452', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:03:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('453', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('455', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:05:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('457', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:08:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('459', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:08:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('461', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:13:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('463', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:14:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('466', '231', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:18:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('468', '12313', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:20:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('469', '12313', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:21:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('470', '3431', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:21:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('472', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:23:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('473', '321', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:23:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('474', '321', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:25:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('475', '321', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:25:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('477', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:27:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('478', '312', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:27:05', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('479', '312qwew', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:27:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('480', '312qwew', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:27:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('481', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 11:52:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('482', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 13:45:01', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('483', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 13:45:15', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('484', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 13:45:15', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('485', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 13:45:21', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('486', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('487', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:09:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('488', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('489', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('490', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:09:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('491', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('492', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:10:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('493', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-30 14:10:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('494', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:10:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('495', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:10:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('496', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('497', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:19:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('498', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('499', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('500', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('501', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('502', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('503', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('504', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('505', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:27', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('506', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('507', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:20:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('508', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('509', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('510', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:42', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('511', 'gaohuan', '图书评价表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:22:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('512', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:22:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('513', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:22:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('514', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:22:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('515', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('516', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('517', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('518', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('519', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('520', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('521', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('522', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:24:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('523', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('524', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('525', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('526', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:50', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('527', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:06', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('528', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:13', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('529', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:18', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('530', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:20', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('531', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('532', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-30 14:23:34', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('533', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:34', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('535', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:23:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('536', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('537', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('538', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:09', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('539', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:34', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `logetl` VALUES ('540', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('541', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:34:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('542', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('543', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('544', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('545', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:34:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('546', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('547', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('548', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('549', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:34:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('550', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('551', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:35:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('552', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:35:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('553', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('554', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('555', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:36:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('556', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('557', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('558', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('559', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:40:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('560', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('561', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('562', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:40:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('563', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('564', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:41:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('565', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:41:56', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('566', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:42:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('567', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:42:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('568', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:42:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('569', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:42:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('570', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:43:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('571', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:43:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('572', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:43:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('573', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('574', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:52:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('575', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('576', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('577', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:52:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('578', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('579', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:53:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('580', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:59:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('581', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:59:42', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('582', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:59:42', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('583', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-30 14:59:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('584', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:59:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('585', '31231', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:00:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('587', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:02:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('589', '124abc', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:02:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('590', '124abc', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:03:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('594', '123abc', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 15:05:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('595', '123abc', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('596', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('597', '123abc', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('598', '123abc', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('599', '123abc', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 15:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('600', '123abc', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('601', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('602', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('603', '123abc', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('604', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('605', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:08:05', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('606', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:11:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('608', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-09-12 14:12:21', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('609', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:21', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('610', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:24', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('611', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('612', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('613', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:13:09', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('614', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:20:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('615', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-13 16:24:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('616', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-13 16:24:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `logetl` VALUES ('617', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-14 16:11:18', '127.0.0.1', '192.168.191.1');
INSERT INTO `logetl` VALUES ('618', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-18 17:00:00', '127.0.0.1', '10.55.15.60');
INSERT INTO `logetl` VALUES ('619', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-18 17:00:01', '127.0.0.1', '10.55.15.60');
INSERT INTO `logetl` VALUES ('620', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-18 17:04:32', '127.0.0.1', '10.55.15.60');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL auto_increment,
  `message_username` varchar(255) default NULL,
  `message_date` varchar(255) default NULL,
  `message_content` varchar(255) default NULL,
  `message_theme` varchar(255) NOT NULL,
  `message_rating` varchar(10) default NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('37', null, '2017-08-14 10:53:54', '111111111', '书的id', '1');
INSERT INTO `message` VALUES ('38', null, '2017-08-14 11:02:35', '2222222222222', '书的id', '2');
INSERT INTO `message` VALUES ('52', 'admin', '2017-08-22 14:12:23', '20170822', '书的id', '3');
INSERT INTO `message` VALUES ('51', '', '2017-08-14 15:57:54', '最新留言1', '书的id', '4');
INSERT INTO `message` VALUES ('49', '', '2017-08-14 15:54:32', '最新的修改1', '书的id', '5');
INSERT INTO `message` VALUES ('50', null, '2017-08-14 15:55:28', '最新的', '书的id', '5');
INSERT INTO `message` VALUES ('53', 'admin', '2017-08-22 14:14:00', '20170822', '书的id', '4');
INSERT INTO `message` VALUES ('54', '', '2017-08-22 14:16:00', '空的用户', '书的id', '3');
INSERT INTO `message` VALUES ('55', 'admin', '2017-08-22 14:20:47', '名称用户留言2 ', '书的id', '2');
INSERT INTO `message` VALUES ('56', 'admin', '2017-08-22 16:51:05', '星级1', '书的id', '1');
INSERT INTO `message` VALUES ('57', 'admin', '2017-08-22 17:33:24', '星级1', '书的id', '4');
INSERT INTO `message` VALUES ('58', 'admin', '2017-08-24 17:30:44', '星级评价2', '书的id', '2');
INSERT INTO `message` VALUES ('59', 'admin', '2017-08-24 17:33:37', '星级评价3', '书的id', '3');
INSERT INTO `message` VALUES ('60', 'admin', '2017-08-25 14:55:45', '来我看看星星1', '书的id', '');
INSERT INTO `message` VALUES ('61', 'admin', '2017-08-25 14:55:56', '来我看看星星2', '书的id', '3');
INSERT INTO `message` VALUES ('62', 'admin', '2017-08-28 17:41:24', '五星好评', '书的id', '5');
INSERT INTO `message` VALUES ('63', 'xiaohong', '2017-08-29 09:21:43', '还行吧\r\n', '书的id', '3');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL auto_increment,
  `notice_title` varchar(255) default NULL,
  `notice_content` varchar(255) default NULL,
  `notice_date` varchar(255) default NULL,
  `notice_level` int(11) default NULL,
  PRIMARY KEY  (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('3', '3', '3', '3', '3');
INSERT INTO `notice` VALUES ('4', '4', '4', '4', '4');
INSERT INTO `notice` VALUES ('5', '5', '5', '5', '5');
INSERT INTO `notice` VALUES ('6', '6', '6', '6', '6');
INSERT INTO `notice` VALUES ('8', '标题改2', '正文改2', '2017-08-17 15:16:58', '1');
INSERT INTO `notice` VALUES ('12', '我是公告标题', '我是公告内容', '2017-08-17 14:34:03', '1');
INSERT INTO `notice` VALUES ('13', '添加公告信息标题', '添加公告信息内容', '2017-08-17 16:09:30', '1');
INSERT INTO `notice` VALUES ('14', '1', '1', '2017-08-17 16:10:21', '1');
INSERT INTO `notice` VALUES ('15', '添加公告信息标题1', '添加公告信息内容1', '2017-08-17 16:10:41', '1');
INSERT INTO `notice` VALUES ('16', '2', '2', '2017-08-17 16:12:06', '1');
INSERT INTO `notice` VALUES ('17', 'cxxxxxxxxxxxxxxxx', '啛啛喳喳错错错错错错错错错错错￥￥￥￥￥￥￥&&&&&&&&）））', '2017-08-28 17:47:23', '1');
INSERT INTO `notice` VALUES ('18', 'dxdddddddd', 'dsffffffffffffffffffffffffffffffffffff%%%%%%%%%^^^^&&&*&*', '2017-08-28 17:47:54', '1');

-- ----------------------------
-- Table structure for noticeforuser
-- ----------------------------
DROP TABLE IF EXISTS `noticeforuser`;
CREATE TABLE `noticeforuser` (
  `user_id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `readtime` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of noticeforuser
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `order_state` int(11) default NULL,
  `access` int(11) default NULL,
  `buy_date` date default NULL,
  `amount` double default NULL,
  `pay_date` date default NULL,
  `deal_state` int(11) default NULL,
  `order_delete` varchar(255) default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('40', '15', '1', '1', '2017-11-01', '50.9', '2017-08-22', '1', '0');
INSERT INTO `order` VALUES ('41', '15', '1', '1', '2017-08-23', '64', '2017-08-22', '1', '0');
INSERT INTO `order` VALUES ('42', '15', '1', '0', '2017-08-23', '55', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('43', '15', '1', '0', '2017-08-23', '50.9', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('44', '15', '0', '0', '2017-08-23', '50.9', null, '0', '1');
INSERT INTO `order` VALUES ('45', '15', '1', '0', '2017-08-23', '70', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('46', '15', '1', '0', '2017-08-23', '53.2', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('47', '15', '0', '0', '2017-08-23', '64', '2017-08-23', '0', '1');
INSERT INTO `order` VALUES ('48', '15', '1', '0', '2017-08-23', '58', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('49', '15', '0', '0', '2017-08-23', '70', null, '0', '0');
INSERT INTO `order` VALUES ('50', '15', '0', '0', '2017-08-23', '70', null, '0', '0');
INSERT INTO `order` VALUES ('51', '15', '0', '0', '2017-08-23', '58', null, '0', '0');
INSERT INTO `order` VALUES ('52', '15', '1', '0', '2017-08-23', '70', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('53', '15', '0', '0', '2017-08-23', '120.9', null, '0', '0');
INSERT INTO `order` VALUES ('54', '16', '1', '1', '2017-08-23', '50.9', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('55', '16', '1', '0', '2017-08-23', '50.9', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('56', '16', '1', '0', '2017-08-23', '70', '2017-08-23', '1', '0');
INSERT INTO `order` VALUES ('57', '15', '0', '0', '2017-08-28', '55', null, '0', '0');
INSERT INTO `order` VALUES ('58', '15', '0', '0', '2017-08-28', '55', null, '0', '0');
INSERT INTO `order` VALUES ('59', '21', '1', '0', '2017-08-28', '74495', '2017-08-28', '1', '0');
INSERT INTO `order` VALUES ('60', '21', '1', '0', '2017-08-28', '74959.1', '2017-08-28', '1', '0');
INSERT INTO `order` VALUES ('61', '21', '1', '0', '2017-08-28', '67', '2017-08-28', '1', '0');
INSERT INTO `order` VALUES ('75', '19', '0', '0', '2017-08-29', '80', null, '0', '1');
INSERT INTO `order` VALUES ('76', '22', '1', '0', '2017-08-30', '67', '2017-08-30', '1', '1');
INSERT INTO `order` VALUES ('77', '22', '1', '1', '2017-08-30', '70', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('78', '22', '0', '0', '2017-08-30', '67', null, '0', '1');
INSERT INTO `order` VALUES ('79', '22', '1', '0', '2017-08-30', '67', null, '0', '0');
INSERT INTO `order` VALUES ('80', '22', '0', '0', '2017-08-30', '70', null, '0', '1');
INSERT INTO `order` VALUES ('81', '22', '1', '0', '2017-08-30', '116', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('82', '22', '1', '0', '2017-08-30', '70', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('83', '22', '1', '0', '2017-08-30', '70', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('84', '22', '1', '0', '2017-08-30', '58', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('85', '22', '0', '0', '2017-08-30', '0', null, '0', '1');
INSERT INTO `order` VALUES ('86', '22', '0', '0', '2017-08-30', '60', null, '0', '1');
INSERT INTO `order` VALUES ('87', '22', '0', '0', '2017-08-30', '60', null, '0', '1');
INSERT INTO `order` VALUES ('88', '22', '1', '0', '2017-08-30', '56', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('89', '22', '1', '0', '2017-08-30', '54', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('90', '22', '1', '0', '2017-08-30', '80', '2017-08-30', '1', '0');
INSERT INTO `order` VALUES ('91', '22', '0', '0', '2017-08-30', '80', null, '0', '1');
INSERT INTO `order` VALUES ('92', '22', '0', '0', '2017-08-30', '53.2', null, '0', '0');
INSERT INTO `order` VALUES ('93', '36', '0', '0', '2017-08-30', '67', null, '0', '0');

-- ----------------------------
-- Table structure for orderbooks
-- ----------------------------
DROP TABLE IF EXISTS `orderbooks`;
CREATE TABLE `orderbooks` (
  `books_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `cart_id` int(11) default NULL,
  `book_id` int(11) default NULL,
  `number` int(11) default NULL,
  PRIMARY KEY  (`books_id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderbooks
-- ----------------------------
INSERT INTO `orderbooks` VALUES ('41', '40', '283', '3', '1');
INSERT INTO `orderbooks` VALUES ('42', '41', '284', '15', '1');
INSERT INTO `orderbooks` VALUES ('43', '42', '286', '1', '1');
INSERT INTO `orderbooks` VALUES ('44', '43', '287', '3', '1');
INSERT INTO `orderbooks` VALUES ('45', '44', '282', '3', '1');
INSERT INTO `orderbooks` VALUES ('46', '45', '269', '8', '1');
INSERT INTO `orderbooks` VALUES ('47', '46', '289', '5', '1');
INSERT INTO `orderbooks` VALUES ('48', '47', '284', '15', '1');
INSERT INTO `orderbooks` VALUES ('49', '48', '230', '7', '1');
INSERT INTO `orderbooks` VALUES ('50', '49', '275', '6', '1');
INSERT INTO `orderbooks` VALUES ('51', '50', '290', '6', '1');
INSERT INTO `orderbooks` VALUES ('52', '51', '291', '7', '1');
INSERT INTO `orderbooks` VALUES ('53', '52', '231', '8', '1');
INSERT INTO `orderbooks` VALUES ('54', '53', '292', '8', '1');
INSERT INTO `orderbooks` VALUES ('55', '53', '293', '3', '1');
INSERT INTO `orderbooks` VALUES ('56', '54', '301', '3', '1');
INSERT INTO `orderbooks` VALUES ('57', '55', '302', '3', '1');
INSERT INTO `orderbooks` VALUES ('58', '56', '309', '8', '1');
INSERT INTO `orderbooks` VALUES ('59', '57', '323', '1', '1');
INSERT INTO `orderbooks` VALUES ('60', '58', '323', '1', '1');
INSERT INTO `orderbooks` VALUES ('61', '59', '326', '18', '1111');
INSERT INTO `orderbooks` VALUES ('62', '59', '330', '7', '1');
INSERT INTO `orderbooks` VALUES ('63', '60', '325', '2', '5');
INSERT INTO `orderbooks` VALUES ('64', '60', '326', '18', '1111');
INSERT INTO `orderbooks` VALUES ('65', '60', '327', '3', '1');
INSERT INTO `orderbooks` VALUES ('66', '60', '328', '4', '1');
INSERT INTO `orderbooks` VALUES ('67', '60', '329', '5', '1');
INSERT INTO `orderbooks` VALUES ('68', '60', '330', '7', '1');
INSERT INTO `orderbooks` VALUES ('69', '61', '331', '18', '1');
INSERT INTO `orderbooks` VALUES ('75', '75', '332', '19', '1');
INSERT INTO `orderbooks` VALUES ('76', '76', '335', '18', '1');
INSERT INTO `orderbooks` VALUES ('77', '77', '341', '8', '1');
INSERT INTO `orderbooks` VALUES ('78', '78', '342', '18', '1');
INSERT INTO `orderbooks` VALUES ('79', '79', '342', '18', '1');
INSERT INTO `orderbooks` VALUES ('80', '80', '359', '8', '1');
INSERT INTO `orderbooks` VALUES ('81', '81', '360', '7', '2');
INSERT INTO `orderbooks` VALUES ('82', '82', '359', '8', '1');
INSERT INTO `orderbooks` VALUES ('83', '83', '357', '6', '1');
INSERT INTO `orderbooks` VALUES ('84', '84', '358', '7', '1');
INSERT INTO `orderbooks` VALUES ('85', '85', '355', '4', '1');
INSERT INTO `orderbooks` VALUES ('86', '86', '355', '4', '1');
INSERT INTO `orderbooks` VALUES ('87', '87', '361', '4', '1');
INSERT INTO `orderbooks` VALUES ('88', '88', '364', '9', '1');
INSERT INTO `orderbooks` VALUES ('89', '89', '365', '11', '1');
INSERT INTO `orderbooks` VALUES ('90', '90', '366', '16', '1');
INSERT INTO `orderbooks` VALUES ('91', '91', '367', '20', '1');
INSERT INTO `orderbooks` VALUES ('92', '92', '368', '5', '1');
INSERT INTO `orderbooks` VALUES ('93', '93', '369', '18', '1');

-- ----------------------------
-- Table structure for statistics_log
-- ----------------------------
DROP TABLE IF EXISTS `statistics_log`;
CREATE TABLE `statistics_log` (
  `visit_ip` varchar(40) NOT NULL,
  `visit_sum` int(11) default NULL,
  `visit_success` int(11) default NULL,
  `proportion` double(5,2) default NULL,
  PRIMARY KEY  (`visit_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statistics_log
-- ----------------------------
INSERT INTO `statistics_log` VALUES ('0:0:0:0:0:0:0:1', '79', '75', '94.00');
INSERT INTO `statistics_log` VALUES ('10.55.15.241', '32', '28', '87.00');
INSERT INTO `statistics_log` VALUES ('127.0.0.1', '197', '183', '91.00');

-- ----------------------------
-- Table structure for sysoperatelog
-- ----------------------------
DROP TABLE IF EXISTS `sysoperatelog`;
CREATE TABLE `sysoperatelog` (
  `log_id` int(11) NOT NULL auto_increment,
  `user_name` varchar(100) default NULL,
  `table_name` varchar(100) default NULL,
  `result` varchar(100) default NULL,
  `module` varchar(100) default NULL,
  `operation` varchar(100) default NULL,
  `create_time` datetime default NULL,
  `visit_ip` varchar(100) default NULL,
  `local_ip` varchar(100) default NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysoperatelog
-- ----------------------------
INSERT INTO `sysoperatelog` VALUES ('11', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 16:17:55', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('12', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-24 16:29:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('13', 'admin', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-24 16:45:23', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('14', 'admin', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-24 16:45:23', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('15', 'admin', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-24 16:45:27', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('16', 'admin', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-24 16:45:27', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('17', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 16:45:45', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('18', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 16:45:48', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('19', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:06:41', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('20', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:09:08', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('21', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:09:14', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('22', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:09:20', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('23', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:36:45', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('24', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:36:51', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('25', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:37:09', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('26', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:09', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('27', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:14', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('28', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-24 17:37:15', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('29', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:16', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('30', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-24 17:37:24', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('31', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:24', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('32', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:28', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('33', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:31', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('34', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-24 17:37:33', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('35', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:34', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('36', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:39', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('37', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:37:50', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('38', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:39:33', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('39', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:39:37', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('40', 'gaohuan', '购物车表', 'FAILED', '菜单管理', '删除', '2017-08-24 17:39:41', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('41', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:39:42', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('42', 'gaohuan', '购物车表', 'FAILED', '菜单管理', '删除', '2017-08-24 17:40:11', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('43', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:40:13', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('44', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:42:38', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('45', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:42:44', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('46', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:42:47', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('47', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:50:47', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('48', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:51:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('49', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:08', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('50', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:52:29', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('51', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:29', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('52', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:52:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('53', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('54', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-24 17:52:46', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('55', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:52:46', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('56', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 17:54:02', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('57', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:54:02', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('58', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:54:05', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('59', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:56:36', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('60', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-24 17:56:40', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('61', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 17:56:40', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('62', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:05:41', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('63', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-24 18:06:01', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('64', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:06:01', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('65', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:06:05', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('66', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '修改', '2017-08-24 18:07:00', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('67', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:07:04', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('68', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:07:38', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('69', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:10:43', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('70', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:12:23', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('71', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:14:01', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('72', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:15:58', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('73', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:17:12', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('74', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:18:52', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('75', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:19:57', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('76', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:20:37', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('77', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:21:12', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('78', '未登录', '用户信息表', 'FAILED', '用户信息管理', '修改', '2017-08-24 18:21:52', '10.55.15.241', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('79', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 18:24:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('80', '未登录', '用户信息表', 'SUCCESS', '用户信息管理', '修改', '2017-08-24 18:24:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('81', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-24 21:43:01', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('100', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-25 10:19:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('101', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-25 10:19:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('102', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-25 10:19:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('113', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 14:38:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('114', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 14:38:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('115', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 14:38:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('116', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:34:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('117', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:35:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('118', 'gaohuan', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-28 17:35:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('119', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 17:35:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('120', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:35:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('121', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:35:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('122', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 17:36:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('123', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:36:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('124', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 17:36:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('125', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:36:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('126', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:36:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('127', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('128', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-28 17:39:09', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('129', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('130', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-28 17:39:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('131', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('132', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-28 17:39:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('133', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('134', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:39:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('135', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('136', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('137', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('138', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:40:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('139', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:42:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('140', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:42:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('141', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:42:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('142', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:43:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('143', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:43:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('144', 'admin', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-28 17:40:57', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('145', 'admin', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 17:41:08', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('146', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:41:08', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('147', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('148', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('149', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('150', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('151', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('152', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('153', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('154', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:20', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('155', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:51:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('156', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-28 17:54:24', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('157', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:54:24', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('158', 'aaaaa', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:54:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('159', 'aaaaa', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:56:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('160', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:49:53', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('161', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:01', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('162', 'admin', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:50:06', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('163', '张三', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-28 17:57:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('164', 'aaaaaa', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-28 17:57:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('165', 'aaaaaa', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-28 17:57:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('166', 'aaaaaa', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-28 17:57:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('167', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:58:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('168', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-28 17:58:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('169', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-28 17:59:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('170', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('171', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('172', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('173', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('174', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('175', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 17:59:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('176', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('177', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('178', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 17:59:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('179', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 18:00:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('180', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('181', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:27', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('182', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('183', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('184', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('185', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('186', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('187', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:00:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('188', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 18:01:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('189', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:01:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('190', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('191', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('192', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('193', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('194', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('195', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('196', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('197', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:02:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('198', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('199', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('200', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('201', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('202', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:05:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('203', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('204', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('205', 'abc123', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('206', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-28 18:06:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('207', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:06:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('208', 'abc123', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:07:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('209', 'abc123', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:07:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('210', 'abc123', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-28 18:08:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('211', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:19:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('212', 'xiaoming', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-29 09:20:30', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('213', 'xiaoming', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-29 09:21:05', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('214', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 09:21:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('215', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:21:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('216', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:21', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('217', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('218', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:25', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('219', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('220', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:53', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('221', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('222', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 09:23:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('223', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:23:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('224', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('225', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:19', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('226', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('227', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 09:24:28', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('228', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:28', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('229', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:24:53', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('230', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:33', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('231', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:41', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('232', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:49', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('233', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:25:52', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('234', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:51:48', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('235', 'xiaoming', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-29 09:52:06', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('236', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 09:52:24', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('237', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:52:24', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('238', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:52:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('239', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 09:52:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('240', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:05', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('241', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 10:36:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('242', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('243', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('244', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:36:38', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('245', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:18', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('246', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:40', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('247', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:41', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('248', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 10:37:48', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('249', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:03:25', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('250', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:22:17', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('251', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 11:22:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('252', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:22:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('253', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:22:40', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('254', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:35', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('255', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('256', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:43', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('257', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('258', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:38:49', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('259', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:24', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('260', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('261', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('262', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:41:58', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('263', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:42:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('264', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-29 11:42:04', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('265', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:42:04', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('266', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 11:42:16', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('267', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 11:42:16', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('268', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:03', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('269', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:06', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('270', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:00:10', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('271', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:10', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('272', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:54', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('273', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:00:55', '0:0:0:0:0:0:0:1', '10.55.15.89');
INSERT INTO `sysoperatelog` VALUES ('274', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:11', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('275', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:40:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('276', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('277', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:28', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('278', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:40:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('279', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:40:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('280', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:01', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('281', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:05', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('282', 'xiaohong', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-29 12:42:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('283', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:42:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('284', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('285', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('286', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:42:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('287', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:42:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('288', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:43:41', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('289', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:43:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('290', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:43:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('291', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:44:01', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('292', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:44:03', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('293', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:44:03', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('294', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:44:57', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('295', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:45:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('296', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:45:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('297', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:45:33', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('298', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:45:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('299', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:45:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('300', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:50:43', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('301', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 12:50:54', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('302', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:50:54', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('303', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:50:58', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('304', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 12:51:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('305', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:51:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('306', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 12:57:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('307', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:14', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('308', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 13:00:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('309', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('310', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:26', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('311', 'xiaohong', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('312', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:40', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('313', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:44', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('314', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:00:47', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('315', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:00:47', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('316', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:06:33', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('317', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:06:37', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('318', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:06:38', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('319', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:06:38', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('320', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:12', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('321', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:19', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('322', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:27', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('323', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:30', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('324', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:11:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('325', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:11:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('326', 'xiaohong', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:14:23', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('327', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:29', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('328', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-29 13:17:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('329', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:31', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('330', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('331', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-29 13:17:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('332', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:46', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('333', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 13:17:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('334', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:17:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('335', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:18:02', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('336', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:17', '127.0.0.1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('337', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:22', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('338', 'xiaohong', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-29 13:30:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('339', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:36', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('340', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:30:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('341', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 13:52:11', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('342', 'xiaohong', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 14:06:08', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('343', 'xiaohong', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-29 14:06:12', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('344', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 08:58:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('345', 'gaohuan', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-30 08:58:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('346', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 08:59:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('347', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:00:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('348', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:00:51', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('349', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 09:01:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('350', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('351', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('352', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('353', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('354', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:01:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('355', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('356', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:01:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('357', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('358', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('359', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:02:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('360', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('361', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:02:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('362', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:04:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('363', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:04:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('364', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:04:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('365', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('366', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 09:05:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('367', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('368', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('369', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:05:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('370', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:05:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('371', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('372', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 09:06:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('373', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('374', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:51', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('375', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:06:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('376', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:06:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('377', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:07:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('378', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:07:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('379', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:07:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('380', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:07:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('381', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:10:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('382', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:10:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('383', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:11:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('384', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:11:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('385', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:11:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('386', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:11:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('387', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:18:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('388', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:19:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('389', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:19:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('390', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:19:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('391', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:19:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('392', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:21:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('393', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:21:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('394', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:21:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('395', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:25:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('396', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:28:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('397', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:28:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('398', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:28:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('399', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:30:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('400', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:30:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('401', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:31:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('402', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:31:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('403', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:31:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('404', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:32:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('405', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:32:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('406', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:34:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('407', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:35:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('408', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:35:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('409', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:35:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('410', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:36:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('411', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:36:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('412', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:36:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('413', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('414', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('415', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:56', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('416', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:37:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('417', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:37:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('418', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-30 09:38:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('419', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('420', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-30 09:38:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('421', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('422', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('423', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('424', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 09:38:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('425', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('426', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:38:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('427', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:48:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('428', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-30 09:48:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('429', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:48:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('430', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:49:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('431', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:49:09', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('432', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:49:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('433', 'xiaoli', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 09:50:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('434', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:50:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('435', '未登录', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:51:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('436', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:51:27', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('437', 'xiaoli', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 09:51:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('438', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:51:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('439', 'xiaoli', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 09:52:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('440', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:52:59', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('441', 'xiaoli', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 09:53:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('442', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:53:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('443', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:53:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('444', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 09:55:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('445', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:55:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('446', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:55:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('447', 'xiaoli', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:56:52', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('448', 'xiaoli', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 09:56:58', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('449', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:57:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('450', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 09:58:25', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('451', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 09:59:02', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('452', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:03:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('453', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('454', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:05:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('455', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:05:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('456', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:06:20', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('457', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:08:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('458', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:08:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('459', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:08:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('460', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:09:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('461', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:13:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('462', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:14:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('463', 'xi', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:14:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('464', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:14:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('465', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:18:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('466', '231', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:18:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('467', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:20:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('468', '12313', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:20:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('469', '12313', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:21:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('470', '3431', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:21:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('471', 'xi', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:23:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('472', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:23:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('473', '321', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:23:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('474', '321', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:25:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('475', '321', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:25:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('476', '321', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 10:26:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('477', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 10:27:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('478', '312', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:27:05', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('479', '312qwew', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:27:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('480', '312qwew', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 10:27:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('481', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 11:52:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('482', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 13:45:01', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('483', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 13:45:15', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('484', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 13:45:15', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('485', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 13:45:21', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('486', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('487', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:09:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('488', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('489', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('490', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:09:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('491', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:09:40', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('492', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:10:07', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('493', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '删除', '2017-08-30 14:10:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('494', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:10:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('495', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:10:16', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('496', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('497', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:19:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('498', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:18', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('499', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('500', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('501', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:43', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('502', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('503', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('504', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:17', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('505', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:27', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('506', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('507', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:20:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('508', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:31', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('509', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('510', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:42', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('511', 'gaohuan', '图书评价表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:22:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('512', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:22:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('513', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:22:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('514', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:22:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('515', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('516', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('517', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('518', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('519', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('520', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('521', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('522', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:24:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('523', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('524', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:54', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('525', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:19:39', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('526', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:20:50', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('527', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:06', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('528', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:13', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('529', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:18', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('530', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:21:20', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('531', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:32', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('532', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-30 14:23:34', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('533', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:34', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('534', 'gaohuan', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-30 14:23:45', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('535', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:23:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('536', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:56', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('537', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:23:59', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('538', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:09', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('539', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:24:34', '0:0:0:0:0:0:0:1', '10.55.15.41');
INSERT INTO `sysoperatelog` VALUES ('540', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('541', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:34:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('542', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:26', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('543', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:32', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('544', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:33', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('545', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:34:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('546', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('547', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('548', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:44', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('549', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:34:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('550', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:34:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('551', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:35:04', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('552', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:35:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('553', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:36', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('554', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('555', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:36:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('556', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:41', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('557', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:36:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('558', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:22', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('559', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:40:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('560', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:39', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('561', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('562', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:40:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('563', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:40:49', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('564', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:41:08', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('565', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:41:56', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('566', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:42:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('567', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:42:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('568', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:42:03', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('569', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:42:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('570', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:43:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('571', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:43:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('572', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:43:53', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('573', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('574', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:52:29', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('575', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:30', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('576', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:35', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('577', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 14:52:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('578', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:52:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('579', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:53:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('580', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:59:28', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('581', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 14:59:42', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('582', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:59:42', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('583', '高欢', '用户信息表', 'SUCCESS', '用户信息管理', '退出系统', '2017-08-30 14:59:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('584', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 14:59:55', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('585', '31231', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:00:01', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('586', 'abc123', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 15:02:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('587', 'abc123', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:02:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('588', 'abc123', '用户信息表', 'FAILED', '用户信息管理', '用户注册', '2017-08-30 15:02:06', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('589', '124abc', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:02:46', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('590', '124abc', '用户信息表', 'SUCCESS', '用户信息管理', '用户注册', '2017-08-30 15:03:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('591', '123abc', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-30 15:03:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('592', '123abc', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-30 15:04:15', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('593', '123abc', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-08-30 15:04:50', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('594', '123abc', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-08-30 15:05:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('595', '123abc', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:11', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('596', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:13', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('597', '123abc', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:34', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('598', '123abc', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:37', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('599', '123abc', '购物车表', 'SUCCESS', '菜单管理', '新增', '2017-08-30 15:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('600', '123abc', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:05:38', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('601', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:00', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('602', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('603', '123abc', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:12', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('604', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:06:14', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('605', '123abc', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-08-30 15:08:05', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('606', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:11:19', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('607', 'gaohuan', '用户信息表', 'FAILED', '用户信息管理', '登录系统', '2017-09-12 14:12:10', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('608', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-09-12 14:12:21', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('609', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:21', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('610', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:24', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('611', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:45', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('612', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:12:57', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('613', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:13:09', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('614', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-12 14:20:23', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('615', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-13 16:24:47', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('616', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-13 16:24:48', '127.0.0.1', '10.55.15.14');
INSERT INTO `sysoperatelog` VALUES ('617', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-14 16:11:18', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('618', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-18 17:00:00', '127.0.0.1', '10.55.15.60');
INSERT INTO `sysoperatelog` VALUES ('619', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-18 17:00:01', '127.0.0.1', '10.55.15.60');
INSERT INTO `sysoperatelog` VALUES ('620', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-18 17:04:32', '127.0.0.1', '10.55.15.60');
INSERT INTO `sysoperatelog` VALUES ('621', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-19 15:45:40', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('622', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-21 10:31:17', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('623', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-21 10:31:18', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('624', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-22 11:41:40', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('625', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-22 11:41:41', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('626', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-25 08:49:59', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('627', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-25 08:50:00', '127.0.0.1', '192.168.191.1');
INSERT INTO `sysoperatelog` VALUES ('628', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-27 14:03:10', '127.0.0.1', '10.55.15.37');
INSERT INTO `sysoperatelog` VALUES ('629', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-27 14:03:10', '127.0.0.1', '10.55.15.37');
INSERT INTO `sysoperatelog` VALUES ('630', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 16:46:33', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('631', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 16:46:43', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('632', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 16:46:50', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('633', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 16:47:03', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('634', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 16:47:07', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('635', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 16:47:15', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('636', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:14:02', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('637', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:22:33', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('638', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:22:35', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('639', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:22:37', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('640', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:22:44', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('641', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:23:37', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('642', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:23:45', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('643', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:24:00', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('644', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:24:05', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('645', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:25:03', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('646', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:25:09', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('647', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:25:13', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('648', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:26:02', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('649', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:26:05', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('650', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-28 17:26:09', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('651', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-09-29 14:56:15', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('652', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-29 14:56:19', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('653', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-09-29 14:56:23', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('654', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-10-16 10:24:44', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('655', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-10-16 10:26:28', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('656', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-10-16 10:29:09', '127.0.0.1', '169.254.54.4');
INSERT INTO `sysoperatelog` VALUES ('657', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-10-24 10:57:06', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('658', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-12-08 14:26:49', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('659', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-12-08 14:26:54', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('660', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2017-12-08 14:27:15', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('661', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2017-12-08 14:27:15', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('662', 'gaohuan', '购物车表', 'SUCCESS', '菜单管理', '查询', '2017-12-08 14:27:27', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('663', 'gaohuan', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2017-12-08 14:40:17', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('664', 'gaohuan', '用户信息表、订单表、图书评价表', 'SUCCESS', '菜单管理', '查询', '2017-12-08 14:40:27', '127.0.0.1', '10.55.15.15');
INSERT INTO `sysoperatelog` VALUES ('665', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2018-03-02 14:40:04', '127.0.0.1', '10.55.15.17');
INSERT INTO `sysoperatelog` VALUES ('666', '未登录', '图书类型表', 'SUCCESS', '菜单管理', '查询', '2018-03-02 14:40:07', '127.0.0.1', '10.55.15.17');
INSERT INTO `sysoperatelog` VALUES ('667', 'gaohuan', '用户信息表', 'SUCCESS', '用户信息管理', '登录系统', '2018-03-02 14:40:21', '127.0.0.1', '10.55.15.17');
INSERT INTO `sysoperatelog` VALUES ('668', 'gaohuan', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2018-03-02 14:40:21', '127.0.0.1', '10.55.15.17');
INSERT INTO `sysoperatelog` VALUES ('669', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2018-03-02 15:12:46', '127.0.0.1', '10.55.15.17');
INSERT INTO `sysoperatelog` VALUES ('670', '未登录', '图书信息表', 'SUCCESS', '菜单管理', '查询', '2018-03-15 12:21:52', '127.0.0.1', '10.55.15.17');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '????');
INSERT INTO `test` VALUES ('2', '巴巴爸爸');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_no` varchar(32) default NULL,
  `user_name` varchar(32) default NULL,
  `user_pwd` varchar(32) default NULL,
  `user_phone` varchar(11) default NULL,
  `user_mail` varchar(32) default NULL,
  `user_site` varchar(200) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('16', 'xiaoming', 'xiaoming', '53225b8e3b702c08c9fbc5b87de8064c', '18731190153', '510525666@qqccom', '北京市、昌平区、回龙观东大街');
INSERT INTO `user` VALUES ('18', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '勿动', '勿动', '勿动');
INSERT INTO `user` VALUES ('19', 'xiaohong', 'xiaohong', 'e10adc3949ba59abbe56e057f20f883e', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('20', 'aaaaa', '张三', 'e10adc3949ba59abbe56e057f20f883e', '13511111111', '135xxxxexample.com', null);
INSERT INTO `user` VALUES ('21', 'abc123', '张三', 'e10adc3949ba59abbe56e057f20f883e', '13511111111', 'angsan@example.com', null);
INSERT INTO `user` VALUES ('22', 'gaohuan', '高欢', '53225b8e3b702c08c9fbc5b87de8064c', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('28', 'xiaoli', '小李', 'a9bc7f8b14b68f78492878685e59640a', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('29', 'xi', 'xi', 'a9bc7f8b14b68f78492878685e59640a', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('33', '12313', 'gaohuan', 'a9bc7f8b14b68f78492878685e59640a', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('34', '321', 'gaohuan', 'a9bc7f8b14b68f78492878685e59640a', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('35', '312qwew', 'gaohuan', 'a9bc7f8b14b68f78492878685e59640a', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('36', '123abc', 'gaohuan', 'a9bc7f8b14b68f78492878685e59640a', '15225253086', '971241724@qq.com', null);
INSERT INTO `user` VALUES ('37', '123', '123', null, null, null, null);
INSERT INTO `user` VALUES ('38', '123', '100', null, null, null, null);
INSERT INTO `user` VALUES ('39', '123', '100', null, null, null, null);
INSERT INTO `user` VALUES ('40', '123', '100', null, null, null, null);

-- ----------------------------
-- Table structure for visitorcounter
-- ----------------------------
DROP TABLE IF EXISTS `visitorcounter`;
CREATE TABLE `visitorcounter` (
  `id` int(11) NOT NULL auto_increment,
  `vdate` datetime default NULL,
  `vnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitorcounter
-- ----------------------------
INSERT INTO `visitorcounter` VALUES ('1', '2017-08-23 00:00:00', '90');
INSERT INTO `visitorcounter` VALUES ('2', '2017-08-24 00:00:00', '15');
INSERT INTO `visitorcounter` VALUES ('3', '2017-08-25 00:00:00', '3');
INSERT INTO `visitorcounter` VALUES ('4', '2017-08-28 00:00:00', '4');
INSERT INTO `visitorcounter` VALUES ('5', '2017-08-29 00:00:00', '30');
INSERT INTO `visitorcounter` VALUES ('6', '2017-08-30 00:00:00', '6');
