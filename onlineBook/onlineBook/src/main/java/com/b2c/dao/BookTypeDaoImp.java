package com.b2c.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.stereotype.Component;

import com.b2c.entity.BookType;

/**
 * 
 * 图书的类型
 * @author Administrator
 *
 */
@Component(value="bookTypeDaoImp")
public class BookTypeDaoImp implements IBookTypeDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	
	public List<BookType> selectAllBook(){
		List<BookType> bookTypeList = sqlSessionTemplate.selectList("BookType.selectAllBook");
		return bookTypeList;
	}

	public List<BookType> selectDownSaleBook() {
		List<BookType> bookTypeList = sqlSessionTemplate.selectList("BookType.selectDownSaleBook");
		return bookTypeList;
	}	
	
	/**
	 * 查询图书的类型
	 * @return
	 */
	public BookType selectBookType(String bookType_name){
		BookType bookType = (BookType)sqlSessionTemplate.selectOne("BookType.selectBookType", bookType_name);
		if(bookType==null){
			BookType booktype = new BookType(0,bookType_name);
	    	int insert = sqlSessionTemplate.insert("BookType.addBookType", booktype);
	    	BookType bookTypes = (BookType)sqlSessionTemplate.selectOne("BookType.selectBookType", bookType_name);
	    	return bookTypes;
		}else {
	    	return bookType;
		}
	}
}
