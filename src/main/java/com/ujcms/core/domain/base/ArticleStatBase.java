package com.ujcms.core.domain.base;

/**
 * This class was generated by MyBatis Generator.
 *
 * @author MyBatis Generator
 */
public class ArticleStatBase {
    /**
     * 数据库表名
     */
    public static final String TABLE_NAME = "article_stat";

    /**
     * 文章ID
     */
    private int articleId = 0;

    /**
     * 统计日
     */
    private int statDay = 0;

    /**
     * 浏览次数
     */
    private int views = 0;

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getStatDay() {
        return statDay;
    }

    public void setStatDay(int statDay) {
        this.statDay = statDay;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }
}