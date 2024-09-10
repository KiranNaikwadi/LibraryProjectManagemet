package org_Library_Service;
import java.util.List;

import org_Library_Model.ShelfModel;
public interface shelfService {
	   public boolean isAddNewShelf(ShelfModel model);
	   public List<ShelfModel> getAllShelf();
	   public boolean isDeleteShelfById(int shelfid);
	   public boolean isUpdateShelf(ShelfModel model);
	   public List<ShelfModel> getAllShelf(String str);
	   public List<ShelfModel> viewUpdateShelfDetails(ShelfModel shelfmodel);
	}

