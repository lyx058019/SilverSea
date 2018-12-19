/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : silverSea

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 19/12/2018 12:56:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for asset
-- ----------------------------
DROP TABLE IF EXISTS `asset`;
CREATE TABLE `asset` (
  `assetId` varchar(50) NOT NULL COMMENT '资产ID',
  `assetName` varchar(50) NOT NULL COMMENT '资产名称',
  `assetTypeId` varchar(50) NOT NULL COMMENT '资产类别ID',
  `assetCount` int(11) NOT NULL DEFAULT '0' COMMENT '资产数量',
  `unitPrice` varchar(20) DEFAULT NULL COMMENT '资产单价',
  `totlePrice` varchar(20) DEFAULT NULL COMMENT '总价',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`assetId`),
  KEY `asset_id` (`assetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产表';

-- ----------------------------
-- Table structure for assetType
-- ----------------------------
DROP TABLE IF EXISTS `assetType`;
CREATE TABLE `assetType` (
  `assetTypeId` varchar(50) NOT NULL,
  `assetTypeName` varchar(50) NOT NULL,
  `partneId` varchar(50) NOT NULL COMMENT '父类别ID',
  PRIMARY KEY (`assetTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for asset_account
-- ----------------------------
DROP TABLE IF EXISTS `asset_account`;
CREATE TABLE `asset_account` (
  `id` varchar(50) NOT NULL,
  `assetId` varchar(50) NOT NULL COMMENT '资产Id',
  `stockId` varchar(50) DEFAULT NULL,
  `accountType` varchar(1) NOT NULL COMMENT '流水类型（ 0入库  1出库）',
  `count` int(11) NOT NULL COMMENT '数量',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `creatTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产库存流水';

-- ----------------------------
-- Table structure for asset_stock
-- ----------------------------
DROP TABLE IF EXISTS `asset_stock`;
CREATE TABLE `asset_stock` (
  `assstockId` varchar(50) NOT NULL,
  `assetId` varchar(50) NOT NULL COMMENT '资产ID',
  `couunt` int(11) NOT NULL,
  PRIMARY KEY (`assstockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产库存表';

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `contactsId` varchar(50) NOT NULL,
  `contactsName` varchar(50) NOT NULL COMMENT '联系人姓名',
  `contactsTel` varchar(50) DEFAULT NULL,
  `customerId` varchar(50) DEFAULT NULL COMMENT '公司ID',
  PRIMARY KEY (`contactsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customerId` varchar(50) NOT NULL,
  `customerName` varchar(50) NOT NULL COMMENT '客户单位名称',
  `customerNature` varchar(50) DEFAULT NULL COMMENT '企业性质',
  `customerAddr` varchar(200) DEFAULT NULL COMMENT '客户地址',
  `customerComment` varchar(200) DEFAULT NULL COMMENT '客户描述',
  PRIMARY KEY (`customerId`),
  KEY `customer_id` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户单位表';

-- ----------------------------
-- Table structure for menuFunction
-- ----------------------------
DROP TABLE IF EXISTS `menuFunction`;
CREATE TABLE `menuFunction` (
  `FunctionID` varchar(50) NOT NULL,
  `FunctionName` varchar(50) NOT NULL COMMENT '菜单名称',
  `IsTop` varchar(50) NOT NULL COMMENT '是否顶级菜单',
  `ParentID` varchar(50) NOT NULL COMMENT '父节点ID',
  `FunctionOpts` varchar(2000) NOT NULL COMMENT '菜单子权限',
  `FunctionIndex` varchar(50) NOT NULL COMMENT '菜单序号',
  `MenuName` varchar(50) NOT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FunctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of menuFunction
-- ----------------------------
BEGIN;
INSERT INTO `menuFunction` VALUES ('03303b2a-f6f5-42fe-b73f-054473f81c63', '企业管理', '0', 'fe88c3af-0ad1-47d0-b2be-e8b78038b128', '[{\"id\":\"customer_qry\",\"text\":\"查询\"},{\"id\":\"customer_add\",\"text\":\"新增\"},{\"id\":\"customer_del\",\"text\":\"删除\"},{\"id\":\"customer_update\",\"text\":\"修改\"}]', '1', 'customerManage', NULL);
INSERT INTO `menuFunction` VALUES ('0eec34f6-ddb5-452e-89e7-785e78d40850', '角色管理', '0', '8f5ff5dd-fffa-4227-9d51-c3f40a3b2233', '[{\"id\":\"role_qry\",\"text\":\"角色查询\"},{\"id\":\"role_add\",\"text\":\"新增\"},{\"id\":\"role_del\",\"text\":\"删除\"},{\"id\":\"role_update\",\"text\":\"修改\"}]', '1', 'roleManage', NULL);
INSERT INTO `menuFunction` VALUES ('24f4c53e-73f4-4c39-8c1c-e001cc8f4561', '产品类别管理', '0', 'e64af5e2-7b1b-4abb-b2b1-4001b161d792', '[{\"id\":\"productType_add\",\"text\":\"新增类别\"},{\"id\":\"productType_del\",\"text\":\"删除类别\"},{\"id\":\"productType_update\",\"text\":\"修改类别\"},{\"id\":\"productType_qry\",\"text\":\"类别查询\"}]', '1', 'productType', NULL);
INSERT INTO `menuFunction` VALUES ('32331f2b-5a01-483d-acdf-faec39095e22', '产品管理', '0', 'e64af5e2-7b1b-4abb-b2b1-4001b161d792', '[{\"id\":\"product_add\",\"text\":\"新增产品\"},{\"id\":\"product_del\",\"text\":\"删除产品\"},{\"id\":\"product_update\",\"text\":\"修改产品\"},{\"id\":\"product_qry\",\"text\":\"产品查询\"}]', '2', 'product', NULL);
INSERT INTO `menuFunction` VALUES ('88fd6a7c-335d-4ace-aef2-7422c283ec23', '库存统计', '0', 'a5cf03bd-d0a0-4da6-a1a7-97a4881870cb', '[{\"id\":\"stockStatistics_qry\",\"text\":\"产品库存查询\"}]', '3', 'stockStatistics', NULL);
INSERT INTO `menuFunction` VALUES ('8f5ff5dd-fffa-4227-9d51-c3f40a3b2233', '系统管理', '1', '', '[]', '1', 'sysManage', 'fa fa-dashboard');
INSERT INTO `menuFunction` VALUES ('8f5ff5dd-fffa-4227-9d51-c3f40a3b9648', '用户管理', '0', '8f5ff5dd-fffa-4227-9d51-c3f40a3b2233', '[{\"id\":\"user_add\",\"text\":\"新增\"},{\"id\":\"user_del\",\"text\":\"删除\"},{\"id\":\"user_update\",\"text\":\"修改\"},{\"id\":\"user_qry\",\"text\":\"用户查询\"}]', '2', 'userManage', NULL);
INSERT INTO `menuFunction` VALUES ('a5cf03bd-d0a0-4da6-a1a7-97a4881870cb', '产品库存', '1', ' ', '[]', '3', 'stockManage', 'fa fa-archive');
INSERT INTO `menuFunction` VALUES ('ae992dfb-01ab-461c-89db-8df467baed56', '客户通讯录', '0', 'fe88c3af-0ad1-47d0-b2be-e8b78038b128', '[{\"id\":\"contacts_qry\",\"text\":\"查询\"},{\"id\":\"contacts_add\",\"text\":\"新增\"},{\"id\":\"contacts_del\",\"text\":\"删除\"},{\"id\":\"contacts_update\",\"text\":\"修改\"}]', '2', 'contactsManage', NULL);
INSERT INTO `menuFunction` VALUES ('bd2fc1b2-eb9d-4fa4-a049-1c6141ac4d3f', '产品入库', '0', 'a5cf03bd-d0a0-4da6-a1a7-97a4881870cb', '[{\"id\":\"productStorage_add\",\"text\":\"产品入库\"},{\"id\":\"productStorage_del\",\"text\":\"入库删除\"},{\"id\":\"productStorage_update\",\"text\":\"入库修改\"},{\"id\":\"productStorage_qry\",\"text\":\"入库查询\"}]', '1', 'productStorage', NULL);
INSERT INTO `menuFunction` VALUES ('e64af5e2-7b1b-4abb-b2b1-4001b161d792', '产品维护', '1', '', '[]', '2', 'productManage', 'fa fa-tree');
INSERT INTO `menuFunction` VALUES ('fe88c3af-0ad1-47d0-b2be-e8b78038b128', '客户管理', '1', ' ', '[]', '4', 'customerManage', 'fa fa-users');
INSERT INTO `menuFunction` VALUES ('fffdc5f5-63ca-497c-a416-9aafb3c7646c', '产品出库', '0', 'a5cf03bd-d0a0-4da6-a1a7-97a4881870cb', '[{\"id\":\"productOutgoing_add\",\"text\":\"产品出库\"},{\"id\":\"productOutgoing_del\",\"text\":\"出库删除\"},{\"id\":\"productOutgoing_update\",\"text\":\"出库修改\"},{\"id\":\"productOutgoing_qry\",\"text\":\"出库查询\"}]', '2', 'productOutgoing', NULL);
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderId` varchar(50) NOT NULL,
  `orderName` varchar(200) NOT NULL COMMENT '订单名称',
  `customerId` varchar(50) NOT NULL COMMENT '订单公司id',
  `orderPrice` varchar(50) DEFAULT NULL COMMENT '订单金额',
  `creatTime` datetime NOT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` varchar(50) NOT NULL,
  `orderId` varchar(50) NOT NULL COMMENT '订单id',
  `productId` varchar(50) NOT NULL COMMENT '产品id',
  `productCount` int(11) NOT NULL COMMENT '产品数量',
  `unitPrice` varchar(50) DEFAULT NULL COMMENT '单价',
  `totlePrice` varchar(50) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单产品表';

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` varchar(50) NOT NULL COMMENT '产品ID',
  `productName` varchar(50) NOT NULL COMMENT '产品名称',
  `comment` varchar(200) DEFAULT NULL,
  `productTypeId` varchar(50) NOT NULL COMMENT '产品类别id',
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES ('1d77de29-aca1-4c9d-9b40-0d727139e4ef', '12311111', '1123', '26c22084-eb74-42d0-bb7e-8d4c2c7d4c84');
COMMIT;

-- ----------------------------
-- Table structure for productType
-- ----------------------------
DROP TABLE IF EXISTS `productType`;
CREATE TABLE `productType` (
  `productTypeId` varchar(50) NOT NULL,
  `productTypeName` varchar(50) NOT NULL COMMENT '产品类别名称',
  `comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`productTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类别表';

-- ----------------------------
-- Records of productType
-- ----------------------------
BEGIN;
INSERT INTO `productType` VALUES ('0a027105-2d57-4efe-b619-c6371135b40f', '建材', NULL);
INSERT INTO `productType` VALUES ('26c22084-eb74-42d0-bb7e-8d4c2c7d4c84', '指针式油位计', NULL);
INSERT INTO `productType` VALUES ('36a22263-3b59-4935-8ad8-66460e370f9b', '速动油压继电器', NULL);
INSERT INTO `productType` VALUES ('7d715c55-9c8a-4a33-866c-c912205f72b0', '真空偏心止回阀', NULL);
INSERT INTO `productType` VALUES ('8e5264b2-cdc5-4c68-a29a-3e0c69ff2bd1', '止回阀', NULL);
INSERT INTO `productType` VALUES ('9dcb8f75-dc43-4d2b-abbc-a8a762137951', '油流继电器', NULL);
INSERT INTO `productType` VALUES ('ad3fd271-d052-41a7-a090-4737a03df943', 'YWJ系列管式油位计', NULL);
INSERT INTO `productType` VALUES ('aebea2d8-6ace-4fd6-bad5-2bf7dfcd0bf3', '气体继电器', NULL);
INSERT INTO `productType` VALUES ('f0af342a-b94b-413d-8ec7-8ac06a034472', '压力释放阀', NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_account
-- ----------------------------
DROP TABLE IF EXISTS `product_account`;
CREATE TABLE `product_account` (
  `id` varchar(50) NOT NULL,
  `productId` varchar(50) NOT NULL COMMENT '产品ID',
  `stockId` varchar(50) NOT NULL COMMENT '库存id',
  `accountType` varchar(1) NOT NULL COMMENT '流水类型（0 入库  1 出库）',
  `count` int(11) NOT NULL COMMENT '数量',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  `creattime` datetime NOT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库存流水表';

-- ----------------------------
-- Table structure for product_stock
-- ----------------------------
DROP TABLE IF EXISTS `product_stock`;
CREATE TABLE `product_stock` (
  `prostockId` varchar(50) NOT NULL COMMENT '库存id',
  `productId` varchar(50) NOT NULL COMMENT '产品ID',
  `count` int(11) NOT NULL COMMENT '库存数量',
  PRIMARY KEY (`prostockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库存表';

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` varchar(50) NOT NULL,
  `roleName` varchar(50) NOT NULL COMMENT '角色名称',
  `comment` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('f6bd3021-fbd5-4a35-9228-3c70db1e3618', '管理员', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for role_function
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `id` varchar(50) NOT NULL,
  `roleId` varchar(50) NOT NULL COMMENT '角色id',
  `functionId` varchar(50) NOT NULL COMMENT '菜单id',
  `opts` varchar(8000) NOT NULL COMMENT '功能组',
  `menuName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of role_function
-- ----------------------------
BEGIN;
INSERT INTO `role_function` VALUES ('0a169f58-1fa0-4ef1-97fd-133fc311a368', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '32331f2b-5a01-483d-acdf-faec39095e22', '[{\"id\":\"product_add\",\"text\":\"新增产品\"},{\"id\":\"product_del\",\"text\":\"删除产品\"},{\"id\":\"product_update\",\"text\":\"修改产品\"},{\"id\":\"product_qry\",\"text\":\"产品查询\"}]', 'product');
INSERT INTO `role_function` VALUES ('0c503b9c-d6a3-435b-b810-b8f7be373c6f', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', 'a5cf03bd-d0a0-4da6-a1a7-97a4881870cb', '[]', 'stockManage');
INSERT INTO `role_function` VALUES ('1abfa953-2eac-4c7d-a23e-662005b7d58e', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', 'bd2fc1b2-eb9d-4fa4-a049-1c6141ac4d3f', '[{\"id\":\"productStorage_add\",\"text\":\"产品入库\"},{\"id\":\"productStorage_del\",\"text\":\"入库删除\"},{\"id\":\"productStorage_update\",\"text\":\"入库修改\"},{\"id\":\"productStorage_qry\",\"text\":\"入库查询\"}]', 'productStorage');
INSERT INTO `role_function` VALUES ('1b80a923-a6ee-4994-bda1-6d5e86bdac5c', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '0eec34f6-ddb5-452e-89e7-785e78d40850', '[{\"id\":\"role_qry\",\"text\":\"角色查询\"},{\"id\":\"role_add\",\"text\":\"新增\"},{\"id\":\"role_del\",\"text\":\"删除\"},{\"id\":\"role_update\",\"text\":\"修改\"}]', 'roleManage');
INSERT INTO `role_function` VALUES ('2788e40e-7f9c-4cfe-92c4-3400ab101a9c', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '03303b2a-f6f5-42fe-b73f-054473f81c63', '[{\"id\":\"customer_qry\",\"text\":\"查询\"},{\"id\":\"customer_add\",\"text\":\"新增\"},{\"id\":\"customer_del\",\"text\":\"删除\"},{\"id\":\"customer_update\",\"text\":\"修改\"}]', 'customerManage');
INSERT INTO `role_function` VALUES ('2cca85fc-4add-4f00-8a1e-76224ededce1', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '8f5ff5dd-fffa-4227-9d51-c3f40a3b2233', '[]', 'sysManage');
INSERT INTO `role_function` VALUES ('794a4f85-315d-4390-94ee-1070ebbc48b3', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', 'fe88c3af-0ad1-47d0-b2be-e8b78038b128', '[]', 'customerManage');
INSERT INTO `role_function` VALUES ('809ac233-c9e0-433f-8319-d819106771d9', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', 'ae992dfb-01ab-461c-89db-8df467baed56', '[{\"id\":\"contacts_qry\",\"text\":\"查询\"},{\"id\":\"contacts_add\",\"text\":\"新增\"},{\"id\":\"contacts_del\",\"text\":\"删除\"},{\"id\":\"contacts_update\",\"text\":\"修改\"}]', 'contactsManage');
INSERT INTO `role_function` VALUES ('980c256a-8d3d-44bf-8267-666f368a031a', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '24f4c53e-73f4-4c39-8c1c-e001cc8f4561', '[{\"id\":\"productType_add\",\"text\":\"新增类别\"},{\"id\":\"productType_qry\",\"text\":\"类别查询\"},{\"id\":\"productType_del\",\"text\":\"删除类别\"},{\"id\":\"productType_update\",\"text\":\"修改类别\"}]', 'productType');
INSERT INTO `role_function` VALUES ('9c7e6ede-5682-433d-985d-7953fd65b67d', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '8f5ff5dd-fffa-4227-9d51-c3f40a3b9648', '[{\"id\":\"user_add\",\"text\":\"新增\"},{\"id\":\"user_del\",\"text\":\"删除\"},{\"id\":\"user_update\",\"text\":\"修改\"},{\"id\":\"user_qry\",\"text\":\"用户查询\"}]', 'userManage');
INSERT INTO `role_function` VALUES ('b4ffd3c0-2406-42d6-814e-f3700b8ab6e8', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', 'e64af5e2-7b1b-4abb-b2b1-4001b161d792', '[]', 'productManage');
INSERT INTO `role_function` VALUES ('e98e21b3-0e48-4b74-a9e9-546dc38ad8dd', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', 'fffdc5f5-63ca-497c-a416-9aafb3c7646c', '[{\"id\":\"productOutgoing_add\",\"text\":\"产品出库\"},{\"id\":\"productOutgoing_del\",\"text\":\"出库删除\"},{\"id\":\"productOutgoing_update\",\"text\":\"出库修改\"},{\"id\":\"productOutgoing_qry\",\"text\":\"出库查询\"}]', 'productOutgoing');
INSERT INTO `role_function` VALUES ('f87ef5ef-c6b4-486a-86a6-2f8b11b71363', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618', '88fd6a7c-335d-4ace-aef2-7422c283ec23', '[{\"id\":\"stockStatistics_qry\",\"text\":\"产品库存查询\"}]', 'stockStatistics');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(50) NOT NULL COMMENT 'userid',
  `loginname` varchar(200) NOT NULL DEFAULT '' COMMENT '登录名称',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `username` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `usertel` varchar(20) DEFAULT NULL COMMENT '用户电话',
  `comment` varchar(200) DEFAULT NULL COMMENT '用户备注',
  PRIMARY KEY (`userid`),
  KEY `user_id` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('3045ea0f-9416-4dd4-bc0c-b5201ab7b3e4', 'lyx', 'E10ADC3949BA59ABBE56E057F20F883E', '123123', '123123', '123123');
INSERT INTO `user` VALUES ('b016a828-3e37-4300-af7d-b6ac1db006d1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '管理员', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `roleId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES ('5f53cf0f-ec91-4c7d-b17f-fb7d4eb6997b', 'b016a828-3e37-4300-af7d-b6ac1db006d1', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618');
INSERT INTO `user_role` VALUES ('947e816e-efb2-44cb-863c-512e05ac2b4c', '3045ea0f-9416-4dd4-bc0c-b5201ab7b3e4', 'f6bd3021-fbd5-4a35-9228-3c70db1e3618');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
