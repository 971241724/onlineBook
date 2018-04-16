package com.b2c.service;

import java.util.List;

import com.b2c.entity.Book;
import com.b2c.entity.BookType;
import com.b2c.utils.PageBean;

public interface IBookService {
	/**
	 * 最新出版的书籍
	 * @return
	 */
	public List<Book> selectBookNewTime();
	/**
	 * 销量最高的书籍
	 * @return
	 */
	public List<Book> selectBookNumbMax();
	/**
	 * 获取本书的详细信息
	 * @param book_id
	 * @return
	 */
	public Book getBook_id(String book_id);
	/**
	 * 查询三本类型相同的书籍
	 */
	public List<Book> selectLikeBook(Book book);
	/**
     * 查询图书类型的所有图书+分页
     * @return
     */
	public PageBean<Book> selectBookType(String book_type,Integer pc,Integer ps);
	/**
	 * 搜索书籍
	 * @return
	 */
	public Book findBook(String book_name);
	/**
	 * 搜索书籍
	 * @return
	 */
	public PageBean<Book> findBookList(String book_name,Integer pc,Integer ps);
	/**
	 * 图书管理员查询图书
	 * @return
	 */
	public PageBean<Book> adminSelectBook(Integer pc,Integer ps);
	/**
	 * 管理员删除图书
	 * @param book_id
	 * @return
	 */
	public boolean deleteBook(Integer book_id);
	/**
	 * 管理员修改图书
	 */
	public boolean bookAlter(Book book);
	/**
	 * 管理员修改图书图片
	 */
	public boolean updateBookImage(String book_id,String url);
	/**
	 * 管理员添加图书
	 * @return
	 */
	public boolean adminAddBook(Book book);
	/**
	 * 管理员添加图书图片
	 */
	public boolean addBookImage(String book_id,String url);
}
