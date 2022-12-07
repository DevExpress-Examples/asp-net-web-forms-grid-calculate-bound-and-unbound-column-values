<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>How to sum values of bound and unbound columns and calculate a total value on the client side</title>
	  <script type="text/javascript" language="javascript">	  	
	  	function CalculateTotal() {
	  		num = 0;
			var topVisibleIndex = grid.GetTopVisibleIndex();
			for (var i = topVisibleIndex; i < topVisibleIndex + grid.GetVisibleRowsOnPage(); i++) {
	  			var name = "txtBox" + i;
	  			var txtBox = eval(name);
  				num += eval(txtBox.GetValue());
	  		}
			lTotal.SetText(num);
	  	}
    </script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" DataSourceID="dataSource" AutoGenerateColumns="False">
				<SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
				<SettingsPager Visible="False" PageSize="20">
				</SettingsPager>
				<Columns>
					<dx:GridViewDataTextColumn VisibleIndex="0" FieldName="ProductID">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn VisibleIndex="1" FieldName="ProductName">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn VisibleIndex="2" FieldName="Count" UnboundType="Integer">
						<DataItemTemplate>
							<dx:ASPxSpinEdit ID="seCount" runat="server" Height="21px" MaxValue="99999" Number="0"
								OnInit="spinEdit_Init">
							</dx:ASPxSpinEdit>
						</DataItemTemplate>
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn VisibleIndex="3" FieldName="UnitPrice">
					</dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Total" UnboundType="Decimal" VisibleIndex="4">
						<DataItemTemplate>
							<dx:ASPxTextBox ID="tbTotal" runat="server" OnInit="tbTotal_Init" ReadOnly="True"
								Width="170px" Text="0">
								<Border BorderStyle="None" />
							</dx:ASPxTextBox>
						</DataItemTemplate>
						<FooterTemplate>
							<dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="lTotal" 
								Text="0">
							</dx:ASPxLabel>
						</FooterTemplate>
					</dx:GridViewDataTextColumn>
				</Columns>
				<TotalSummary>
					<dx:ASPxSummaryItem FieldName="Total" ShowInColumn="Total" SummaryType="Sum" />
				</TotalSummary>
				<Settings ShowFooter="True" />
			</dx:ASPxGridView>
		</div>
		<asp:SqlDataSource ID="dataSource" runat="server" 
			ConnectionString="Data Source=(local);Initial Catalog=Northwind;Integrated Security=True"
			ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice] FROM [Products]">
		</asp:SqlDataSource>
	</form>
</body>
</html>
