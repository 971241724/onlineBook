package com.b2c.dao;

import java.util.List;

import com.b2c.entity.BookType;

/**
 * 
 * ͼ�����͵Ľӿ�
 * @author Administrator
 *
 */
public interface IBookTypeDao {
	/**
	 * ��ѯ����ͼ�������
	 * @return
	 */
	public List<BookType> selectAllBook();
	/**
	 * ��ѯ���۵�ͼ��
	 * @return
	 * @author:��Ⱥ�
	 */
	public List<BookType> selectDownSaleBook();
	
	/**
	 * ��ѯͼ�������
	 * @return
	 */
	public BookType selectBookType(String bookType);
}