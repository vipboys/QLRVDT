package form;

import org.apache.struts.action.ActionForm;

public class AdminFormPDBD extends ActionForm{
	private String valueSearch="";

	public String getValueSearch() {
		return valueSearch;
	}
	public void setValueSearch(String valueSearch) {
		this.valueSearch = valueSearch;
	}	
}
