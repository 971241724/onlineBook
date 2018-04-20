package com.b2c.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.IBookTypeDao;
import com.b2c.entity.BookType;
/**
 * 
 * 查询所有的书籍
 * @author Administrator
 *
 */
@Component(value="bookTypeServiceImp")
public class BookTypeServiceImp implements IBookTypeService{

	@Resource(name="bookTypeDaoImp")
	private IBookTypeDao bookTypeDaoImp;
	
	
	public List<BookType> selectAllBook() {
		return bookTypeDaoImp.selectAllBook();
	}


	public List<BookType> selectDownSaleBook() {
		return bookTypeDaoImp.selectDownSaleBook();
	}
	
	/**
	 * 查询图书的类型
	 * @return
	 */
	public BookType selectBookType(String bookType_name){
		return bookTypeDaoImp.selectBookType(bookType_name);
	}
}
