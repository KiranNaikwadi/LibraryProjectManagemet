package org_Library_Repository_User;

import java.util.List;

public interface returnBookRepository {
	public List<Object[]> getIssueBooksById(int s_id);
	public boolean returnBookByIssId(int st_id,int iss_id, int b_id,String paid_status);
	public List<Object[]> checkStatus(int st_id);
	public List<Object[]> getToBeReturnBook(int st_id,int b_id,int iss_id);

}
