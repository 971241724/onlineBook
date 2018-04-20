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
	 * ���³�����鼮
	 */
	public List<Book> selectBookNewTime() {
		return bookDaoImp.selectBookNewTime();
	}
	
	/**
	 * ������ߵ��鼮
	 */
	public List<Book> selectBookNumbMax() {
		return bookDaoImp.selectBookNumbMax();
	}

	/**
	 * ��ȡͼ�����ϸ��Ϣ
	 */
	public Book getBook_id(String book_id) {
		return bookDaoImp.getBook_id(book_id);
	}
    /**
     *  ��ѯ����������ͬ���鼮
     */
	public List<Book> selectLikeBook(Book book) {
		return bookDaoImp.selectLikeBook(book);
	}

	/**
     * ��ѯͼ�����͵�����ͼ��+��ҳ
     */
	public PageBean<Book> selectBookType(String book_type, Integer pc, Integer ps) {
		return bookDaoImp.selectBookType(book_type, pc, ps);
	}

	/**
	 * �����鼮
	 * @return
	 */
	public Book findBook(String book_name){
		return bookDaoImp.findBook(book_name);
	}
	
	/**
	 * �����鼮
	 * @return
	 */
	public PageBean<Book> findBookList(String book_name,Integer pc,Integer ps){
		return bookDaoImp.findBookList(book_name, pc, ps);
	}
	/**
	 * ͼ�����Ա��ѯͼ��
	 * @return
	 */
	public PageBean<Book> adminSelectBook(Integer pc,Integer ps){
		return bookDaoImp.adminSelectBook(pc, ps);
	}
	/**
	 * ����Աɾ��ͼ��
	 * @param book_id
	 * @return
	 */
	public boolean deleteBook(Integer book_id){
		return bookDaoImp.deleteBook(book_id);
	}
	/**
	 * ����Ա�޸�ͼ��
	 */
	public boolean bookAlter(Book book){
		return bookDaoImp.bookAlter(book);
	}
	/**
	 * ����Ա�޸�ͼ��ͼƬ
	 */
	public boolean updateBookImage(String book_id,String url){
		return bookDaoImp.updateBookImage(book_id,url);
	}
	/**
	 * ����Ա���ͼ��
	 * @return
	 */
	public boolean adminAddBook(Book book){
		return bookDaoImp.adminAddBook(book);
	}
	/**
	 * ����Ա���ͼ��ͼƬ
	 */
	public boolean addBookImage(String book_id,String url){
		return bookDaoImp.addBookImage(book_id, url);
	}
}
