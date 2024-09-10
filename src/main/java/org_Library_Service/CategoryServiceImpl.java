package org_Library_Service;

import java.util.List;

import org_Library_Model.CategoryModel;
import org_Library_Model.ShelfModel;
import org_Library_Repository.CategoryRepository;
import org_Library_Repository.CategoryRepositoryImpl;

public class CategoryServiceImpl implements CategoryService{
   CategoryRepository catrepo=new CategoryRepositoryImpl();
	@Override
	public boolean isAddCategory(CategoryModel catmodel,int shelfid) {
		
		return catrepo.isAddCategory(catmodel,shelfid);
	}
	@Override
	public List<Object[]> getAllCategory() {
		return catrepo.getAllCategory();
	}
	@Override
	public boolean isDeleteCategoryById(int categoryid) {
		
		return catrepo.isDeleteCategoryById(categoryid);
	}
	
	public boolean isUpdateCategory(CategoryModel catmodel) {
		return catrepo.isUpdateCategory(catmodel);
	}
	@Override
	public List<Object[]> getAllCategory(String str) {
		// TODO Auto-generated method stub
		return catrepo.getAllCategory(str);
	}
	@Override
	public List<CategoryModel> viewCategoryDetails(CategoryModel catmodel) {
		// TODO Auto-generated method stub
		return catrepo.viewCategoryDetails(catmodel);
	}
	
	
	   
}
