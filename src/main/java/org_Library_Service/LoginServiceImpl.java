package org_Library_Service;

import org_Library_Repository.LoginRepository;
import org_Library_Repository.LoginRepositoryImpl;

public class LoginServiceImpl implements LoginService{
  LoginRepository logrepo =new LoginRepositoryImpl();
	@Override
	public int verifyAdmin(String username, String password) {
		 return logrepo.verifyAdmin(username,password);
	}

	@Override
	public int verifyUser(String username, String password) {
		// TODO Auto-generated method stub
		return logrepo.verifyUser(username, password);
	}
	


}
