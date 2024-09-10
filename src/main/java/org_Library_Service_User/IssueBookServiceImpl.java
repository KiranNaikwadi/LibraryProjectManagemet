package org_Library_Service_User;

import java.util.List;

import org_Library_Model_User.issueBookModel;
import org_Library_Repository_User.IssueBookRepository;
import org_Library_Repository_User.IssueBookRepositroyImpl;

public class IssueBookServiceImpl implements IssueBookService{
    IssueBookRepository issuerepo=new IssueBookRepositroyImpl();
	@Override
	public boolean issue_book(issueBookModel issModel) {
	
		return issuerepo.issue_book(issModel);
	}
	@Override
	public boolean checkSameBook(int st_id, int b_id) {
		// TODO Auto-generated method stub
		return issuerepo.checkSameBook(st_id, b_id);
	}
	@Override
	public boolean sendRequest(int st_id, int b_id) {
		// TODO Auto-generated method stub
		return issuerepo.sendRequest(st_id, b_id);
	}
	@Override
	public List<Object[]> viewRequest() {
		// TODO Auto-generated method stub
		return issuerepo.viewRequest();
	}
	@Override
	public List<Object[]> viewRequestSearch(String str) {
		// TODO Auto-generated method stub
		return issuerepo.viewRequestSearch(str);
	}
	@Override
	public int checkAvailableCopiesBook(int b_id) {
		// TODO Auto-generated method stub
		return issuerepo.checkAvailableCopiesBook(b_id);
	}
   
}
