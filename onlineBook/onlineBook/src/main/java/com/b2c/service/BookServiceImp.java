package com.b2c.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.b2c.dao.IBookDao;
import com.b2c.entity.Book;
import com.b2c.entity.BookType;
import com.b2c.utils.PageBean;

@Component(value="bookServiceImp")
public class BookServiceImp implements IBookService{
    
	@Resource(name="bookDaoImp")
	private IBookDao bookDaoImp;
	/**
	 * 最新出版的书籍
	 */
	public List<Book> selectBookNewTime() {
		return bookDaoImp.selectBookNewTime();
	}
	
	/**
	 * 销量最高的书籍
	 */
	public List<Book> selectBookNumbMax() {
		return bookDaoImp.selectBookNumbMax();
	}

	/**
	 * 获取图书的详细信息
	 */
	public Book getBook_id(String book_id) {
		return bookDaoImp.getBook_id(book_id);
	}
    /**
     *  查询三本类型相同的书籍
     */
	public List<Book> selectLikeBook(Book book) {
		return bookDaoImp.selectLikeBook(book);
	}

	/**
     * 查询图书类型的所有图书+分页
     */
	public PageBean<Book> selectBookType(String book_type, Integer pc, Integer ps) {
		return bookDaoImp.selectBookType(book_type, pc, ps);
	}

	/**
	 * 搜索书籍
	 * @return
	 */
	public Book findBook(String book_name){
		return bookDaoImp.findBook(book_name);
	}
	
	/**
	 * 搜索书籍
	 * @return
	 */
	public PageBean<Book> findBookList(String book_name,Integer pc,Integer ps){
		return bookDaoImp.findBookList(book_name, pc, ps);
	}
	/**
	 * 图书管理员查询图书
	 * @return
	 */
	public PageBean<Book> adminSelectBook(Integer pc,Integer ps){
		return bookDaoImp.adminSelectBook(pc, ps);
	}
	/**
	 * 管理员删除图书
	 * @param book_id
	 * @return
	 */
	public boolean deleteBook(Integer book_id){
		return bookDaoImp.deleteBook(book_id);
	}
	/**
	 * 管理员修改图书
	 */
	public boolean bookAlter(Book book){
		return bookDaoImp.bookAlter(book);
	}
	/**
	 * 管理员修改图书图片
	 */
	public boolean updateBookImage(String book_id,String url){
		return bookDaoImp.updateBookImage(book_id,url);
	}
	/**
	 * 管理员添加图书
	 * @return
	 */
	public boolean adminAddBook(Book book){
		return bookDaoImp.adminAddBook(book);
	}
	/**
	 * 管理员添加图书图片
	 */
	public boolean addBookImage(String book_id,String url){
		return bookDaoImp.addBookImage(book_id, url);
	}
}
