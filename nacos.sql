/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 8.0.12 : Database - nacos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nacos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `nacos`;

/*Table structure for table `config_info` */

DROP TABLE IF EXISTS `config_info`;

CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info';

/*Data for the table `config_info` */

insert  into `config_info`(`id`,`data_id`,`group_id`,`content`,`md5`,`gmt_create`,`gmt_modified`,`src_user`,`src_ip`,`app_name`,`tenant_id`,`c_desc`,`c_use`,`effect`,`type`,`c_schema`) values 
(1,'jeecg-dev.yaml','DEFAULT_GROUP','spring:\n  datasource:\n    druid:\n      stat-view-servlet:\n        enabled: true\n        loginUsername: admin\n        loginPassword: 123456\n        allow:\n      web-stat-filter:\n        enabled: true\n    dynamic:\n      druid: # 全局druid参数，绝大部分值和默认保持一致。(现已支持的参数如下,不清楚含义不要乱设置)\n        # 连接池的配置信息\n        # 初始化大小，最小，最大\n        initial-size: 5\n        min-idle: 5\n        maxActive: 20\n        # 配置获取连接等待超时的时间\n        maxWait: 60000\n        # 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒\n        timeBetweenEvictionRunsMillis: 60000\n        # 配置一个连接在池中最小生存的时间，单位是毫秒\n        minEvictableIdleTimeMillis: 300000\n        validationQuery: SELECT 1 FROM DUAL\n        testWhileIdle: true\n        testOnBorrow: false\n        testOnReturn: false\n        # 打开PSCache，并且指定每个连接上PSCache的大小\n        poolPreparedStatements: true\n        maxPoolPreparedStatementPerConnectionSize: 20\n        # 配置监控统计拦截的filters，去掉后监控界面sql无法统计，\'wall\'用于防火墙\n        filters: stat,wall,slf4j\n        # 通过connectProperties属性来打开mergeSql功能；慢SQL记录\n        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000\n\n      datasource:\n        master:\n          url: jdbc:mysql://mysql:3306/mysql?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          username: root\n          password: root\n          driver-class-name: com.mysql.cj.jdbc.Driver\n          # 多数据源配置\n          #multi-datasource1:\n          #url: jdbc:mysql://localhost:3306/jeecg-boot2?useUnicode=true&characterEncoding=utf8&autoReconnect=true&zeroDateTimeBehavior=convertToNull&transformedBitIsBoolean=true&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai\n          #username: root\n          #password: root\n          #driver-class-name: com.mysql.cj.jdbc.Driver\n  #redis 配置\n  redis:\n    database: 0\n    host: redis\n    lettuce:\n      pool:\n        max-active: 8   #最大连接数据库连接数,设 0 为没有限制\n        max-idle: 8     #最大等待连接中的数量,设 0 为没有限制\n        max-wait: -1ms  #最大建立连接等待时间。如果超过此时间将接到异常。设为-1表示无限制。\n        min-idle: 0     #最小等待连接中的数量,设 0 为没有限制\n      shutdown-timeout: 100ms\n    password:\n    port: 6379\n  #rabbitmq配置\n  rabbitmq:\n    host: rabbitmq\n    username: guest\n    password: guest\n    port: 5672\n    publisher-confirms: true\n    publisher-returns: true\n    virtual-host: /\n    listener:\n      simple:\n        acknowledge-mode: manual\n        #消费者的最小数量\n        concurrency: 1\n        #消费者的最大数量\n        max-concurrency: 1\n        #是否支持重试\n        retry:\n          enabled: true\n#jeecg专用配置\nminidao :\n  base-package: org.jeecg.modules.jmreport.*\n  #DB类型（mysql | postgresql | oracle | sqlserver| other）\n  db-type: mysql\njeecg :\n  # 本地：local\\Minio：minio\\阿里云：alioss\n  uploadType: local\n  path :\n    #文件上传根目录 设置\n    upload: D://opt//upFiles\n    #webapp文件路径\n    webapp: D://opt//webapp\n  shiro:\n    excludeUrls: /test/jeecgDemo/demo3,/test/jeecgDemo/redisDemo/**,/category/**,/visual/**,/map/**,/jmreport/bigscreen2/**\n  #阿里云oss存储配置\n  oss:\n    endpoint: oss-cn-beijing.aliyuncs.com\n    accessKey: ??\n    secretKey: ??\n    bucketName: jeecgdev\n    staticDomain: ??\n  # ElasticSearch 6设置\n  elasticsearch:\n    cluster-name: jeecg-ES\n    cluster-nodes: 127.0.0.1:9200\n    check-enabled: false\n  # 表单设计器配置\n  desform:\n    # 主题颜色（仅支持 16进制颜色代码）\n    theme-color: \"#1890ff\"\n    # 文件、图片上传方式，可选项：qiniu（七牛云）、system（跟随系统配置）\n    upload-type: system\n    map:\n      # 配置百度地图的AK，申请地址：https://lbs.baidu.com/apiconsole/key?application=key#/home\n      baidu: ??\n  # 在线预览文件服务器地址配置\n  file-view-domain: 127.0.0.1:8012\n  # minio文件上传\n  minio:\n    minio_url: minio:9000\n    minio_name: minioadmin\n    minio_pass: minioadmin\n    bucketName: user\n  #大屏报表参数设置\n  jmreport:\n    mode: dev\n    #是否需要校验token\n    is_verify_token: false\n    #必须校验方法\n    verify_methods: remove,delete,save,add,update\n  #Wps在线文档\n  wps:\n    domain: https://wwo.wps.cn/office/\n    appid: ??\n    appsecret: ??\n  #xxl-job配置\n  xxljob:\n    enabled: true\n    adminAddresses: http://jeecg-boot-xxljob:9080/xxl-job-admin\n    appname: ${spring.application.name}\n    accessToken: \'\'\n    logPath: logs/jeecg/job/jobhandler/\n    logRetentionDays: 30\n   #自定义路由配置 yml nacos database\n  route:\n    config:\n      data-id: gateway\n      group: DEFAULT_GROUP\n      data-type: nacos\n  #分布式锁配置\n  redisson:\n    address: jeecg-boot-redis:6379\n    password:\n    type: STANDALONE\n    enabled: true\n#Mybatis输出sql日志\nlogging:\n  level:\n    org.jeecg.modules.system.mapper : info\n#cas单点登录\ncas:\n  prefixUrl: http://localhost:8888/cas\n#swagger\nknife4j:\n  production: false\n  basic:\n    enable: false\n    username: jeecg\n    password: jeecg1314\n\n#第三方登录\njustauth:\n  enabled: true\n  type:\n    GITHUB:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/github/callback\n    WECHAT_ENTERPRISE:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/wechat_enterprise/callback\n      agent-id: 1000002\n    DINGTALK:\n      client-id: ??\n      client-secret: ??\n      redirect-uri: http://sso.test.com:8080/jeecg-boot/thirdLogin/dingtalk/callback\n  cache:\n    type: default\n    prefix: \'demo::\'\n    timeout: 1h\n#第三方APP对接\nthird-app:\n  enabled: false\n  type:\n    #企业微信\n    WECHAT_ENTERPRISE:\n      enabled: false\n      #CORP_ID\n      client-id: ??\n      #SECRET\n      client-secret: ??\n      agent-id: ??\n      #自建应用秘钥（新版企微需要配置）\n      # agent-app-secret: ??\n    #钉钉\n    DINGTALK:\n      enabled: false\n      # appKey\n      client-id: ??\n      # appSecret\n      client-secret: ??\n      agent-id: ??','2f77caefece11c5f97261c55296e2f92','2021-03-03 13:01:11','2022-06-27 03:12:14',NULL,'127.0.0.1','','','','','','yaml',''),
(2,'jeecg.yaml','DEFAULT_GROUP','server:\r\n  tomcat:\r\n    max-swallow-size: -1\r\n  error:\r\n    include-exception: true\r\n    include-stacktrace: ALWAYS\r\n    include-message: ALWAYS\r\n  compression:\r\n    enabled: true\r\n    min-response-size: 1024\r\n    mime-types: application/javascript,application/json,application/xml,text/html,text/xml,text/plain,text/css,image/*\r\nmanagement:\r\n  health:\r\n    mail:\r\n      enabled: false\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \"*\" #暴露所有节点\r\n    health:\r\n      sensitive: true #关闭过滤敏感信息\r\n  endpoint:\r\n    health:\r\n      show-details: ALWAYS  #显示详细信息\r\nspring:\r\n  servlet:\r\n    multipart:\r\n      max-file-size: 10MB\r\n      max-request-size: 10MB\r\n  mail:\r\n    host: smtp.163.com\r\n    username: jeecgos@163.com\r\n    password: ??\r\n    properties:\r\n      mail:\r\n        smtp:\r\n          auth: true\r\n          starttls:\r\n            enable: true\r\n            required: true\r\n  ## quartz定时任务,采用数据库方式\r\n  quartz:\r\n    job-store-type: jdbc\r\n    initialize-schema: embedded\r\n    #设置自动启动，默认为 true\r\n    auto-startup: true\r\n    #启动时更新己存在的Job\r\n    overwrite-existing-jobs: true\r\n    properties:\r\n      org:\r\n        quartz:\r\n          scheduler:\r\n            instanceName: MyScheduler\r\n            instanceId: AUTO\r\n          jobStore:\r\n            class: org.quartz.impl.jdbcjobstore.JobStoreTX\r\n            driverDelegateClass: org.quartz.impl.jdbcjobstore.StdJDBCDelegate\r\n            tablePrefix: QRTZ_\r\n            isClustered: true\r\n            misfireThreshold: 60000\r\n            clusterCheckinInterval: 10000\r\n          threadPool:\r\n            class: org.quartz.simpl.SimpleThreadPool\r\n            threadCount: 10\r\n            threadPriority: 5\r\n            threadsInheritContextClassLoaderOfInitializingThread: true\r\n  #json 时间戳统一转换\r\n  jackson:\r\n    date-format:   yyyy-MM-dd HH:mm:ss\r\n    time-zone:   GMT+8\r\n  aop:\r\n    proxy-target-class: true\r\n  activiti:\r\n    check-process-definitions: false\r\n    #启用作业执行器\r\n    async-executor-activate: false\r\n    #启用异步执行器\r\n    job-executor-activate: false\r\n  jpa:\r\n    open-in-view: false\r\n  #配置freemarker\r\n  freemarker:\r\n    # 设置模板后缀名\r\n    suffix: .ftl\r\n    # 设置文档类型\r\n    content-type: text/html\r\n    # 设置页面编码格式\r\n    charset: UTF-8\r\n    # 设置页面缓存\r\n    cache: false\r\n    prefer-file-system-access: false\r\n    # 设置ftl文件路径\r\n    template-loader-path:\r\n      - classpath:/templates\r\n  # 设置静态文件路径，js,css等\r\n  mvc:\r\n    static-path-pattern: /**\r\n  resource:\r\n    static-locations: classpath:/static/,classpath:/public/\r\n  autoconfigure:\r\n    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure\r\n#mybatis plus 设置\r\nmybatis-plus:\r\n  mapper-locations: classpath*:org/jeecg/modules/**/xml/*Mapper.xml\r\n  global-config:\r\n    # 关闭MP3.0自带的banner\r\n    banner: false\r\n    db-config:\r\n      #主键类型  0:\"数据库ID自增\",1:\"该类型为未设置主键类型\", 2:\"用户输入ID\",3:\"全局唯一ID (数字类型唯一ID)\", 4:\"全局唯一ID UUID\",5:\"字符串全局唯一ID (idWorker 的字符串表示)\";\r\n      id-type: ASSIGN_ID\r\n      # 默认数据库表下划线命名\r\n      table-underline: true\r\n  configuration:\r\n    # 这个配置会将执行的sql打印出来，在开发或测试的时候可以用\r\n    #log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\r\n    # 返回类型为Map,显示null对应的字段\r\n    call-setters-on-nulls: true','d695ddf9b45ff9f8e009803c93650263','2021-03-03 13:01:42','2021-03-03 13:01:42',NULL,'172.17.0.1','','',NULL,NULL,NULL,'yaml',NULL),
(3,'jeecg-gateway-router.json','DEFAULT_GROUP','[{\n  \"id\": \"book\",\n  \"order\": 0,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/sys/**\",\n      \"_genkey_1\": \"/details/**\",\n      \"_genkey_2\": \"/storage/**\",\n      \"_genkey_3\": \"/press/**\",\n      \"_genkey_4\": \"/advertise/**\",\n      \"_genkey_5\": \"/category/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://book\"\n}, {\n  \"id\": \"user\",\n  \"order\": 1,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/permission/**\",\n      \"_genkey_1\": \"/role/**\",\n      \"_genkey_2\": \"/sys/**\",\n      \"_genkey_3\": \"/user/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://user\"\n}, {\n  \"id\": \"system\",\n  \"order\": 2,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/advertise/**\",\n      \"_genkey_1\": \"/message/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb://system\"\n},\n{\n  \"id\": \"jeecg-system-websocket\",\n  \"order\": 3,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/websocket/**\",\n      \"_genkey_1\": \"/eoaSocket/**\",\n      \"_genkey_2\": \"/newsWebsocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-system\"\n}, {\n  \"id\": \"jeecg-demo-websocket\",\n  \"order\": 4,\n  \"predicates\": [{\n    \"name\": \"Path\",\n    \"args\": {\n      \"_genkey_0\": \"/vxeSocket/**\"\n    }\n  }],\n  \"filters\": [],\n  \"uri\": \"lb:ws://jeecg-demo\"\n}]','31173bccaf31383708b22d512aaa94bc','2021-03-03 13:02:14','2022-06-23 11:22:44',NULL,'127.0.0.1','','','','','','json','');

