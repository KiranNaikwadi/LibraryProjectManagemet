package org_Library_Service;

import java.util.List;

import org_Library_Model.ShelfModel;
import org_Library_Repository.shelfRepository;
import org_Library_Repository.shelfRepositoryImpl;

public class shelfServiceImpl implements shelfService{
    shelfRepository m=new shelfRepositoryImpl();
	@Override
	public boolean isAddNewShelf(ShelfModel model) {
		return m.isAddNewShelf(model);
	}
	@Override
	public List<ShelfModel> getAllShelf() {
		
		return m.getAllShelf();
	}
	
	public boolean isDeleteShelfById(int shelfid) {
	
		return m.isDeleteShelfById(shelfid);
		
	}
	@Override
	public boolean isUpdateShelf(ShelfModel model) {
		
		return m.isUpdateShelf(model);
	}
	@Override
	public List<ShelfModel> getAllShelf(String str) {
		// TODO Auto-generated method stub
		return m.getAllShelf(str);
	}
	@Override
	public List<ShelfModel> viewUpdateShelfDetails(ShelfModel shelfmodel) {
		// TODO Auto-generated method stub
		return m.viewUpdateShelfDetails(shelfmodel);
	}
	

	
}
