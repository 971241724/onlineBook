package com.b2c.dao;

import java.util.List;

import com.b2c.entity.BookType;

/**
 * 
 * 图书类型的接口
 * @author Administrator
 *
 */
public interface IBookTypeDao {
	/**
	 * 查询所有图书的类型
	 * @return
	 */
	public List<BookType> selectAllBook();
	/**
	 * 查询降价的图书
	 * @return
	 * @author:高群昊
	 */
	public List<BookType> selectDownSaleBook();
	
	/**
	 * 查询图书的类型
	 * @return
	 */
	public BookType selectBookType(String bookType);
}
