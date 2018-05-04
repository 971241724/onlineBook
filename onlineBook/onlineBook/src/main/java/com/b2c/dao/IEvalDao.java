package com.b2c.dao;

import com.b2c.entity.Eval;
import com.b2c.utils.PageBean;

/**
 * ͼ�����۵Ľӿ�
 * @author Administrator
 *
 */
public interface IEvalDao {
    /**
     * ͨ���û�Id��ѯ����
     * @param user_id
     * @param pc
     * @param ps
     * @return
     */
	public PageBean<Eval> selectEvalgetUserID(Integer user_id,Integer pc,Integer ps);
	/**
	 * ɾ��ͼ�������
	 * @param eval_id
	 * @return
	 */
	public boolean deleteEvalId(Integer eval_id);
	/**
	 * ͨ��ͼ���Id��ѯ����
	 * @return
	 */
	public PageBean<Eval> selectEvalgetBookId(Integer book_id,Integer pc,Integer ps);
	/**
	 * ����Ա��ѯ�����������
	 * @return
	 */
	public PageBean<Eval> adminSelectEval(Integer pc,Integer ps,Integer book_id);
	/**
	 * �û���������
	 */
	public boolean addEval(Integer user_id,Integer book_id,String eval_content,double eval_score);
}