package com.xxl.job.admin.core.conf;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * jedi-job config
 *
 * @author xuxueli 2017-04-28
 */
@Configuration
//@PropertySource("classpath:xxl-job-admin.properties")
public class XxlJobAdminConfig implements InitializingBean {
    private static XxlJobAdminConfig adminConfig = null;
    @Value("${xxl.job.mail.host}")
    private String mailHost;
    @Value("${xxl.job.mail.port}")
    private String mailPort;
    @Value("${xxl.job.mail.username}")
    private String mailUsername;
    @Value("${xxl.job.mail.password}")
    private String mailPassword;
    @Value("${xxl.job.mail.sendNick}")
    private String mailSendNick;
    @Value("${xxl.job.login.username}")
    private String loginUsername;
    @Value("${xxl.job.login.password}")
    private String loginPassword;
    @Value("${xxl.job.i18n}")
    private String i18n;

    @Value("${xxl.jobInfo.jobGroup}")
    private int jobGroup;
    @Value("${xxl.jobInfo.jobCronEveryDay}")
    private String jobCronEveryDay;
    @Value("${xxl.jobInfo.jobCronManual}")
    private String jobCronManual;
    @Value("${xxl.jobInfo.executorFailStrategy}")
    private String executorFailStrategy;
    @Value("${xxl.jobInfo.author}")
    private String author;
    @Value("${xxl.jobInfo.alarmEmail}")
    private String alarmEmail;
    @Value("${xxl.jobInfo.executorRouteStrategy}")
    private String executorRouteStrategy;
    @Value("${xxl.jobInfo.glueType}")
    private String glueType;
    @Value("${xxl.jobInfo.executorHandler}")
    private String executorHandler;
    @Value("${xxl.jobInfo.executorBlockStrategy}")
    private String executorBlockStrategy;

    public static XxlJobAdminConfig getAdminConfig() {
        return adminConfig;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        adminConfig = this;
    }

    public String getMailHost() {
        return mailHost;
    }

    public String getMailPort() {
        return mailPort;
    }

    public String getMailUsername() {
        return mailUsername;
    }

    public String getMailPassword() {
        return mailPassword;
    }

    public String getMailSendNick() {
        return mailSendNick;
    }

    public String getLoginUsername() {
        return loginUsername;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public String getI18n() {
        return i18n;
    }

    public int getJobGroup() {
        return jobGroup;
    }

    public String getExecutorRouteStrategy() {
        return executorRouteStrategy;
    }

    public String getGlueType() {
        return glueType;
    }

    public String getExecutorHandler() {
        return executorHandler;
    }

    public String getExecutorBlockStrategy() {
        return executorBlockStrategy;
    }

    public String getJobCronEveryDay() {
        return jobCronEveryDay;
    }

    public String getJobCronManual() {
        return jobCronManual;
    }

    public String getExecutorFailStrategy() {
        return executorFailStrategy;
    }

    public String getAuthor() {
        return author;
    }

    public String getAlarmEmail() {
        return alarmEmail;
    }
}