/*Table structure for table `config_info_aggr` */

DROP TABLE IF EXISTS `config_info_aggr`;

CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='增加租户字段';

/*Data for the table `config_info_aggr` */

/*Table structure for table `config_info_beta` */

DROP TABLE IF EXISTS `config_info_beta`;

CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_beta';

/*Data for the table `config_info_beta` */

/*Table structure for table `config_info_tag` */

DROP TABLE IF EXISTS `config_info_tag`;

CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_info_tag';

/*Data for the table `config_info_tag` */

/*Table structure for table `config_tags_relation` */

DROP TABLE IF EXISTS `config_tags_relation`;

CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='config_tag_relation';

/*Data for the table `config_tags_relation` */

/*Table structure for table `group_capacity` */

DROP TABLE IF EXISTS `group_capacity`;

CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='集群、各Group容量信息表';

/*Data for the table `group_capacity` */

/*Table structure for table `his_config_info` */

DROP TABLE IF EXISTS `his_config_info`;

CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  KEY `idx_gmt_create` (`gmt_create`) USING BTREE,
  KEY `idx_gmt_modified` (`gmt_modified`) USING BTREE,
  KEY `idx_did` (`data_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='多租户改造';

/*Data for the table `his_config_info` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `permissions` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE KEY `uk_username_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `roles` */

insert  into `roles`(`username`,`role`) values 
('nacos','ROLE_ADMIN');

/*Table structure for table `tenant_capacity` */

DROP TABLE IF EXISTS `tenant_capacity`;

CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='租户容量信息表';

/*Data for the table `tenant_capacity` */

/*Table structure for table `tenant_info` */

DROP TABLE IF EXISTS `tenant_info`;

CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`) USING BTREE,
  KEY `idx_tenant_id` (`tenant_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='tenant_info';

/*Data for the table `tenant_info` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`username`,`password`,`enabled`) values 
('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
