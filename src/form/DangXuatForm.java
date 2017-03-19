package form;

import org.apache.struts.action.ActionForm;

public class DangXuatForm extends ActionForm{
	private int pageCurrent=1;

	public int getPageCurrent() {
		return pageCurrent;
	}

	public void setPageCurrent(int pageCurrent) {
		this.pageCurrent = pageCurrent;
	}
	
}
