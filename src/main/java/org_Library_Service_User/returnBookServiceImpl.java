package org_Library_Service_User;

import java.util.List;

import org_Library_Repository_User.returnBookRepository;
import org_Library_Repository_User.returnBookRepositoryImpl;

public class returnBookServiceImpl implements returnBookService {
    returnBookRepository retbookrepo=new returnBookRepositoryImpl();
	@Override
	public List<Object[]> getIssueBooksById(int s_id) {
		// TODO Auto-generated method stub
		return retbookrepo.getIssueBooksById(s_id);
	}

	@Override
	public boolean returnBookByIssId(int st_id,int iss_id, int b_id,String paid_status) {
		// TODO Auto-generated method stub
		return retbookrepo.returnBookByIssId(st_id,iss_id, b_id,paid_status);
	}

	@Override
	public List<Object[]> checkStatus(int st_id) {
		// TODO Auto-generated method stub
		return retbookrepo.checkStatus(st_id);
	}

	@Override
	public List<Object[]> getToBeReturnBook(int st_id, int b_id, int iss_id) {
		// TODO Auto-generated method stub
		return retbookrepo.getToBeReturnBook(st_id, b_id, iss_id);
	}

}
