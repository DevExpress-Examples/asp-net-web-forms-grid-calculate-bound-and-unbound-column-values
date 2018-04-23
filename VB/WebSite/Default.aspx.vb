Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub spinEdit_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim spin As ASPxSpinEdit = TryCast(sender, ASPxSpinEdit)
		Dim container As GridViewDataItemTemplateContainer = TryCast(spin.NamingContainer, GridViewDataItemTemplateContainer)


		Dim price As Decimal = CDec(DataBinder.Eval(container.DataItem, "UnitPrice"))
		spin.ClientSideEvents.ValueChanged = String.Format("function(s, e) {{ var value = s.GetValue() * {1}; txtBox{0}.SetValue(value); CalculateTotal(); }}", container.VisibleIndex, price)
	End Sub
	Protected Sub tbTotal_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim tb As ASPxTextBox = TryCast(sender, ASPxTextBox)
		Dim container As GridViewDataItemTemplateContainer = TryCast(tb.NamingContainer, GridViewDataItemTemplateContainer)

		tb.ClientInstanceName = String.Format("txtBox{0}", container.VisibleIndex)
	End Sub
End Class

