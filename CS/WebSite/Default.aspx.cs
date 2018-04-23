using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;

public partial class _Default : System.Web.UI.Page {
	protected void spinEdit_Init(object sender, EventArgs e) {
		ASPxSpinEdit spin = sender as ASPxSpinEdit;
		GridViewDataItemTemplateContainer container = spin.NamingContainer as GridViewDataItemTemplateContainer;

		
		decimal price = (decimal)DataBinder.Eval(container.DataItem, "UnitPrice");		
		spin.ClientSideEvents.ValueChanged = String.Format("function(s, e) {{ var value = s.GetValue() * {1}; txtBox{0}.SetValue(value); CalculateTotal(); }}", container.VisibleIndex, price);
	}
	protected void tbTotal_Init(object sender, EventArgs e) {
		ASPxTextBox tb = sender as ASPxTextBox;
		GridViewDataItemTemplateContainer container = tb.NamingContainer as GridViewDataItemTemplateContainer;

		tb.ClientInstanceName = String.Format("txtBox{0}", container.VisibleIndex);
	}
}

