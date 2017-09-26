-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema weiqiumi
-- -----------------------------------------------------
-- 魏秋蜜后台数据库

-- -----------------------------------------------------
-- Schema weiqiumi
--
-- 魏秋蜜后台数据库
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `weiqiumi` DEFAULT CHARACTER SET utf8 ;
USE `weiqiumi` ;

-- -----------------------------------------------------
-- Table `weiqiumi`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weiqiumi`.`questions` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` VARCHAR(1000) NOT NULL COMMENT '题目',
  `image` VARCHAR(300) NULL COMMENT '相关图片',
  `answer` VARCHAR(10) NOT NULL COMMENT '正确答案',
  `optiionlist` VARCHAR(1000) NOT NULL COMMENT '选项列表',
  `difficulty` VARCHAR(10) NOT NULL COMMENT '难度',
  `type` VARCHAR(20) NOT NULL COMMENT '题型',
  `typevalue` VARCHAR(50) NOT NULL COMMENT '题型值',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = '试题表';


-- -----------------------------------------------------
-- Table `weiqiumi`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weiqiumi`.`users` (
  `openid` VARCHAR(1000) NOT NULL COMMENT '用户ID',
  `name` VARCHAR(100) NULL COMMENT '微信昵称',
  `dongqiudiID` VARCHAR(45) NULL COMMENT '懂球帝账号',
  `hupuID` VARCHAR(45) NULL COMMENT '虎扑账号',
  `tiebaID` VARCHAR(45) NULL COMMENT '贴吧账号',
  `weiboID` VARCHAR(45) NULL COMMENT '微博账号',
  PRIMARY KEY (`openid`))
ENGINE = InnoDB
COMMENT = '用户';


-- -----------------------------------------------------
-- Table `weiqiumi`.`testhistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weiqiumi`.`testhistory` (
  `openid` VARCHAR(1000) NOT NULL COMMENT '用户ID',
  `date` DATE NOT NULL COMMENT '日期',
  `times` INT NOT NULL COMMENT '测试次数，第N次',
  `rightnum` INT NULL COMMENT '正确数量',
  `wrongnum` INT NULL COMMENT '错误数量',
  `timestart` TIME NULL COMMENT '开始时间',
  `timeend` TIME NULL COMMENT '结束时间',
  `timecost` INT NULL COMMENT '耗时（秒）',
  `mark` INT NULL COMMENT '分数',
  `type` VARCHAR(20) NULL COMMENT '题型',
  `typevalue` VARCHAR(50) NULL COMMENT '题型值',
  PRIMARY KEY (`openid`, `date`, `times`),
  INDEX `fk_testhistory_user1_idx` (`openid` ASC),
  CONSTRAINT `fk_testhistory_user1`
    FOREIGN KEY (`openid`)
    REFERENCES `weiqiumi`.`users` (`openid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '测试历史';


-- -----------------------------------------------------
-- Table `weiqiumi`.`payhistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weiqiumi`.`payhistory` (
  `openid` VARCHAR(1000) NOT NULL COMMENT '用户ID',
  `date` DATE NOT NULL COMMENT '日期',
  `times` INT NOT NULL COMMENT '支付次数，第N次',
  `amount` FLOAT NULL COMMENT '金额',
  PRIMARY KEY (`openid`, `date`, `times`),
  INDEX `fk_payhistory_user1_idx` (`openid` ASC),
  CONSTRAINT `fk_payhistory_user1`
    FOREIGN KEY (`openid`)
    REFERENCES `weiqiumi`.`users` (`openid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '支付历史';


-- -----------------------------------------------------
-- Table `weiqiumi`.`gradehistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weiqiumi`.`gradehistory` (
  `openid` VARCHAR(1000) NOT NULL COMMENT '用户ID',
  `date` DATE NOT NULL,
  `times` INT NOT NULL,
  `grade` INT NULL,
  `type` VARCHAR(20) NULL,
  `typevalue` VARCHAR(50) NULL,
  PRIMARY KEY (`openid`, `date`, `times`),
  INDEX `fk_gradehistory_user1_idx` (`openid` ASC),
  CONSTRAINT `fk_gradehistory_user1`
    FOREIGN KEY (`openid`)
    REFERENCES `weiqiumi`.`users` (`openid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '评级历史';


-- -----------------------------------------------------
-- Table `weiqiumi`.`invitecode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `weiqiumi`.`invitecode` (
  `code` VARCHAR(100) NOT NULL COMMENT '邀请码',
  `openid` VARCHAR(1000) NULL,
  `enable` INT NOT NULL COMMENT '有效值',
  PRIMARY KEY (`code`),
  INDEX `fk_invitecode_user_idx` (`openid` ASC),
  CONSTRAINT `fk_invitecode_user`
    FOREIGN KEY (`openid`)
    REFERENCES `weiqiumi`.`users` (`openid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '邀请码';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
