package org_Library_Repository_User;

import java.util.List;

import org_Library_Model_User.issueBookModel;

public interface IssueBookRepository {
	public boolean issue_book(issueBookModel issModel);
	public boolean checkSameBook(int st_id,int b_id);
    public boolean sendRequest(int st_id,int b_id);
    public List<Object[]> viewRequest();
    public List<Object[]> viewRequestSearch(String str);
    public int checkAvailableCopiesBook(int b_id);
}

