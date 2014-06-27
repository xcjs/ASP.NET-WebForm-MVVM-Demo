<%@ Page Title="Account Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
	CodeBehind="Default.aspx.cs" Inherits="MVVMDemo._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<asp:ObjectDataSource runat="server" ID="dataUser" 
		TypeName="MVVMDemo.ViewModels.Account.UserViewModel" DataObjectTypeName="MVVMDemo.ViewModels.Account.UserViewModel" 
		OnObjectCreating="dataUser_OnObjectCreating" SelectMethod="get_User" UpdateMethod="set_User" />
	<asp:FormView runat="server" ID="frmUser" DataSourceID="dataUser" OnModeChanging="frmUser_OnModeChanging">
		<HeaderTemplate>
			<h2>
				Tell us about yourself
			</h2>
		</HeaderTemplate>
		<EmptyDataTemplate>
			<p>
				It doesn't look like you have registered. Would you like to
				<asp:LinkButton runat="server" ID="lnkRegister" EnableViewState="false" CommandName="Edit">register</asp:LinkButton>?
			</p>
		</EmptyDataTemplate>
		<ItemTemplate>
			<address>
				<%# Eval("FirstName")%> <%# Eval("LastName")%>
				<br />
				<%# Eval("Address") %>
				<br />
				<%# Eval("Address2") != null ? Eval("Address2") + "<br />" : null %>
				<%# Eval("City") %>, <%# Eval("State") %>
				<%# Eval("Zip") %>
			</address>
			<p>
				<asp:Button runat="server" ID="btnEdit" Text="Edit" CommandName="Edit" />
			</p>
		</ItemTemplate>
		<EditItemTemplate>
			<table>
				<tbody>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtFirstName">First Name:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtFirstName" Text='<%# Bind("FirstName") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtLastName">Last Name:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtLastName" Text='<%# Bind("LastName") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtLastName">Address:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtAddress" Text='<%# Bind("Address") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtAddress2">Address 2:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtAddress2" Text='<%# Bind("Address2") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtCity">City:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtCity" Text='<%# Bind("City") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtState">State:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtState" Text='<%# Bind("State") %>' />
						</td>
					</tr>
					<tr>
						<td>
							<asp:Label runat="server" AssociatedControlID="txtZip">Zip:</asp:Label>
						</td>
						<td>
							<asp:TextBox runat="server" ID="txtZip" Text='<%# Bind("Zip") %>' />
						</td>
					</tr>
				</tbody>
			</table>
			<p>
				<asp:Button runat="server" ID="btnSave" Text="Save" CommandName="Update" CommandArgument='<%# Eval("ID") %>' />
			</p>
		</EditItemTemplate>
		<FooterTemplate>
		
		</FooterTemplate>
		
	</asp:FormView>
</asp:Content>
