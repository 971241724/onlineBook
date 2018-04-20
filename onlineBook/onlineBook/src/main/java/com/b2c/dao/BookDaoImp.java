package com.b2c.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.b2c.entity.Book;
import com.b2c.entity.BookType;
import com.b2c.utils.PageBean;

@Component(value="bookDaoImp")
public class BookDaoImp implements IBookDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSession sqlSessionTemplate;
	/**
	 * 最新出版的书籍
	 */
	public List<Book> selectBookNewTime() {
		List<Book> bookList = sqlSessionTemplate.selectList("Book.selectBookNewTime");
		return bookList;
	}

	/**
	 * 销量最高的书籍
	 */
	public List<Book> selectBookNumbMax() {
		List<Book> bookListMax = sqlSessionTemplate.selectList("Book.selectBookNumbMax");
		return bookListMax;
	}

	/**
	 * 获取图书的详细信息
	 */
	public Book getBook_id(String book_id) {
		Book book = (Book)sqlSessionTemplate.selectOne("Book.getBook_id", book_id);
		return book;
	}

	/**
	 * 查询三本类型相同的书籍
	 */
	public List<Book> selectLikeBook(Book book) {
		List<Book> bookListLike = sqlSessionTemplate.selectList("Book.selectLikeBook", book);
		return bookListLike;
	}
    /**
     * 查询图书类型的所有图书+分页
     * @return
     */
	public PageBean<Book> selectBookType(String book_type,Integer pc,Integer ps){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("book_type", book_type);
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Book.selectSum",book_type);
		List<Book> bookList = sqlSessionTemplate.selectList("Book.selectBookType", map);
		PageBean<Book> page = new PageBean<Book>(pc,tr,ps,bookList);
		return page;
	}
	/**
	 * 搜索书籍
	 * @return
	 */
	public Book findBook(String book_name){
		Book book = (Book)sqlSessionTemplate.selectOne("Book.findBook", book_name);
		return book;
	}
	/**
	 * 搜索书籍
	 * @return
	 */
	public PageBean<Book> findBookList(String book_name,Integer pc,Integer ps){
		PageBean<Book> page = null;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		map.put("book_name", book_name);
		List<Book> bookList = sqlSessionTemplate.selectList("Book.findBookList", map);
		for(Book book : bookList){
			System.out.println(book+"123");
		}
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Book.findBookCount");
		page = new PageBean<Book>(pc,tr,ps,book_name,bookList);
		return page;
	}
	/**
	 * 图书管理员查询图书
	 * @return
	 */
	public PageBean<Book> adminSelectBook(Integer pc,Integer ps){
		Integer tr = (Integer)sqlSessionTemplate.selectOne("Book.adminSelectBookCount");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startPc", (pc-1)*ps);
		map.put("ps", ps);
		List<Book> bookList = sqlSessionTemplate.selectList("Book.adminSelectBook", map);
		PageBean<Book> page = new PageBean<Book>(pc,tr,ps,bookList);
		return page;
	}
	/**
	 * 管理员删除图书
	 * @param book_id
	 * @return
	 */
	public boolean deleteBook(Integer book_id){
		int delete = sqlSessionTemplate.delete("Book.deleteBook", book_id);
		if(delete == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 管理员修改图书
	 */
	public boolean bookAlter(Book book){
		int update = sqlSessionTemplate.update("Book.updateBook", book);
		if(update == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 管理员修改图书图片
	 */
	public boolean updateBookImage(String book_id,String url){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("book_id", book_id);
		map.put("url", url);
		int update = sqlSessionTemplate.update("Book.updateBookImage", map);
		if(update == 1){
			return true;
		}else {
			return false;
		}
	}
	/**
	 * 管理员添加图书
	 * @return
	 */
	public boolean adminAddBook(Book book){
		int insert = sqlSessionTemplate.insert("Book.adminAddBook", book);
		if(insert == 1){
			return true;
		}else{
			return false;
		}
	}
	/**
	 * 管理员添加图书图片
	 */
	public boolean addBookImage(String book_id,String url){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("book_id", book_id);
		map.put("url", url);
		int update = sqlSessionTemplate.update("Book.updateBookImage", map);
		if(update == 1){
			return true;
		}else {
			return false;
		}
	}
	
}
