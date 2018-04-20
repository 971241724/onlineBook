package com.b2c.service;

import java.util.List;

import com.b2c.entity.Order;
import com.b2c.entity.OrderBooks;
import com.b2c.utils.PageBean;

public interface IOrderService {
	/**
	 * ��ӵ��ҵĶ���
	 * @param order
	 * @return
	 */
	public int addMyOrder(List<String> lists, Integer user_id);
	/**
	 * ɾ����������Ϣ
	 * @param order_id
	 * @return
	 */
	public boolean deleteOrder(Integer order_id);
	/**
	 * ɾ������
	 * @param order_id
	 * @return
	 */
	public boolean submitOrder(List<Integer> list, Integer order_id);
	/**
	 * ��ѯ������Ϣ
	 * @param order_id
	 * @return
	 */
	public List<Order> selectSaleBook(Integer user_id);
	/**
	 * �û���ѯ���ж�����Ϣ
	 * @author �߻�
	 * @param user_id
	 * @return
	 */
	public PageBean userSelectAllOrder(Integer user_id,Integer pc,Integer ps);
	/**
	 * ɾ��������Ϣ
	 * @author �߻�
	 * @param order_id
	 * @return
	 */
	public boolean deleteOrderMessage(Integer order_id);
	/**
	 * �޸�����״̬
	 * @author �߻�
	 * @param order_id
	 * @return
	 */
	public boolean alterOrderAccess(Integer order_id);
	/**
	 * ����֧��
	 * @author �߻�
	 */
	public boolean alipayOrder(Integer order_id);
	/**
	 * ����Ա��ѯδ������
	 * @param pc
	 * @param ps
	 * @return
	 */
	public PageBean<Order> findUnDealOrder(Integer pc,Integer ps);
	/**
	 * ����Ա������
	 * @param order_id
	 * @return
	 */
	public boolean adminAddOrder(Integer order_id);
	/**
	 * ����Ա��ѯ�Ѵ�����
	 * @param pc
	 * @param ps
	 * @return
	 */
	public PageBean<Order> findDealedOrder(Integer pc,Integer ps);
}
