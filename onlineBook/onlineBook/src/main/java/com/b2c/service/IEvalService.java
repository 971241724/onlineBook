package com.b2c.service;

import com.b2c.entity.Eval;
import com.b2c.utils.PageBean;

/**
 * 对图书评价接口
 * @author Administrator
 *
 */
public interface IEvalService {
	 /**
     * 通过用户Id查询评价
     * @param user_id
     * @param pc
     * @param ps
     * @return
     */
	public PageBean<Eval> selectEvalgetUserID(Integer user_id,Integer pc,Integer ps);
	
	/**
	 * 删除图书的评价
	 * @param eval_id
	 * @return
	 */
	public boolean deleteEvalId(Integer eval_id);
	
	/**
	 * 通过图书的Id查询评价
	 * @return
	 */
	public PageBean<Eval> selectEvalgetBookId(Integer book_id,Integer pc,Integer ps);
	/**
	 * 管理员查询所有书的评价
	 * @return
	 */
	public PageBean<Eval> adminSelectEval(Integer pc,Integer ps,Integer book_id);
	/**
	 * 用户添加评价
	 */
	public boolean addEval(Integer user_id,Integer book_id,String eval_content,Double eval_score);
}
