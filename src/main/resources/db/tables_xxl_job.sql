CREATE DATABASE IF NOT EXISTS `xxl-job`
  DEFAULT CHARACTER SET utf8
  COLLATE utf8_general_ci;
USE `xxl-job`;


CREATE TABLE XXL_JOB_QRTZ_JOB_DETAILS
(
  SCHED_NAME        VARCHAR(120) NOT NULL,
  JOB_NAME          VARCHAR(200) NOT NULL,
  JOB_GROUP         VARCHAR(200) NOT NULL,
  DESCRIPTION       VARCHAR(250) NULL,
  JOB_CLASS_NAME    VARCHAR(250) NOT NULL,
  IS_DURABLE        VARCHAR(1)   NOT NULL,
  IS_NONCONCURRENT  VARCHAR(1)   NOT NULL,
  IS_UPDATE_DATA    VARCHAR(1)   NOT NULL,
  REQUESTS_RECOVERY VARCHAR(1)   NOT NULL,
  JOB_DATA          BLOB         NULL,
  PRIMARY KEY (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_TRIGGERS
(
  SCHED_NAME     VARCHAR(120) NOT NULL,
  TRIGGER_NAME   VARCHAR(200) NOT NULL,
  TRIGGER_GROUP  VARCHAR(200) NOT NULL,
  JOB_NAME       VARCHAR(200) NOT NULL,
  JOB_GROUP      VARCHAR(200) NOT NULL,
  DESCRIPTION    VARCHAR(250) NULL,
  NEXT_FIRE_TIME BIGINT(13)   NULL,
  PREV_FIRE_TIME BIGINT(13)   NULL,
  PRIORITY       INTEGER      NULL,
  TRIGGER_STATE  VARCHAR(16)  NOT NULL,
  TRIGGER_TYPE   VARCHAR(8)   NOT NULL,
  START_TIME     BIGINT(13)   NOT NULL,
  END_TIME       BIGINT(13)   NULL,
  CALENDAR_NAME  VARCHAR(200) NULL,
  MISFIRE_INSTR  SMALLINT(2)  NULL,
  JOB_DATA       BLOB         NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, JOB_NAME, JOB_GROUP)
  REFERENCES XXL_JOB_QRTZ_JOB_DETAILS (SCHED_NAME, JOB_NAME, JOB_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_SIMPLE_TRIGGERS
(
  SCHED_NAME      VARCHAR(120) NOT NULL,
  TRIGGER_NAME    VARCHAR(200) NOT NULL,
  TRIGGER_GROUP   VARCHAR(200) NOT NULL,
  REPEAT_COUNT    BIGINT(7)    NOT NULL,
  REPEAT_INTERVAL BIGINT(12)   NOT NULL,
  TIMES_TRIGGERED BIGINT(10)   NOT NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES XXL_JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_CRON_TRIGGERS
(
  SCHED_NAME      VARCHAR(120) NOT NULL,
  TRIGGER_NAME    VARCHAR(200) NOT NULL,
  TRIGGER_GROUP   VARCHAR(200) NOT NULL,
  CRON_EXPRESSION VARCHAR(200) NOT NULL,
  TIME_ZONE_ID    VARCHAR(80),
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES XXL_JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_SIMPROP_TRIGGERS
(
  SCHED_NAME    VARCHAR(120)   NOT NULL,
  TRIGGER_NAME  VARCHAR(200)   NOT NULL,
  TRIGGER_GROUP VARCHAR(200)   NOT NULL,
  STR_PROP_1    VARCHAR(512)   NULL,
  STR_PROP_2    VARCHAR(512)   NULL,
  STR_PROP_3    VARCHAR(512)   NULL,
  INT_PROP_1    INT            NULL,
  INT_PROP_2    INT            NULL,
  LONG_PROP_1   BIGINT         NULL,
  LONG_PROP_2   BIGINT         NULL,
  DEC_PROP_1    NUMERIC(13, 4) NULL,
  DEC_PROP_2    NUMERIC(13, 4) NULL,
  BOOL_PROP_1   VARCHAR(1)     NULL,
  BOOL_PROP_2   VARCHAR(1)     NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES XXL_JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_BLOB_TRIGGERS
(
  SCHED_NAME    VARCHAR(120) NOT NULL,
  TRIGGER_NAME  VARCHAR(200) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  BLOB_DATA     BLOB         NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP),
  FOREIGN KEY (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
  REFERENCES XXL_JOB_QRTZ_TRIGGERS (SCHED_NAME, TRIGGER_NAME, TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_CALENDARS
(
  SCHED_NAME    VARCHAR(120) NOT NULL,
  CALENDAR_NAME VARCHAR(200) NOT NULL,
  CALENDAR      BLOB         NOT NULL,
  PRIMARY KEY (SCHED_NAME, CALENDAR_NAME)
);

CREATE TABLE XXL_JOB_QRTZ_PAUSED_TRIGGER_GRPS
(
  SCHED_NAME    VARCHAR(120) NOT NULL,
  TRIGGER_GROUP VARCHAR(200) NOT NULL,
  PRIMARY KEY (SCHED_NAME, TRIGGER_GROUP)
);

CREATE TABLE XXL_JOB_QRTZ_FIRED_TRIGGERS
(
  SCHED_NAME        VARCHAR(120) NOT NULL,
  ENTRY_ID          VARCHAR(95)  NOT NULL,
  TRIGGER_NAME      VARCHAR(200) NOT NULL,
  TRIGGER_GROUP     VARCHAR(200) NOT NULL,
  INSTANCE_NAME     VARCHAR(200) NOT NULL,
  FIRED_TIME        BIGINT(13)   NOT NULL,
  SCHED_TIME        BIGINT(13)   NOT NULL,
  PRIORITY          INTEGER      NOT NULL,
  STATE             VARCHAR(16)  NOT NULL,
  JOB_NAME          VARCHAR(200) NULL,
  JOB_GROUP         VARCHAR(200) NULL,
  IS_NONCONCURRENT  VARCHAR(1)   NULL,
  REQUESTS_RECOVERY VARCHAR(1)   NULL,
  PRIMARY KEY (SCHED_NAME, ENTRY_ID)
);

CREATE TABLE XXL_JOB_QRTZ_SCHEDULER_STATE
(
  SCHED_NAME        VARCHAR(120) NOT NULL,
  INSTANCE_NAME     VARCHAR(200) NOT NULL,
  LAST_CHECKIN_TIME BIGINT(13)   NOT NULL,
  CHECKIN_INTERVAL  BIGINT(13)   NOT NULL,
  PRIMARY KEY (SCHED_NAME, INSTANCE_NAME)
);

CREATE TABLE XXL_JOB_QRTZ_LOCKS
(
  SCHED_NAME VARCHAR(120) NOT NULL,
  LOCK_NAME  VARCHAR(40)  NOT NULL,
  PRIMARY KEY (SCHED_NAME, LOCK_NAME)
);


CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_INFO` (
  `id`                      INT(11)      NOT NULL AUTO_INCREMENT,
  `job_group`               INT(11)      NOT NULL
  COMMENT '执行器主键ID',
  `job_cron`                VARCHAR(128) NOT NULL
  COMMENT '任务执行CRON',
  `job_desc`                VARCHAR(255) NOT NULL,
  `add_time`                DATETIME              DEFAULT NULL,
  `update_time`             DATETIME              DEFAULT NULL,
  `author`                  VARCHAR(64)           DEFAULT NULL
  COMMENT '作者',
  `alarm_email`             VARCHAR(255)          DEFAULT NULL
  COMMENT '报警邮件',
  `executor_route_strategy` VARCHAR(50)           DEFAULT NULL
  COMMENT '执行器路由策略',
  `executor_handler`        VARCHAR(255)          DEFAULT NULL
  COMMENT '执行器任务handler',
  `executor_param`          VARCHAR(512)          DEFAULT NULL
  COMMENT '执行器任务参数',
  `executor_block_strategy` VARCHAR(50)           DEFAULT NULL
  COMMENT '阻塞处理策略',
  `executor_fail_strategy`  VARCHAR(50)           DEFAULT NULL
  COMMENT '失败处理策略',
  `glue_type`               VARCHAR(50)  NOT NULL
  COMMENT 'GLUE类型',
  `glue_source`             TEXT COMMENT 'GLUE源代码',
  `glue_remark`             VARCHAR(128)          DEFAULT NULL
  COMMENT 'GLUE备注',
  `glue_updatetime`         DATETIME              DEFAULT NULL
  COMMENT 'GLUE更新时间',
  `child_jobid`             VARCHAR(255)          DEFAULT NULL
  COMMENT '子任务ID，多个逗号分隔',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT '任务信息';

CREATE TABLE `CUBE_INFO` (
  `cube_id`       VARCHAR(50) NOT NULL
  COMMENT '立方编号',
  `cube_name`     VARCHAR(50) DEFAULT NULL
  COMMENT '立方名称',
  `trigger_model` VARCHAR(50) DEFAULT 'EVERY_DAY'
  COMMENT '触发模式 EVERY_DAY - 每天 , MANUAL - 手动',
  PRIMARY KEY (`cube_id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT '数据立方信息';

CREATE TABLE `CUBE_SOURCE_TABLE` (
  ##基础信息
  `id`                     INT(11)      NOT NULL AUTO_INCREMENT,
  `cube_id`                VARCHAR(50)  NOT NULL
  COMMENT '立方编号',
  `primary_table`          TINYINT(2)   NOT NULL
  COMMENT '是否为主表 0-不是 1-是',
  `table_name`             VARCHAR(255) NOT NULL
  COMMENT '表名',
  `incr_field_name`        VARCHAR(255) COMMENT '增量字段名',
  ##并行度设置
  `parallelism`            INT(11)               DEFAULT 0
  COMMENT '并行度',
  `parallelism_field_name` VARCHAR(255) COMMENT '并行分区字段名',
  `parallelism_type`       INT(11) COMMENT '并行分区类型 1-时间类型 2-数字类型',
  ##jdbc设置
  `jdbc_url`               VARCHAR(255) NOT NULL
  COMMENT '数据库连接',
  `jdbc_username`          VARCHAR(255) NOT NULL
  COMMENT '访问账号',
  `jdbc_password`          VARCHAR(255) NOT NULL
  COMMENT '访问密码',
  `jdbc_driver`            VARCHAR(255) NOT NULL
  COMMENT 'jdbc驱动',
  `jdbc_fetchsize`         INT(11)      NOT NULL
  COMMENT '批量读取数量',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT '数据立方源表信息';

CREATE TABLE `CUBE_DIMENSION_INFO` (
  ##基础信息
  `id`             INT(11)       NOT NULL AUTO_INCREMENT,
  `cube_id`        VARCHAR(50)   NOT NULL
  COMMENT '立方编号',
  `table_name`     VARCHAR(255)  NOT NULL
  COMMENT '表名',
  `description`    VARCHAR(255) COMMENT '维度描述',
  `select_sql`     VARCHAR(5000) NOT NULL
  COMMENT 'select语句',
  `where_sql`      VARCHAR(5000) NOT NULL
  COMMENT 'where语句',
  `groupby_sql`    VARCHAR(5000) NOT NULL
  COMMENT 'groupby语句',
  `having_sql`     VARCHAR(5000) NULL
  COMMENT 'having语句',
  `save_mode`      INT(11)       NOT NULL
  COMMENT '保存模式 1-Append/2-Overwrite/3-ErrorIfExists/4-Ignore',
  `job_id`         INT(11)       NOT NULL
  COMMENT '任务Id',
  ##jdbc设置
  `jdbc_url`       VARCHAR(255)  NOT NULL
  COMMENT '数据库连接',
  `jdbc_username`  VARCHAR(255)  NOT NULL
  COMMENT '访问账号',
  `jdbc_password`  VARCHAR(255)  NOT NULL
  COMMENT '访问密码',
  `jdbc_driver`    VARCHAR(255)  NOT NULL
  COMMENT 'jdbc驱动',
  `jdbc_batchsize` INT(11)       NOT NULL
  COMMENT '批量执行数量',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT '数据立方维度信息';

CREATE TABLE `CUBE_DIMENSION_EXEC_LOG` (
  `id`                  INT(11)     NOT NULL AUTO_INCREMENT,
  `cube_id`             VARCHAR(50) NOT NULL
  COMMENT '立方编号',
  `dim_id`              INT(11)     NOT NULL
  COMMENT '维度编号',
  `job_id`              INT(11)     NOT NULL
  COMMENT '任务ID',
  `statistical_time`    DATETIME    NOT NULL DEFAULT now()
  COMMENT '执行统计时间',
  `business_start_time` DATETIME    NULL     DEFAULT NULL
  COMMENT '业务开始时间',
  `business_end_time`   DATETIME    NULL     DEFAULT NULL
  COMMENT '业务结束时间',
  `job_log_id`          INT(11)     NOT NULL
  COMMENT '任务执行编号',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT '数据立方维度执行日志';


CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_LOG` (
  `id`               INT(11)      NOT NULL AUTO_INCREMENT,
  `job_group`        INT(11)      NOT NULL
  COMMENT '执行器主键ID',
  `job_id`           INT(11)      NOT NULL
  COMMENT '任务，主键ID',
  `glue_type`        VARCHAR(50)           DEFAULT NULL
  COMMENT 'GLUE类型',
  `executor_address` VARCHAR(255)          DEFAULT NULL
  COMMENT '执行器地址，本次执行的地址',
  `executor_handler` VARCHAR(255)          DEFAULT NULL
  COMMENT '执行器任务handler',
  `executor_param`   VARCHAR(512)          DEFAULT NULL
  COMMENT '执行器任务参数',
  `trigger_time`     DATETIME              DEFAULT NULL
  COMMENT '调度-时间',
  `trigger_code`     VARCHAR(255) NOT NULL DEFAULT '0'
  COMMENT '调度-结果',
  `trigger_msg`      VARCHAR(2048)         DEFAULT NULL
  COMMENT '调度-日志',
  `handle_time`      DATETIME              DEFAULT NULL
  COMMENT '执行-时间',
  `handle_code`      VARCHAR(255) NOT NULL DEFAULT '0'
  COMMENT '执行-状态',
  `handle_msg`       VARCHAR(2048)         DEFAULT NULL
  COMMENT '执行-日志',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_LOGGLUE` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `job_id`      INT(11)      NOT NULL
  COMMENT '任务，主键ID',
  `glue_type`   VARCHAR(50)           DEFAULT NULL
  COMMENT 'GLUE类型',
  `glue_source` TEXT COMMENT 'GLUE源代码',
  `glue_remark` VARCHAR(128) NOT NULL
  COMMENT 'GLUE备注',
  `add_time`    TIMESTAMP    NULL     DEFAULT NULL,
  `update_time` TIMESTAMP    NULL     DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE XXL_JOB_QRTZ_TRIGGER_REGISTRY (
  `id`             INT(11)      NOT NULL AUTO_INCREMENT,
  `registry_group` VARCHAR(255) NOT NULL,
  `registry_key`   VARCHAR(255) NOT NULL,
  `registry_value` VARCHAR(255) NOT NULL,
  `update_time`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `XXL_JOB_QRTZ_TRIGGER_GROUP` (
  `id`           INT(11)     NOT NULL AUTO_INCREMENT,
  `app_name`     VARCHAR(64) NOT NULL
  COMMENT '执行器AppName',
  `title`        VARCHAR(12) NOT NULL
  COMMENT '执行器名称',
  `order`        TINYINT(4)  NOT NULL DEFAULT '0'
  COMMENT '排序',
  `address_type` TINYINT(4)  NOT NULL DEFAULT '0'
  COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` VARCHAR(512)         DEFAULT NULL
  COMMENT '执行器地址列表，多地址逗号分隔',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

INSERT INTO `XXL_JOB_QRTZ_TRIGGER_GROUP` (`app_name`, `title`, `order`, `address_type`, `address_list`)
VALUES ('xxl-job-executor-sample', '示例执行器', '1', '0', NULL);

COMMIT;

