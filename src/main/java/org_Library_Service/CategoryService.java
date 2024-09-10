package org_Library_Service;

import java.util.List;

import org_Library_Model.CategoryModel;
import org_Library_Model.ShelfModel;

public interface CategoryService {
  public boolean isAddCategory(CategoryModel catmodel,int shelfid);
  public List<Object[]> getAllCategory();
  public boolean isDeleteCategoryById(int categoryid);
  public boolean isUpdateCategory(CategoryModel catmodel);
  public List<Object[]> getAllCategory(String str);
  public List<CategoryModel> viewCategoryDetails(CategoryModel catmodel);
}
