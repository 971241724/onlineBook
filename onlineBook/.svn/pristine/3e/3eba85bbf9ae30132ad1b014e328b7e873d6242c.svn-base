package com.b2c.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Component;

import com.b2c.entity.Eval;
import com.b2c.utils.PageBean;

/**
 * 对图书评价的实体类
 * @author Administrator
 *
 */
@Component(value="evalDaoImp")
public class EvalDaoImp implements IEvalDao{
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	/**
     * 通过用户Id查询评价
     * @param user_id
     * @param pc
     * @param ps
     * @return
     */
	@Test
	public PageBean<Eval> selectEvalgetUserID(Integer user_id, Integer pc,Integer ps) {
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Eval.selectEvalCount", user_id);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		List<Eval> evalList = sqlSessionTemplate.selectList("Eval.selectEvalgetUserID", map);
		PageBean<Eval> page = new PageBean<Eval>(pc,tr,ps,evalList);
		return page;
	}
	/**
	 * 删除图书的评价
	 * @param eval_id
	 * @return
	 */
	public boolean deleteEvalId(Integer eval_id) {
		int delete = sqlSessionTemplate.delete("Eval.deleteEvalId", eval_id);
		if(delete == 1){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 通过图书的Id查询评价
	 * @return
	 */
	public PageBean<Eval> selectEvalgetBookId(Integer book_id,Integer pc,Integer ps){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		map.put("book_id", book_id);
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Eval.selectEvalBookIdCount", book_id);
		List<Eval> evalList = sqlSessionTemplate.selectList("Eval.selectEvalgetBookId", map);
		PageBean<Eval> page = new PageBean<Eval>(pc,tr,ps,evalList);
		return page;
	}
	/**
	 * 管理员查询所有书的评价
	 * @return
	 */
	public PageBean<Eval> adminSelectEval(Integer pc,Integer ps,Integer book_id){
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Eval.adminSelectEvalCount");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		map.put("book_id", book_id);
		List<Eval> evalList = sqlSessionTemplate.selectList("Eval.adminSelectEval", map);
		for(Eval eval : evalList){
			System.out.println(eval);
		}
		PageBean<Eval> page = new PageBean<Eval>(pc,tr,ps,evalList);
		return page;
	}
	/**
	 * 用户添加评价
	 */
	public boolean addEval(Integer user_id,Integer book_id,String eval_content,double eval_score){
		Map<String,Object> map = new HashMap<String, Object>();
		Date date = new Date();
		map.put("user_id", user_id);
		map.put("book_id", book_id);
		map.put("eval_content", eval_content);
		map.put("eval_score", eval_score);
		map.put("eval_time", date);
		map.put("eval_id", 0);
		int insert = sqlSessionTemplate.insert("Eval.addEval", map);
		if(insert == 1){
			return true;
		}else{
			return false;
		}
	}
	
}
