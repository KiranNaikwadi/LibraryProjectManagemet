package org_Library_Repository;
import java.util.List;

import org_Library_Model.ShelfModel;
import org_Library_Model.StudentModel;
public interface shelfRepository {
   public boolean isAddNewShelf(ShelfModel model);
   public List<ShelfModel> getAllShelf();
public boolean isDeleteShelfById(int shelfid);
public boolean isUpdateShelf(ShelfModel model);
public List<ShelfModel> getAllShelf(String str);
public List<ShelfModel> viewUpdateShelfDetails(ShelfModel shelfmodel);
}

