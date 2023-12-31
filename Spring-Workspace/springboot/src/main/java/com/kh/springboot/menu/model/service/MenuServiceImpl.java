package com.kh.springboot.menu.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.springboot.menu.model.dao.MenuDao;
import com.kh.springboot.menu.model.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDao menuDao;

	@Override
	public List<Menu> selectMenuList() {
		return menuDao.selectMenuList();
	}

	@Override
	public List<Menu> selectManuListByTypeAndTaste(Map<String, Object> paramMap) {
		return menuDao.selectMenuListByTypeAndTaste(paramMap);
	}

	@Override
	public int insertMenu(Menu menu) {
		return menuDao.insertMenu(menu);
	}

	@Override
	public Menu selectOneMenu(String id) {
		return menuDao.selectOneMenu(id);
	}

	@Override
	public int updateMenu(Menu menu) {
		return menuDao.updateMenu(menu);
	}

	@Override
	public int deleteMenu(String id) {
		return menuDao.deleteMenu(id);
	}

}
