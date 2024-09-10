package org_Library_Service_User;

import java.util.List;

import org_Library_Repository_User.BookRepositoryUser;
import org_Library_Repository_User.BookRepositoryUserImpl;

public class BookServiceUserImpl implements BookServiceUser{
  BookRepositoryUser bookuserrepo=new BookRepositoryUserImpl();
	@Override
	public List<Object[]> searchByBookAttribute(String str) {
		// TODO Auto-generated method stub
		return bookuserrepo.searchByBookAttribute(str);
	}

}
